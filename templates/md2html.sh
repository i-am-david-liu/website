#!/bin/bash

#====================================================================
# quick and dirty wrapper for Showdown to generate with html headers
# 
# mostly used for blog posts, hence the default stylesheet link
#
# USAGE: ./md2html.sh {input-file.md} {output-file.html}

in=$1
out=$2
cat << EOF > $out
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">

    <link href="/styles/style.css" rel="stylesheet">
  </head>
  <body>
EOF
showdown makehtml -a -i $in -o $out
cat << EOF >> $out
    <hr>
    <p class="center">
      <a href="/posts">back</a>
    </p>
  </body>
</html>
EOF
