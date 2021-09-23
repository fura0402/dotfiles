#!/bin/bash

printf '\e[33;1;4m%s\e[m\n' 'Under Construction.'
exit 0
# formulaを個別にインストールできるようにする予定
# 要素を表示しスペースで選択していく

# Get cursor row.
function GetRow(){
    { local ROW; local COL; }
    IFS=';' read -sdR -p $'\E[6n' ROW COL
    echo "$(expr ${ROW#*[} - 1)"
}

function homebrew_menu() {
    local cursor_MIN=0
    local cursor_MAX=$(expr $itemsNum - 1)

    local select=()
    local err_flag=0

    echo -e "\n  Kernel: $currentKernel($currentOS)"
    start_row=$(GetRow)
    while :; do
        tput civis
        for i in $(seq 0 $cursor_MAX); do
            if [ $i -eq $cursor ]; then
                select[$i]="◉"
            else
                select[$i]="○"
            fi
        done

        for i in $(seq 0 $cursor_MAX); do
            echo " ${select[$i]} > ${itemsList[$i]}"
        done

        tput ed

        if [ $err_flag -eq 1 ]; then
            echo "  Down: j, Up: k, Cancel: q, Press Enter."
            tput cuu 1
            err_flag=0
        fi


        local select_key=""
        IFS= read -rsn1 select_key
        if [ "$select_key" == $'\x1b' ]; then
            read -rsn2 select_key
        fi
        case $select_key in
            "k" | "[A")
                if [ $cursor -gt $cursor_MIN ]; then
                    let --cursor
                else
                    cursor=$cursor_MAX
                fi
                tput cup $start_row 0
                ;;
            "j" | "[B")
                if [ $cursor -lt $cursor_MAX ]; then
                    let ++cursor
                else
                    cursor=$cursor_MIN
                fi
                tput cup $start_row 0
                ;;
            "q")
                tput dl1
                # Custom_menuにもどる
                exit 0
                ;;
            " ")
                :
                ;;
            "")
                tput cnorm
                tput dl1
                echo "Are you really okay with '${itemsList[$cursor]}' ?"
                while :; do
                    current_row=$(GetRow)
                    # 選択項目を全表示
                    read -p "  (Yes/No) " enter_key
                    case $enter_key in
                        "No")
                            tput cup $start_row 0
                            break
                            ;;
                        "Yes")
                            tput ed
                            echo
                            return 0
                            ;;
                        *)
                            echo "Please answer 'Yes' or 'No'."
                            tput cup $current_row 0
                            tput el
                            ;;
                    esac
                done
                ;;
            *)
                tput cup $start_row 0
                err_flag=1
        esac
    done
}

if [ -z $homebrew_formula_list ]; then
    echo " 'homebrew_formula_list.sh' has not been loaded."
fi
homebrew_menu
