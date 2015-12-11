# My preferred environment.  All resources contined here are non-essential
# environment preferences.
class base::environment {
  # Gitconfig
  file { "/home/$::user/.gitconfig":
    ensure => present,
    source => 'puppet:///modules/base/gitconfig',
  }

  # Dircolors.
  file { "/home/$::user/.dircolors":
    ensure => present,
    source => 'puppet:///modules/base/dircolors',
  }

  # I3 config.
  file { "/home/$::user/.i3":
    ensure => directory,
  }

  file { "/home/$::user/.i3/config":
    ensure => present,
    source => 'puppet:///modules/base/i3config',
    require => File["/home/$::user/.i3"],
  }

  # Vimrc.
  file { "/home/$::user/.vimrc":
    ensure => present,
    source => 'puppet:///modules/base/vimrc'
  }

  # Xbindkeys
  file { "/home/$::user/.xbindkeysrc":
    ensure => present,
    source => 'puppet:///modules/base/xbindkeysrc',
  }

  # Xinitrc
  file { "/home/$::user/.xinitrc":
    ensure => present,
    source => 'puppet:///modules/base/xinitrc',
  }

  # Xresources.
  file { "/home/$::user/.Xresources":
    ensure => present,
    source => 'puppet:///modules/base/Xresources',
  }

  file { "/home/$::user/.Xresources.d":
    ensure => directory,
  }

  file { "/home/$::user/.Xresources.d/urxvt":
    ensure => present,
    source => 'puppet:///modules/base/urxvt',
    require => File["/home/$::user/.Xresources.d"],
  }
}
