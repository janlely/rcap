### remote copy and paste

tool to share clipboard remotly, by http

### src/rcap-server.js

written by express

to interfaces /paste and /copy

* /paste

set clipboard with request.body

* /copy

send clipboard to response

### rcap-cli.sh

-h remote ip

-p remot port

-r receive, get clipboard content from remote host 

-s send, send clipboard content to remote host 


### working with systemctl

need to add Environment=DISPLAY=:0

```
[Unit]
Description=rcap-server
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
User=jay
WorkingDirectory=/home/jay/git/rcap
ExecStart=/home/jay/.nvm/versions/node/v8.11.3/bin/node dist/rcap-server.js
Environment=DISPLAY=:0
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=multi-user.target
Alias=rcap-server.service
```
