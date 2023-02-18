#! /bin/bash

# traverse(path, indent)
function traverse() {
    for item in $1*; do
        local cnt=0
            while [ ${cnt} -lt $2 ]; do
                echo -n " "
                cnt=`expr ${cnt} + 1`
            done
            echo ${item}

        if [ -d ${item} ]; then
            traverse ${item}"/" `expr $2 + 4`  
        fi
    done
}

### main script ###
traverse ./ 0