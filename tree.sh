#!/bin/bash
#
# Format contents as a tree (see README for details).
#
# Copyright (c) 2019, Matthew Chalifoux.
#

tree()  {

    loopOut() {
        local p
        for p in $1/*;  
            if [ -d "$p" ]; then
                local s
                s=$p
                s="${s##*/}"
                echo "$s/"

                local sub=$1
                sub=$sub/$s
                loopOut $sub | sed "s/^/\t/"
            elif [ -f "$p" ]; then
                local s
                s=$p
                s="${s##*/}"
                echo "$s"
            fi    
        done
    }
    
    if [ -d "$1" ]; then        
        echo $1/
        local var=$(pwd)
        var=$var/$1
        loopOut $var | sed "s/^/\t/"        
    elif [ -f "$1" ]; then
        echo $1
    fi  
}

