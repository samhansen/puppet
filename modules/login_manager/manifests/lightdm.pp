class login_manager::lightdm {
  include xorg

  package { 'lightdm':
    ensure => installed,
  }

  service { 'lightdm.service':
    ensure => running,
    enable => true,
    require => Package['lightdm', 'xorg'],
  }
}
