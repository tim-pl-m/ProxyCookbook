# Copyright 2015 adesso AG
#
# All rights reserved - Do Not Redistribute
#

shared_examples "jenkins service" do
  describe service "jenkins" do
    it { is_expected.to be_running }
    it { is_expected.to be_enabled }
  end

  describe port(8080) do
    it { should be_listening }
  end

  # extract to cron_job.rb
  describe command('sudo crontab -l') do
    its(:stdout) { is_expected.to match(/\* \* \* \* find \/tmp\/ -maxdepth 1 -user jenkins -mmin \+720 \\\( ! -name "hsperfdata_\*" \\\) -exec rm -rf {} \\; >\/dev\/null 2>&1/) }
  end
  # use "describe cron" or full command

  describe file('/tmp/test') do
    it { should_not be_directory }
  end

end
