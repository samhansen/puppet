class base::apps {
  $packages = [
    'bc',
    'chromium',
    'gdb',
    'gcc',
    'git',
    'ipython',
    'openssh',
    'openssl',
    'python2',
    'rxvt-unicode',
    'tree',
    'vim',
    'weechat',
    'xbindkeys',
    'xscreensaver',
  ]

  package { $packages:
    ensure => installed,
  }
}
