var http = require('http');
var os = require('os');

console.log('The test starting ....');

var handler = function(request,response){
    console.log("Received request from " + request.connecttion.remoteAddress);
    response.writeHead(200);
    response.end("Container HostName : " + os.hostname() + "\n");
}

// var handler2 = function (req, res) {
//     res.writeHead(200, {'Content-Type': 'text/html'});
//     res.end('Hello World');
// }

var www = http.createServer(handler)
www.listen(8080);

console.log('Server running at http://127.0.0.1:8080/');
