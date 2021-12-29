#!/bin/bash

convert_files() {
    cd $1


    for file in *
    do
        if [ -d $file ]
        then
            convert_files $1/$file
            cd $1
        else
            local file_name=$(ls $file | awk -F. '{ print$1 }')
            convert $file $file_name.png
        fi
    done
}

convert_files ~/Downloads/imagens-novos-livros 