#!/bin/bash

memoria_total=$(free | grep -i mem | awk '{ print $2 }')
memoria_consumida=$(free | grep -i mem | awk '{ print $3 }')

proporcao_memoria=$(bc <<< "scale=2;$memoria_consumida/$memoria_total" | awk -F. '{ print $2 }')

if [ $proporcao_memoria -gt 50 ]
then
    echo "Vish....muita memória sendo usada"
else
    echo "Tudo de boas"
fi

consumo=$(free -h | grep -i mem | awk '{ print $3 }')
echo "Consumo atual de $consumo"
