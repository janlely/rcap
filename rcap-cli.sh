#!/bin/bash

HOST=
PORT=
receive() {
    if [ 'darwin' = `uname | tr 'A-Z' 'a-z'` ]; then
        curl http://$HOST:$PORT/copy | pbcopy
    elif [ 'linux' = `uname | tr 'A-Z' 'a-z'` ]; then
        curl http://$HOST:$PORT/copy | xclip -i -sel clipboard
    fi
}

send() {
    if [ 'darwin' = `uname | tr 'A-Z' 'a-z'` ]; then
        TEXT=`pbpaste`
        curl -d "$TEXT" http://$HOST:$PORT/paste
    elif [ 'linux' = `uname | tr 'A-Z' 'a-z'` ]; then
        TEXT=`xclip -o -sel clipboard`
        curl -d "$TEXT" http://$HOST:$PORT/paste
    fi
}

while getopts "rsh:p:" opt; do
    case $opt in
        r)
            receive
            ;;
        h)
            HOST=$OPTARG
            ;;
        p)
            PORT=$OPTARG
            ;;
        s)
            send
            ;;
        \?)
            echo "Invalid option: -$OPTARG" 
            ;;
    esac
done
