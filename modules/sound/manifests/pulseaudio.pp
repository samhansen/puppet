class sound::pulseaudio {
  package { 'pulseaudio':
    ensure => installed,
  }
}
