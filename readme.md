### remote copy and paste

剪切板共享工具，http实现主机之间的剪切板共享

### src/rcap-server.js
用express写的简单http服务
两个接口/paste和/copy

* /paste

把request.body中的内容，放到剪切板中

* /copy

把剪切板中的内容写到response.body中


### rcap-cli.sh

-h 运程主机ip

-p 远程主机port

-r receive, 把远程主机的剪切板的内容复制到本机剪切板

-s send, 把本机剪切板的内容发送到远程主机的剪切板中
