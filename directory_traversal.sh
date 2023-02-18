#! /bin/bash

# printFile(filename)
function printFile() {
    # print indent space
    local cnt=0
    while [ ${cnt} -lt $2 ]; do
        echo -n " "
        cnt=`expr ${cnt} + 1`
    done

    # print item name
    # `rev` command will reverse the string
    echo -n "|---"
    echo ${item} | rev | cut -d "/" -f 1 | rev
}

# traverse(path, indent)
function traverse() {
    for item in $1*; do
        # print item name
        printFile ${item} $2

        # if the item is a directory, call this function recursively
        if [ -d ${item} ]; then
            traverse ${item}"/" `expr $2 + 4`  
        fi
    done
}

### main script ###
traverse ./ 0