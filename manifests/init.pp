# @summary This class manages xorg
#
# @param xorg_server_manage
#   Whether to manage to xorg_server package. Default calue: true.
#
# @param xorg_server_ensure
#   If $xorg_server_manage is `true`, then whether to install the `xorg_server` 
#   package, and what version to install. Values: 'present', 'latest', or a 
#   specific version number. Default value: 'present'.
#
# @param xorg_apps_manage
#   Whether to manage to xorg_apps package. Default calue: true.
#
# @param xorg_apps_ensure
#   If $xorg_apps_manage is `true`, then whether to install the `xorg_apps` 
#   package, and what version to install. Values: 'present', 'latest', or a 
#   specific version number. Default value: 'present'.
#
# @param xorg_init_manage
#   Whether to manage to xorg_init package. Default calue: true.
#
# @param xorg_init_ensure
#   If $xorg_init_manage is `true`, then whether to install the `xorg_init` 
#   package, and what version to install. Values: 'present', 'latest', or a 
#   specific version number. Default value: 'present'.
#
# @param xorg_xterm_manage
#   Whether to manage to xorg_xterm package. Default calue: true.
#
# @param xorg_xterm_ensure
#   If $xorg_xterm_manage is `true`, then whether to install the `xorg_xterm` 
#   package, and what version to install. Values: 'present', 'latest', or a 
#   specific version number. Default value: 'present'.
#
# @example
#   include xorg
class xorg (
  String $xorg_server_manage,
  Boolean $xorg_server_ensure,
){
  contain xorg::install
  contain xorg::config
  contain xorg::service

  Class['xorg::install']
  -> Class['xorg::config']
  ~> Class['xorg::service']
}
