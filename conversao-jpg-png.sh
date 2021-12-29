# INterpreter that's going to be used
#!/bin/bash

convert_images() {
    cd ~/Downloads/imagens-livros

    if [ ! -d  converted ]
    then
        mkdir converted
    else 
        rm -rf converted
        mkdir converted
    fi


    # Get all parameters passed with $@
    for image in *.jpg
    do  
        # This variable is only acessable in the scope of the function
        local file_name=$(ls $image | awk -F. '{ print$1 }')
        convert $image converted/$file_name.png
    done
}

convert_images 2>erros_conversao.txt
if [ $? -eq 0 ]
then
    echo "Conversão realizada com sucesso!"
else
    echo "Houve uma falha no processo!"
fi