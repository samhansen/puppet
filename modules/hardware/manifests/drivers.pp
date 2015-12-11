class hardware::drivers::video::intel {
  package { 'video-driver':
    name => 'xf86-video-intel',
    ensure => installed,
  }
}
