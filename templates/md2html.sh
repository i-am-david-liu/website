#!/bin/bash

#====================================================================
# quick and dirty wrapper for Showdown to generate with html headers
# /!\ PLEASE PLEASE PLEASE IMPROVE THIS IN THE FUTURE
# 
# mostly used for blog posts, hence the default stylesheet link
#
# USAGE: ./md2html.sh {input-file.md} {output-file.html}

in=$1
out=$2
wordcount=$(wc -w $in | awk '{print $1;}')

cat << EOF > $out
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">

    <link href="/styles/style.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="/favicon.svg">

    <title>dliu.xyz</title>
  </head>
  <body>
    <hr>
    <p>
      <span class="left mono"></span>
      <span class="right mono"$wordcount words</span>
    </p>
    <div style="clear: both;"></div>
EOF
showdown makehtml -a -i $in -o $out
cat << EOF >> $out
 
    </br>
    <hr>
    <p class="center">
      <a href="/posts">back</a>
    </p>
  </body>
</html>
EOF
