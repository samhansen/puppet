# My preferred environment.  All resources contined here are non-essential
# environment preferences.
class base::environment {
  File {
    owner => $::user,
    group => $::user,
    ensure => present,
  }

  # Gitconfig
  file { "/home/$::user/.gitconfig":
    source => 'puppet:///modules/base/gitconfig',
  }

  # Dircolors.
  file { "/home/$::user/.dircolors":
    source => 'puppet:///modules/base/dircolors',
  }

  # I3 config.
  file { "/home/$::user/.i3":
    ensure => directory,
  }

  file { "/home/$::user/.i3/config":
    source => 'puppet:///modules/base/i3config',
    require => File["/home/$::user/.i3"],
  }

  # SSH config.
  file { "/home/$::user/.ssh":
    ensure => directory,
    mode => '0700',
  }

  file { "/home/$::user/.ssh/config":
    source => 'puppet:///modules/base/ssh_config',
  }

  # Vimrc.
  file { "/home/$::user/.vimrc":
    source => 'puppet:///modules/base/vimrc'
  }

  # Xbindkeys
  file { "/home/$::user/.xbindkeysrc":
    source => 'puppet:///modules/base/xbindkeysrc',
  }

  # Xinitrc
  file { "/home/$::user/.xinitrc":
    source => 'puppet:///modules/base/xinitrc',
  }

  # Xresources.
  file { "/home/$::user/.Xresources":
    source => 'puppet:///modules/base/Xresources',
  }

  file { "/home/$::user/.Xresources.d":
    ensure => directory,
  }

  file { "/home/$::user/.Xresources.d/urxvt":
    source => 'puppet:///modules/base/urxvt',
    require => File["/home/$::user/.Xresources.d"],
  }
}
