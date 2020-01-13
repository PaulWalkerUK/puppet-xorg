# @summary This class handles xorg configuration
#
# @api private
class xorg::config {
  if ($xorg::keyboard_layout != '') {
    exec { 'set_keyboard_layout':
      command => "localectl set-x11-keymap ${xorg::keyboard_layout}",
      path    => [ '/usr/local/bin/', '/bin/' ],
      unless  => "grep 'Option \"XkbLayout\" \"${xorg::keyboard_layout}\"' /etc/X11/xorg.conf.d/00-keyboard.conf",
    }
  }
}
