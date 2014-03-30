#!/bin/sh

montage -size 400x400 "$1" -thumbnail 200x200 -font /usr/share/fonts/truetype/ttf-bitstream-vera/Vera.ttf  -set caption '%t' -bordercolor Lavender -background grey40 -gravity Center -pointsize 9 -density 144x144 +polaroid -resize 50% -set label '' -background white -geometry +1+1 -tile 5x index.html
