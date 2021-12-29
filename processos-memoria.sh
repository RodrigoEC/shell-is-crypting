#!/bin/bash

if [ ! -d logs ]
then
    mkdir logs
fi

getMostExpensiveProcess() {
    local processes=$(ps -e -o pid --sort -size | head -n 11 | grep '[0-9]')

    for process in $processes
    do
        local process_name=$(ps -p $process -o comm=)
        local current_date=$(date +%F,%H:%M:%S,)

        echo -n $current_date >> logs/$process_name.log

        local process_size=$(ps -p $process -o size | grep '[0-9]')
        echo "$(bc <<< "scale=2;$process_size/1024") MB" >> logs/$process_name.log
        
    done
}

getMostExpensiveProcess
if [ $? -eq 0 ]
then
    echo "Processos analisados com sucesso!"
else
    echo "Não deu bom..."
fi