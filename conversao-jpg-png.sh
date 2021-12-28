# INterpreter that's going to be used
#!/bin/bash

IMAGES_PATH=~/Downloads/imagens-livros

# Get all parameters passed with $@
for image in $@
do
    convert $IMAGES_PATH/$image.jpg $IMAGES_PATH/$image-converted.png
done