# @summary This class manages xorg
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
