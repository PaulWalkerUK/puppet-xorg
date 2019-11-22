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

  # Addons
  package { 'xorg-server': ensure => 'present' }
  package { 'xorg-apps': ensure => 'present' }
  package { 'xorg-xinit': ensure => 'present' }
  package { 'xterm': ensure => 'present' }
}
