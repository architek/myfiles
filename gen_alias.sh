#!/bin/sh
alias_doc=Aliases.rst
exec 1> "${alias_doc}"
echo "Aliases"
echo "=======\n"
for s in bash zsh
do
    echo $s
    echo "----\n"
    echo "::\n"
    $s -ci alias | sed 's/^/\t/'
    echo
done
