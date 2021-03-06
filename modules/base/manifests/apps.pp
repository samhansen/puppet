# Base apps common to all deployments.
class base::apps {
  $packages = [
    'bc',
    'gdb',
    'gcc',
    'git',
    #'golang-go', # Install manually.
    'ipython',
    'lzma',
    'network-manager-openvpn',
    'network-manager-openvpn-gnome',
    'network-manager-pptp',
    'network-manager-vpnc',
    'openssh-client',
    'openvpn',
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
