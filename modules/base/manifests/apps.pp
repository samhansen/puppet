# Base apps common to all deployments.
class base::apps {
  $packages = [
    'bc',
    'gdb',
    'gcc',
    'git',
    'golang-go',
    'ipython',
    'lzma',
    'openssh-client',
    'python2.7',
    'rxvt-unicode',
    'strace',
    'tmux',
    'tree',
    'vim',
    'vim-puppet',
    'vlc',
    'weechat',
    'xzip',
  ]

  package { $packages:
    ensure => installed,
  }

  case $operatingsystem {
    'Ubuntu': { include base::apps::ubuntu }
  }
}

# Ubuntu-specific app config.
class base::apps::ubuntu {
  $packages = [
    'aptitude',
  ]

  package { $packages:
    ensure => installed,
  }
}
