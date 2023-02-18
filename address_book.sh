#! /bin/bash

# Address Book
# Attributes: name, phone ,email
# Operations: 
    # add(): add a record to address book.
    # del(): remove a record from address book.
    # search(): search the records by conditions. 
    # list(): list all records in address book.

addressBook=""

function add() {
    addressBook+=" "$1":"$2":"$3
}

function del() {
    # set flag of which attribute to check
    case $1 in
        "name")
            check=1;;
        "phone")
            check=2;;
        "email")
            check=3;;
    esac

    tempAddressBook=""
    for address in ${addressBook}; do
        if [ $(echo ${address} | cut -d ":" -f ${check}) != $2 ]; then
            tempAddressBook+=" "${address}
        fi
    done

    addressBook=${tempAddressBook}
}

function search() {
    # set flag of which attribute to check
    case $1 in
        "name")
            check=1;;
        "phone")
            check=2;;
        "email")
            check=3;;
    esac

    # print all records that satisfy the flag
    for address in ${addressBook}; do
        if [ $(echo ${address} | cut -d ":" -f ${check}) = $2 ]; then
            echo -n $(echo ${address} | cut -d ":" -f 1) "- "
            echo -n $(echo ${address} | cut -d ":" -f 2) "- "
            echo $(echo ${address} | cut -d ":" -f 3)
        fi
    done

    
}

function list() {
    echo "name - phone - email"
    for address in ${addressBook}; do
        echo -n $(echo ${address} | cut -d ":" -f 1) "- "
        echo -n $(echo ${address} | cut -d ":" -f 2) "- "
        echo $(echo ${address} | cut -d ":" -f 3)
    done
}

### main script ###
echo "***************************************"
echo "*                                     *"
echo "*         ADDRESS BOOK SYSTEM         *"
echo "*                                     *"
echo "***************************************"

while :; do
    read -p ">>> " cmd
    if [ "${cmd}" = "end" ]; then
        break
    fi
    
    ${cmd}
done
