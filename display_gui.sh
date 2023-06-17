#!/bin/bash
# ------------------------------------------------------------------------------
# display_gui.sh box "Message..." --info
# ------------------------------------------------------------------------------
box() {
    clear
    space=""
    declare -A color
    color=(
        ["--danger"]=41
        ["--success"]=42
        ["--warning"]=43
        ["--info"]=44
    )
    spacing() {
        i=0
        while [ $i -lt ${#1} ]; do
            space+=" "
            let i+=1;
        done
    }
    spacing "${1}"
    echo -e "\n\033[${color[$2]}m ${space} \033[m\n\033[1;37;${color[$2]}m ${1} \033[m\n\033[${color[$2]}m ${space} \033[m\n"
}
# ------------------------------------------------------------------------------
# display_gui.sh status 8000 --online | --offline
# ------------------------------------------------------------------------------
status() {
    clear
    space=""
    spacing() {
        i=0
        while [ $i -lt ${#1} ]; do
            space+=" "
            let i+=1;
        done
    }
    status() {
        spacing "---${1}---"
        echo -e "\n\033[47m ${space} \033[m\n\033[47m \033[m\033[1;${3};3${4};40m*\033[m\033[0;30;47m ${1} \033[m\033[3${4};40m ${2} \033[m\033[47m  \033[m\n\033[47m ${space} \033[m\n"
    }
    spacing "${1}"
    if [ "$2" == "--online" ]; then
        status "Listening port:" $1 5 2
    elif [ "$2" == "--offline" ]; then
        status "Released port:" $1 1 1
    fi
}
$@
