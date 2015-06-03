# necessary env variables

PAIR_UP_HOME=$HOME/.pair_up
BACKUP_EDITOR_CONFIG_HOME=$HOME/.pair_up/envs/default
CURRENT_VIMRC=$HOME/.vimrc
CURRENT_VIM_DIR=$HOME/.vim
CURRENT_EMACS_INIT=$HOME/.emacs
CURRENT_EMACS_D=$HOME/.emacs.d

backup_default_env(){

    if [ ! -d $BACKUP_EDITOR_CONFIG_HOME ]; then
        mkdir -p $BACKUP_EDITOR_CONFIG_HOME
    fi

    files=("$CURRENT_VIMRC" "$CURRENT_EMACS_INIT")
    directories=("$CURRENT_VIM_DIR" "$CURRENT_EMACS_D")

    for file_name in "${files[@]}"
    do
        if [ -f $file_name ]; then
            echo "backing up $file_name"
            cp $file_name $BACKUP_EDITOR_CONFIG_HOME
        fi
    done

    for dir in "${directories[@]}"
    do
        if [ -d $dir ]; then
            echo "backing up $dir"
            cp -r $dir $BACKUP_EDITOR_CONFIG_HOME
        fi
    done

}

load_vim_env(){
    # $1 - name of directory containing environment to load
    vimrc="$PAIR_UP_HOME/envs/$1/.vimrc"
    vim_dir="$PAIR_UP_HOME/envs/$1/.vim"

    if [ -d $vim_dir ]; then
        ln -s -f $vim_dir $HOME/.vim
    else
        echo "$vim_dir does not exist"
    fi

    if [ -f $vimrc ]; then
        ln -s -f $vimrc $HOME/.vimrc
    fi
}

load_emacs_env(){
    # $1 - name of directory containing environment to load
    emacs_init="$PAIR_UP_HOME/envs/$1/.emacs"
    emacs_d="$PAIR_UP_HOME/envs/$1/.emacs.d"

    if [ -d $emacs_d ]; then
        ln -s -f $emacs_d $HOME/.emacs.d
    fi

    if [ -f $emacs_init ]; then
        ln -s -f $emacs_init $HOME/.emacs
    fi
}

pair_up(){
    env_to_load=$1
    partner_dir="$PAIR_UP_HOME/envs/$env_to_load"

    if [ -d $partner_dir ]; then
        load_vim_env $env_to_load
        load_emacs_env $env_to_load
    fi
}

unpair(){
    load_vim_env "default"
    load_emacs_env "default"
}