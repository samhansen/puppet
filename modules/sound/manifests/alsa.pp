class sound::alsa {
  include sound::pulseaudio

  package { 'pulseaudio-alsa':
    ensure => installed,
    require => Package['pulseaudio'],
  }

  $packages = ['alsa-tools', 'alsa-utils']
  package { $packages:
    ensure => installed,
  }
}
