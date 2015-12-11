class networking::netctl {
  $packages = [
    'netctl',
    'iw',
    'wpa_supplicant',
    'dialog',
  ]

  package { $packages:
    ensure => installed,
  }

  service { 'netctl.service':
    require => Package['netctl'],
    ensure => running,
    enable => true,
  }
}
