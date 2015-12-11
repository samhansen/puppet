class xorg {
  include hardware::drivers::video::intel
  package { 'xorg':
    name => 'xorg-server',
    ensure => installed,
    require => Package['video-driver'],
  }
}
