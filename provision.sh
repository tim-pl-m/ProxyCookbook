git clone https://github.com/tim-pl-m/bundler
cd bundler
rake build
sudo gem install pkg/bundler-1.13.0.rc.1.gem
bundle -v
cd ..

gem list
bundle install
gem list