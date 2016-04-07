Tmup is a tool to swap out vim and emacs config files easily.
Typical use case is for people who pair with others and want to allow them to use their own setup.

Warning:
-------

Backup your vim and emacs files before using this script. It should automatically backup your files before performing any actions, but it's possible for something to go wrong along the way.

Usage:
-------

Assuming `$HOME/bin` is in your path -

1. `ln -s /path/to/tmup/bin/tmup $HOME/bin/`
2. Backup your editor config files by running `tmup backup`. You'll now have the following directory: `$HOME/.tmup/envs/default/` containing your .emacs.d, .emacs, .vim, and .vimrc files (backup automatically occurs when loading an env if `$HOME/.tmup/envs/default/` doesn't exist)
3. Create a new environment named `joe` from the repo https://github.com/joedursun/emacs.d:
    - `tmup create joe git@github.com:joedursun/.emacs.d.git`
4. Now running `tmup joe` will symlink `$HOME/.tmup/envs/joe/.emacs.d` to `$HOME/.emacs.d`
5. Switch back to your original configuration by running `tmup reset`

Typical Workflow:
-----------------
`tmup` is best used in conjunction with [tmate](http://tmate.io/). Start a tmate session for your friend to join, create an environment for them, and load the environment for them to use.
