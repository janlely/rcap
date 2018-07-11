import express from 'express';
import sh from 'shelljs';
import bodyParser from 'body-parser';

let app = express();

app.use(bodyParser.text())

app.post("/paste", (req, res) => {
    console.log(req.body)
    if(process.platform == 'darwin'){
        sh.echo(req.body).exec('pbcopy', {silent: true});
    }else if(process.platform == 'linux'){
        sh.echo(req.body).exec('xsel -i -b', {silent: true});
    }
    res.send()
})


app.get("/copy", (req, res) => {
    if(process.platform == 'darwin'){
        let stdout = sh.exec('pbpaste', {silent:true}).stdout;
        res.send(stdout);
    }else if(process.platform == 'linux'){
        let stdout = sh.exec('xsel -o -b', {silent:true}).stdout;
        res.send(stdout);
    }
})

app.listen(9001);
