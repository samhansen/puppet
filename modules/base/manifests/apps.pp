class base::apps {
  $packages = [
    'bc',
    'chromium',
    'gdb',
    'gcc',
    'git',
    'ipython',
    'mutt',
    'openssh',
    'openssl',
    'python2',
    'rxvt-unicode',
    'strace',
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
