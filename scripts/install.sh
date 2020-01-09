#!/usr/bin/env sh

# repositories
_CASK_REPO="https://github.com/cask/cask"
_MESK_REPO="https://gitlab.com/k-bps/mesk"

# default directories
_CASK_DIR="$HOME/.cask"
_MESK_DIR="$HOME/.mesk"
_EMACS_DIR="$HOME/.emacs.d"
_EMACS_BACKUP=

# flags (1: false, 0: true)
# _DISABLE_BACKUP=1
_DISABLE_SYMLINK=1

# colors
_RED=""
_GREEN=""
_RESET=""
_YELLOW=""

# defaults
_DEFAULT="default."
_CODE_FILE="my-code.el"
_CASK_FILE="Cask"

# banner
banner() {
    # print help message
    cat <<-'EOF'

    [ EMACS OS ]
      ... installation script

EOF
}

# show help message
usage() {
    # print help message
    printf $_GREEN
    cat <<-'EOF'

  sh install.sh [-hlx] [-m PATH] [-c PATH]

  -h    show help message and exit
  -x    enable debugging
  -v    enable verbose
  -l    disables symlink (.emacs.d -> mesk/src)

  -m PATH
      defines mesk root directory

  -c PATH
        defines cask root directory

  Examples:

  [1] : ./install.sh
  [2] : ./install.sh -h
  [3] : ./install.sh -m .
  [3] : cd mesk/scripts; ./install.sh -m ..
  [4] : ./install.sh -c ~/.local/share/cask -x

EOF
    printf $_RESET
}

# die message stdout
die() {
    printf "$_RED [-] Error: $@" >&2; exit 1
}

# verify if a command exists
command_exists() {
    command -v "$@" >/dev/null 2>&1
}

# check dependencies
check_deps() {
    command_exists git || die 'git not found';
    command_exists emacs || die "emacs not found";
    command_exists python || die "python not found";
}

# git clone
git_clone() {
    # params
    local _url=$1
    local _folder=$2

    # if folder do not exists, git clone
    test ! -d $_folder && \
        git clone $_url $_folder > /dev/null 2>&1

    # cloned?
    test ! -d $_folder && \
        die "was not possible to clone mesk repo"

    # ok: cloned!
    return 0
}

# generate random string
get_rand_str() {
    # generate
    cat /dev/urandom | \
        env LC_CTYPE=C tr -dc a-z0-9 | \
        head -c 8; \
        echo
}

# backup ~/.emacs.d dir
backup_emacs() {
    # already a symlink?
    test -h ${_EMACS_DIR} && {
        unlink ${_EMACS_DIR}
        return 0
    }

    # backup
    test -d ${_EMACS_DIR} && \
        mv ${_EMACS_DIR} $_EMACS_BACKUP
}

# handle mesk/src symlink
ln_mesk() {
    # make symlink
    ln -s ${_MESK_DIR}/src ${_EMACS_DIR};
}

# handle mesk/src copy
copy_mesk() {
    # if .emacs.d do not exists, copy
    test ! -d ${_EMACS_DIR} && \
        cp -rp ${_MESK_DIR}/src ${_EMACS_DIR}
}

# set colors if file descriptor is associated with a terminal
setup_colors() {
    # True if the file whose file descriptor number is
    # file_descriptor is open and is associated with a terminal.
    # test(1)
    test -t 1 && {
        _RED="\033[31m"
        _GREEN="\033[32m"
        _YELLOW="\033[33m"
        _RESET="\033[m"
    }
}

# handle cask
setup_cask() {
    # download mesk if necessary
    test ! -d $_CASK_DIR && {
        # dump cask
        git_clone $_CASK_REPO $_CASK_DIR

        # if directory was clonned,
        test ! $? -eq 0 && \
            die "was not possible to dump cask repository."
    }

    # copy Cask default file if necessary
    test -e ${_EMACS_DIR}/Cask || \
        cp -p ${_MESK_DIR}/samples/${_DEFAULT}${_CASK_FILE} ${_EMACS_DIR}/${_CASK_FILE}

    # change working directory
    # install dependencies
    (cd ${_EMACS_DIR} && ${_CASK_DIR}/bin/cask install)
}

# download mesk
setup_mesk() {
    # download mesk if necessary
    test ! -d $_MESK_DIR && {
        # dump mesk
        git_clone $_MESK_REPO $_MESK_DIR

        test ! $? -eq 0 && \
            die "was not possible to dump mesk repository."
    }

    # change working directory
    # change branch and update the local repository
    # temporary
    (cd $_MESK_DIR && git checkout dev && git pull)

    # copy my-init.el default file if necessary
    ! test -e ${_MESK_DIR}/src/${_CODE_FILE} && \
        cp -p ${_MESK_DIR}/samples/${_DEFAULT}${_CODE_FILE} \
           ${_MESK_DIR}/src/${_CODE_FILE}
}

# calls mesk build script
# and cask build
build_mesk() {
    # source/load build.sh
    . ${_MESK_DIR}/scripts/build.sh

    # change current directory
    cd ${_EMACS_DIR};

    # calls cask build
    (${_CASK_DIR}/bin/cask build)
}

# todo: define options
parse_opts() {
    # get options
    for opt in "$@"; do
        case $opt in
            # enable debugging
            -x) shift 1; set -x ;;

            # enable verbose
            -v) shift 1; set -v ;;

            # set cask target directory
            -c)
                shift 1; _CASK_DIR=`readlink -f "${1}"`; shift 1 ;;

            # set mesk target directory
            -m)
                shift 1; _MESK_DIR=`readlink -f "${1}"`; shift 1 ;;

            # disable symlink? yes!
            -l)
                shift 1; _DISABLE_SYMLINK=0 ;;

            # help message and exit
            --help|-h)
                banner; usage; exit 0 ;;
        esac
    done

    # the get_rand_str contat is used to avoid conflicts
    # set emacs backup directory
    _EMACS_BACKUP=${_EMACS_DIR}.old.`get_rand_str`
}

show_opt_values() {
    # todo: replace this for a better syntax
    # todo: research sh(1) Parameter Expansion
    local _a="yes"

    # show banner
    banner

    # verify flags
    test $_DISABLE_SYMLINK -eq 0 && \
        _a="no";

    test -h ${_EMACS_DIR} && \
        _EMACS_BACKUP="unlink"

    # print values
    printf $_GREEN
    printf \
        "[*] Options values:
  Mesk dir : $_MESK_DIR
  Cask dir : $_CASK_DIR
  Backup   : $_EMACS_BACKUP
  Symlink  : $_a
  \n"
    printf $_RESET
}

# show values and operations that will be executed to the user
# if we receive user's confirmation, then install mesk
should_install() {
    local _answer=

    # question
    printf "[*] [h] help\n"
    printf "[*] Can we proceed with the installation? [y/n/h] : "

    while read _answer;
    do
        case $_answer in
            # possible answsers (yes, no, undefined (ask again!)
            y|yes) return 0 ;;

            # just leave
            n|no)
                printf "cya :)\n"; exit 0 ;;

            # show help and leave
            h|help) usage; exit 0 ;;

            *)
                # ask again
                printf "[*] Can we proceed with the installation? [y/n/h] : "
                ;;
        esac
    done
}

# install main
main() {
    # check dependencies (emacs, git and python)
    check_deps

    # parse options
    parse_opts $@

    # show options
    show_opt_values

    # install?
    should_install || exit 1;

    # setup mesk
    setup_mesk

    # backup ~/.emacs.d folder
    backup_emacs

    # handle symlink or copy?
    test $_DISABLE_SYMLINK -eq 1 && \
        ln_mesk || copy_mesk

    # setup cask(package manager) and build mesk
    setup_cask && build_mesk

    # final message
    printf $_GREEN
    cat <<-'EOF'
     [+] Done!
     [+] Run emacs and enjoy! :)
EOF
}

# setup colors
setup_colors

# install.sh entry point
main $@
