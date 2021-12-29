#!/bin/bash

convert_files() {
    cd $1

    for file in *
    do
        local file_path=$(find ~/Downloads/imagens-novos-livros -name $file)
        if [ -d $file_path ]
        then
            convert_files $file_path
        else
            local file_name=$(ls $file_path | awk -F. '{ print $1 }')
            convert $file_name.jpg $file_name.png
        fi
    done
}

convert_files ~/Downloads/imagens-novos-livros
if [ $? -eq 0 ]
then
    echo "Conversao realizada com sucesso!"
else
    echo "Houve algum problema na conversao"
fi