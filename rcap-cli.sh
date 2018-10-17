#!/bin/bash
HOST=
PORT=
receive() {
    if [ 'darwin' = `uname | tr 'A-Z' 'a-z'` ]; then
        curl http://$HOST:$PORT/copy | pbcopy
    elif [ 'linux' = `uname | tr 'A-Z' 'a-z'` ]; then
        curl http://$HOST:$PORT/copy | xsel -i -b
    fi
}

send() {
    if [ 'darwin' = `uname | tr 'A-Z' 'a-z'` ]; then
        TEXT=`pbpaste`
        curl -X POST -H 'Content-Type:text/plain' -d "$TEXT" http://$HOST:$PORT/paste
    elif [ 'linux' = `uname | tr 'A-Z' 'a-z'` ]; then
        TEXT=`xsel -o -b`
        curl -X POST -H 'Content-Type:text/plain' -d "$TEXT" http://$HOST:$PORT/paste
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
