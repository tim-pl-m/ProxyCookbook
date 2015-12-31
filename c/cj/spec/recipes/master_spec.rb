# Copyright 2014,2015 adesso AG
#
# All rights reserved - Do Not Redistribute
#

require_relative '../spec_helper.rb'

describe 'ciexjenkins::master' do
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

  context "with default settings" do
    let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

    it "includes java cookbooks" do
      expect(chef_run).to include_recipe("java::default")
      expect(chef_run).to include_recipe("java::set_java_home")
    end

    it "includes the jenkins community cookbook" do
      expect(chef_run).to include_recipe("jenkins::master")
    end

    it "does not include the 'ciexjenkins::ad' recipe" do
      expect(chef_run).not_to include_recipe("ciexjenkins::ad")
    end

    it "creates the cleanup cronjob" do
      expect(chef_run).to create_cron("cleanup")
    end
  end

  context "with authentication set to 'ad'" do
    let(:chef_run) do
      ChefSpec::ServerRunner.new do |node,server|
        node.set["ciexjenkins"]["ad"]["enabled"] = true
      end.converge(described_recipe)
    end

    it "includes the 'ad' recipe" do
      expect(chef_run).to include_recipe("ciexjenkins::ad")
    end

    it "does not include the jenkins_dummy_service" do
      expect(chef_run).not_to include_recipe("ciexjenkins::_jenkins_dummy_service")
    end
  end

  context "with install_plugins set to false" do
    let(:chef_run) do
      ChefSpec::ServerRunner.new do |node,server|
        node.set["ciexjenkins"]["ad"]["enabled"] = false
      end.converge(described_recipe)
    end

    it "does not include the plugins recipe" do
      expect(chef_run).not_to include_recipe("ciexjenkins::plugins")
    end

    it "does not include the jenkins_dummy_service" do
      expect(chef_run).not_to include_recipe("ciexjenkins::_jenkins_dummy_service")
    end
  end
end
