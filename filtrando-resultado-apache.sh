#!/bin/bash

cd ~/cc/cursos/shell-script/

regex="\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"

if [[ $1 =~ $regex ]]
then
    cat apache.log | grep $1
    if [ $? -ne 0 ]
    then   
        echo "IP inexistente no log"
    fi

else
    echo "Esse número não é um IP! Formato inválido"
fi