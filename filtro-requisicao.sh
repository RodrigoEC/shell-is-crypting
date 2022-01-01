#!/bin/bash

cd ~/cc/cursos/shell-script/

if [ -z $1 ]
then   
    while [ -z $req ]
    do
        read -p "Você esqueceu de colocar o parametro (GET, PUT, POST, DELETE): " req
        input=$(echo $req | awk '{ print toupper($1) }')
    done
else
    input=$(echo $1 | awk '{ print toupper($1) }')
fi


case $input in
    GET)
        cat apache.log | grep GET
    ;;

    POST)
        cat apache.log | grep POST
    ;;

    PUT)
        cat apache.log | grep PUT
    ;;

    DELETE)
        cat apache.log | grep DELETE
    ;;

    *)
        echo "O parâmetro passado não é válido"
    ;;
esac
