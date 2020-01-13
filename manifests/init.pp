# @summary This class manages Xorg
#
# This is very simple and at the moment only sets up Xorg Server
#
# @example Basic usage
#   include xorg
#
# @example Set the keyboard layout to GB (UK)
#   class { 'xorg' :
#     keyboard_layout => 'gb',
#   }
#
# @param keyboard_layout
#   If set, the keyboard layout will be set to this. It sets the `layout` as
#   described in https://www.freedesktop.org/software/systemd/man/localectl.html
class xorg (
  String $keyboard_layout = ''
){
  contain xorg::install
  contain xorg::config
  contain xorg::service

  Class['xorg::install']
  -> Class['xorg::config']
  ~> Class['xorg::service']
}
