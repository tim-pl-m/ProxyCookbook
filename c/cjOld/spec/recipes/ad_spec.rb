# Copyright 2015 adesso AG
#
# All rights reserved - Do Not Redistribute
#

require_relative "../spec_helper.rb"

describe "ciexjenkins::ad" do
  before do
    privateKey = "MIICXgIBAAKBgQC3NJ/CEWk6fC0hjOA9I7YfkQdKRzLCaK6lrfp1f1/XVETS7miV"\
"yEHUMM0YgnmdWGFK9F2uuc79EAsIqBc+Kb2NCZOXURpTBPQJL9K2sumciNOpGBK9"\
"H/Od7l+TCz6DDcqwPuHzWmntPdPQcRaUHsh/hH7dlK9i9xXxBm5AZ59QbwIDAQAB"\
"AoGBAJJKpzdkh8530eH0iCrKFWfnexbI+7NZu/v4jQK+D132oG5+iWzxV/+EaIGl"\
"zk7if+5Ga3hWTv6sjOMAtm6hDgXvIMyL7rTOd+gGWIXO0UFIHqkYjqJaYxUzToiw"\
"RAEAspzh5jtaSUpuiRAAFfdrMjzm6zLkYN0a2oVCtIvgBuyhAkEA/KYLUXX67MX2"\
"Li8fbHyitBjWAjqx1SR/uqPxyy5E19SKo7lyB2uiobgum/qHOw5oECT2IiMX8F5W"\
"6+42gwKf6wJBALmiww7Aa3DbGKuAMVoTb2KS8LbTeH4llpaltuXLtjvQZMlhda3X"\
"bVe982I4SdsW8Ddb8yabtHTnJm9L3AE0tI0CQG7jAbyzJ3qcODx0+jnHSjH5ZJR9"\
"5mdCKb1lD0659AU2h9LsJZwUJcEM8YgMISZOYGYVkuHQvUUGYugSGWLO2BkCQQCq"\
"1rB+bfUy2l+8zXAdvo8ef65KAxn7ten9YCqPFsfyChoG/stHHmABhM1s0fKeT2Dp"\
"AZUnLdqIT4YenQiuj2utAkEAp9TtS+eEATBLPEqvQH/Fl7WwriTWHw0B8j+YpSof"\
"XOdlcV2h1/Wzxe/dwJ/hi0p1Ra8cVFGy45saAvmFKZvIEg=="

    allow(Chef::EncryptedDataBagItem).to receive(:load).with('dev', 'credentials').and_return(
    {
      'ad'=> {
        'username'=> "test",
        'password'=> "test123"
      },
      'jenkins_cli'=> {
        'username'=> "test",
        'private_key'=> privateKey
      }
    }
    )
  end

  context "install plugins disabled and security disabled" do
    cached(:chef_run) do
      ChefSpec::ServerRunner.new do |node|
        node.set["ciexjenkins"]["install_plugins"] = false
        node.set["ciexjenkins"]["ad"]["domain"] = "adesso"
        node.set["ciexjenkins"]["ad"]["site"] = "BER"
        node.set["ciexjenkins"]["ad"]["bindName"] = "chuck"
        node.set["ciexjenkins"]["ad"]["server"] = "erich"
      end.converge(described_recipe)
    end

    describe "active-directory plugin" do
      it "installs the ad plugin" do
        expect(chef_run).to install_jenkins_plugin("active-directory")
      end

      it "notifies jenkins to restart after the plugin is installed" do
        expect(chef_run.find_resource("jenkins_plugin", "active-directory")).to(
        notify("service[jenkins]").to(:restart)
        )
      end
    end

    describe "jenkins authentication" do
      it "does not set the private key" do
        expect(chef_run).not_to run_ruby_block("set jenkins private key")
      end
    end

    describe "jenkins user" do
      it "creates a jenkins user" do
        expect(chef_run).to create_jenkins_user("test")
        expect(chef_run.find_resource("jenkins_user", "test")).to(
        notify("jenkins_script[add_authentication]").to(:execute)
        )
      end
    end

    describe "jenkins configuration" do
      it "executes the groovy script for ad config" do
        expect(chef_run.find_resource("jenkins_script", "add_authentication")).to(
        notify("ruby_block[set the security_enabled flag]").to(:run)
        )
      end
    end
    
    describe "jenkins script" do
      it "will be not executed" do
        expect(chef_run).not_to execute_jenkins_script("add_authentication")
      end
    end
    
    describe "setting security_enabled flag" do
      it "will be not set" do
        expect(chef_run).not_to run_ruby_block("set the security_enabled flag")
      end
    end
  end

  context "install plugins enabled and plugin list contains the active directory plugin" do
    cached(:chef_run) do
      ChefSpec::ServerRunner.new do |node|
        node.set["ciexjenkins"]["ad"]["domain"] = "adesso"
        node.set["ciexjenkins"]["ad"]["site"] = "BER"
        node.set["ciexjenkins"]["ad"]["bindName"] = "chuck"
        node.set["ciexjenkins"]["ad"]["server"] = "erich"
      end.converge(described_recipe)
    end

    describe "jenkins authentication" do
      it "does not set the private key" do
        expect(chef_run).not_to run_ruby_block("set jenkins private key")
      end
    end

    describe "jenkins user" do
      it "creates a jenkins user" do
        expect(chef_run).to create_jenkins_user("test")
        expect(chef_run.find_resource("jenkins_user", "test")).to(
        notify("jenkins_script[add_authentication]").to(:execute)
        )
      end
    end

    describe "jenkins configuration" do
      it "executes the groovy script for ad config" do
        expect(chef_run.find_resource("jenkins_script", "add_authentication")).to(
        notify("ruby_block[set the security_enabled flag]").to(:run)
        )
      end
    end
  end

  context "security enabled" do
    cached(:chef_run) do
      ChefSpec::ServerRunner.new do |node|
        node.set["ciexjenkins"]["install_plugins"] = false
        node.set["ciexjenkins"]["ad"]["domain"] = "adesso"
        node.set["ciexjenkins"]["ad"]["site"] = "BER"
        node.set["ciexjenkins"]["ad"]["bindName"] = "chuck"
        node.set["ciexjenkins"]["ad"]["server"] = "erich"
        node.set["security_enabled"] = true
      end.converge(described_recipe)
    end

    describe "jenkins authentication" do
      it "sets the private key" do
        expect(chef_run).to run_ruby_block("set jenkins private key")
      end
    end

    describe "jenkins user" do
      it "does not create a jenkins user" do
        expect(chef_run).not_to create_jenkins_user("test")
        expect(chef_run.find_resource("jenkins_user", "test")).not_to(
        notify("jenkins_script[add_authentication]").to(:execute)
        )
      end
    end

    describe "jenkins configuration" do
      it "does not execute the groovy script for ad config" do
        expect(chef_run.find_resource("jenkins_script", "add_authentication")).not_to(
        notify("ruby_block[set the security_enabled flag]").to(:run)
        )
      end
    end
  end
end
