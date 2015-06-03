Pair_Up is a tool to swap out vim and emacs config files easily.
Typical use case is for people who pair with others and want to allow them to use their own setup.

Warning:

Backup your vim and emacs files before using this script. It should automatically backup your files before performing any actions, but it's possible for something to go wrong along the way.

Usage:

Assuming `$HOME/bin` is in your path -

1. `ln -s /path/to/pair_up/bin/pair_up $HOME/bin/`
2. `pair_up backup`
3. You'll now have the following directory: `$HOME/.pair_up/envs/default/` containing your .emacs.d, .emacs, .vim, and .vimrc files
4. `cd $HOME/.pair_up/envs/ && mkdir joe && git clone git@github.com:joedursun/emacs.d.git joe/.emacs.d`
5. Now running `pair_up joe` will symlink `$HOME/.pair_up/envs/joe/.emacs.d` to `$HOME/.emacs.d`
6. Switch back to your regular configuration by running `pair_up reset`
