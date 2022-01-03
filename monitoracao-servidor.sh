#!/bin/bash


http_answer=$(curl --silent --write-out %{http_code} --output /dev/null http://localhost)

if [ $http_answer -ne 200 ]
then
mail -s "Problemas no servidor" rodrigoecavalcanti@gmail.com<<del
Houve um problema no servidor e os usuários param de ter acesso à plataforma, reiniciei o sistema
del
    systemctl restart apache2
fi
