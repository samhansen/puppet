# Base environment common to all deployments.
class base::environment {
  File {
    require => User["$::user"],
    ensure => present,
    group => $::group,
    owner => $::user,
    mode => 0640,
  }

  # Common config directories.
  file { "$::home/.Xresources.d":
    ensure => directory,
  }

  # Dircolors.
  file { "$::home/.dircolors":
    source => 'puppet:///modules/base/dircolors',
  }

  # Gitconfig.
  file { "$::home/.gitconfig":
    source => 'puppet:///modules/base/gitconfig',
  }

  # SSH config.
  file { "$::home/.ssh":
    require => Package['openssh-client'],
    ensure => directory,
    mode => '0700',
  }

  file { "$::home/.ssh/config":
    require => File["$::home/.ssh"],
    source => 'puppet:///modules/base/sshconfig',
  }

  # Xresources.
  file { "$::home/.Xresources":
    source => 'puppet:///modules/base/Xresources',
    notify => Exec['xrdb_reload'],
  }

  file { "$::home/.Xresources.d/urxvt":
    require => Package['rxvt-unicode'],
    source => 'puppet:///modules/base/urxvt',
    notify => Exec['xrdb_reload'],
  }

  exec { "/usr/bin/xrdb -merge $::home/.Xresources":
    alias => 'xrdb_reload',
    refreshonly => true,
  }

  # Vim.
  file { "$::home/.vimrc":
    require => Package['vim'],
    source => 'puppet:///modules/base/vimrc',
  }

  file { "$::home/.vim":
    require => Package['vim'],
    ensure => directory,
  }

  file { "$::home/.vim/ftplugin":
    ensure => directory,
  }

  file { "$::home/.vim/ftplugin/go.vim":
    require => Package['vim'],
    source => 'puppet:///modules/base/go.vim',
  }
}
