# @summary This class manages Xorg
#
# This is very simple and at the moment only sets up Xorg Server
#
# @example
#   include xorg
class xorg {
  contain xorg::install
  contain xorg::config
  contain xorg::service

  Class['xorg::install']
  -> Class['xorg::config']
  ~> Class['xorg::service']
}
