#!/bin/bash

getMostExpensiveProcess() {
    local processes=$(ps -e -o pid --sort -size | head -n 11 | grep '[0-9]')

    for process in $processes
    do
        echo $(ps -p $process -o comm=)
    done
}

getMostExpensiveProcess