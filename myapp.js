const express = require('express')
const app = express()
const port = 3001
const path = require('path');
var http = require('http');

http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/html'});
  res.end();
})

app.get('/', function(req, res) {
  res.sendFile(path.join(__dirname, '/Login-bookgear.html'));
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
})

app.post('/', (req, res) => {
  res.send('Got a POST request')
})

app.use(express.static('/Bookgear'));