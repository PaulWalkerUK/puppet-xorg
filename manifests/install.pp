# @summary This class handles xorg installation
#
# @api private
class xorg::install {
  # Core packages
  package { 'xorg-server': ensure => 'present' }

  if ($xorg::keyboard_layout != '') {
    package { 'libxkbcommon': ensure => 'present' }
  }

  # Addons - not required, maybe make optional later?
  # package { 'xorg-apps': ensure => 'present' } ## extra apps?
  # package { 'xterm': ensure => 'present' } ## terminal
  # package { 'xorg-xinit': ensure => 'present' } ## allow manually start xorg display server. Not required if using Display Manager
}
