node default {
  user { "$::user":
    ensure => present,
    home => "$::home",
  }

  include base::apps
  include base::environment
}
