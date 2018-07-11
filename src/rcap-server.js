import express from 'express';
import sh from 'shelljs';

sh.config.silent = true;
let app = express();

app.post("/paste", (req, res) => {
    console.log(req.body)
    if(process.platform == 'darwin'){
        sh.echo(req.body).exec('pbcopy');
    }else if(process.platform == 'linux'){
        sh.echo(req.body).exec('xclip -i -sel clipboard')
    }
})


app.get("/copy", (req, res) => {
    console.log('hello world')
    if(process.platform == 'darwin'){
        let stdout = sh.exec('pbpaste', {silent:true}).stdout;
        res.send(stdout);
    }else if(process.platform == 'linux'){
        let stdout = sh.exec('xclip -o -sel clipboard', {silent:true}).stdout;
        res.send(stdout);
    }
})

app.listen(9001);
