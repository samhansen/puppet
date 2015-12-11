node default {
  include hardware
  include sound
  include networking
  include window_manager::i3
  include login_manager::lightdm

  include base::apps
  include base::environment
}
