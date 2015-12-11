class hardware::acpi {
  package { 'acpid':
    ensure => installed,
  }

  service { 'acpid.service':
    ensure => running,
    enable => true,
    require => Package['acpid'],
  }
}
