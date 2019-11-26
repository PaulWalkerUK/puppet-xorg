# @summary This class handles xorg installation
#
# @api private
class xorg::install {
  # Different VirtualBox Guest required for GUI
  package { 'virtualbox-guest-utils-nox': ensure => 'absent' }
  package { 'virtualbox-guest-utils': ensure => 'present' }

  # Core packages
  package { 'xorg': ensure => 'present' }
  package { 'virtualbox-guest-modules-arch': ensure => 'present' }
  package { 'mesa': ensure => 'present' }

  # Optional addons
  if $xorg::xorg_server_manage {
    package { 'xorg-server': ensure => $xorg::xorg_server_ensure }
  }

  if $xorg::xorg_apps_manage {
    package { 'xorg-apps': ensure => $xorg::xorg_apps_ensure }
  }
  
  if $xorg::xorg_init_manage {
    package { 'xorg-xinit': ensure => $xorg::xorg_init_ensure }
  }
  
  if $xorg::xterm_manage {
    package { 'xterm': ensure => $xorg::xterm_ensure }
  }
}
