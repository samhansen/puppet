class window_manager::i3 {
  include xorg

  package { 'i3-wm':
    ensure => installed,
    require => Package['xorg'],
  }
}
