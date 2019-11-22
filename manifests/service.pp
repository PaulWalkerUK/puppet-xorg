# @summary This class handles xorg services
#
# @api private
class xorg::service {
  service { 'vboxservice': ensure => 'running' }
}
