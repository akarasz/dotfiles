#!/bin/bash

function execute_axl() {
    local host="$1"
    local username="$2"
    local password="$3"
    local xml="$4"

    curl -X POST --header "content-type: text/xml" --insecure --user $username:$password --data @$xml https://$host:8443/axl/
}

function copy_cdr_from_woz2() {
    local CDR_DIR=/tmp/cdr
    local CDR_DONE_DIR=$CDR_DIR/done
    # copy files
    scp -r woz-2:/home/cdruser/in/* $CDR_DIR

    # delete already loaded files
    for filename in $(find $CDR_DONE_DIR -name 'cdr_*' -exec basename {} \;); do
        rm $CDR_DIR/$filename
        echo "remove $CDR_DIR/$filename"
    done
}
