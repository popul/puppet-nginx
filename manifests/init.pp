# Class: nginx
# ===========================
#
# Full description of class nginx here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'nginx':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class nginx (
  String $ensure                       = $::nginx::params::ensure,
  String $package_name                 = $::nginx::params::package_name,
  String $config_dir                   = $::nginx::params::config_dir,
  String $config_ensure                = $::nginx::params::config_ensure,
  String $config_mode                  = $::nginx::params::config_mode,
  String $config_owner                 = $::nginx::params::config_owner,
  String $config_group                 = $::nginx::params::config_group,
  String $config_confd                 = $::nginx::params::config_confd,
  String $config_log_dir               = $::nginx::params::config_log_dir,
  String $config_pid_file              = $::nginx::params::config_pid_file,
  Optional[String] $config_vdir_enable = $::nginx::params::config_vdir_enable,
  String $config_process_user          = $::nginx::params::config_process_user,
  String $service_pattern              = $::nginx::params::service_pattern,
  String $service_ensure               = $::nginx::params::service_ensure,
  String $service_name                 = $::nginx::params::service_name,
  Boolean $service_enable              = $::nginx::params::service_enable,
  Boolean $service_hasstatus           = $::nginx::params::service_hasstatus,
  Boolean $service_hasrestart          = $::nginx::params::service_hasrestart,
  String $docroot                      = $::nginx::params::docroot,
) inherits nginx::params 
{
  Class { '::nginx::install': }
  -> Class { '::nginx::config': }
  ~> Class { '::nginx::service': }
}
