# @summary This class handles xorg installation
#
# @api private
class xorg::install {
  # Different VirtualBox Guest required for GUI
  package { 'virtualbox-guest-utils-nox': ensure => 'absent' }
  package { 'virtualbox-guest-utils': ensure => 'present' }

  # Core packages
  package { 'xorg-server': ensure => 'present' } ##bare minimum ?

  # Addons
  #package { 'xorg-apps': ensure => 'present' } ##extra?
  #package { 'xterm': ensure => 'present' }
  #package { 'xorg-xinit': ensure => 'present' } ##allow manually start xorg display server. Not required if using Display Manager
}
