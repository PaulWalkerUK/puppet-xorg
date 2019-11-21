# @summary A short summary of the purpose of this class
#
# A description of what this class does
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
