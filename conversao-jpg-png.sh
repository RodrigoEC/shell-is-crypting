# INterpreter that's going to be used
#!/bin/bash

cd ~/Downloads/imagens-livros

if [ ! -d  converted ]
then
    mkdir converted
fi


# Get all parameters passed with $@
for image in *.jpg
do  
    file_name=$(ls $image | awk -F. '{ print$1 }')
    convert $image converted/$file_name.png
done