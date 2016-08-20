# Jenkins Master Role Cookbook

Installs and configures Jenkins CI master & node slaves constituting the external _adesso CI service_. It wraps the [Chef Jenkins cookbook](https://supermarket.chef.io/cookbooks/java).

## Dependencies

 - `cookbook 'jenkins'`: The Library [Cookbook](https://supermarket.chef.io/cookbooks/java) that this cookbooks wraps. It does most of the heavy lifting for Jenkins. It also provides useful LWRPs, such as the `jenkins_plugin` provider.
 - `cookbook 'java'`: The community Jenkins cookbook does not make any assumptions on which Java variant to install. We use the [Java Cookbook](https://supermarket.chef.io/cookbooks/java) to install Orcale JDK 7.

## Supported Platforms

**CentOS 7**

 More specifically, the [adesso/centos7](http://box.adesso.de/centos7.json) box found at [http://boxes.adesso.de](http://boxes.adesso.de).

## Attributes

### General Settings / Installation

 - `default["ciexjenkins"]["auth"]` - Whether to configure Active Directory as authentication (set to `ad`) or to leave it as configured out-of-the-box (set to `default` - standard setting)
 - `default["ciexjenkins"]["install_plugins"]` - Whether to install the plugins in `node["ciexjenkins"]["plugins"]` as part of the standard installation. Defaults to `false`.

### Plugins

 - `default["ciexjenkins"]["plugins"]` - a hash of Jenkins plugins with their parameters (typically the desired plug-in version).

 ```ruby
 default["ciexjenkins"]["plugins"] = {
   "plugin-one" => {version: "latest"},
   "plugin-two" => {version: "1.0", source: "<some URI>"},
   ...
 }
 ```
 The actual list of plugins instllaed by default is too long to reprocude here. Check `attributes/plugins.rb` for details.

### Active Directory

** UNTESTED!! **

 - `node["ciexjenkins"]["ad"]["domain"]`
 - `node["ciexjenkins"]["ad"]["site"]`
 - `node["ciexjenkins"]["ad"]["bindName"]`
 - `node["ciexjenkins"]["ad"]["bindPassword"]`
 - `node["ciexjenkins"]["ad"]["server"]`
 - `node["ciexjenkins"]["ad"]["jenkins_plugin_version"]`

### Java Cookkbook

This cookbook installs the Orcale JDK through the Java Cookbook:

 - `node["java"]["install_flavor"] = "oracle"`
 - `node["java"]["jdk_version"] = "7"`
 - `node["java"]["oracle"]["accept_oracle_download_terms"] = true`

## Recipes

### master

The "master" recipe installs Java and Jenkins and enables and starts the Jenkins service.

By default, that is all this recipe does. It will include two other recipies depending on the following attribute configuraitons:

 - If `node["ciexjenkins"]["install_plugins"] = true`, the master recipe includes the _plugins_ recipe.
 - If `node["ciexjenkins"]["auth"] = ad` the master recipe includes the _ad_ recipe.

### plugins

The "plugin" recipe installs all plugins listed in `node["ciexjenkins"]["plugins"]` and restarts the jenkins service if necessary.

This recipe can run as part of the master recipe or stand-alone _after_ master has run on the node.

### ad

** UNTESTED!! **

The "ad" recipe configures jenkins authentication to work with Active Directory. It will install the necessary Jenkins plugin and configure Jenkins accordingly. Provide the necessary information to connect to an AD server in the `node["ciexjenkins"]["ad"][...]` attributes in `attributes/ad.rb`.

This recipe can run as part of the master recipe or stand-alone _after_ master has run on the node.

## License and Authors

Author:: Max Edenharter <Max.Edenharter@adesso.de><br/>
Author:: Sören Blom <soeren.blom@adesso.de>
