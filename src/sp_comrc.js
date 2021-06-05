var http = require('http');
var os = require('os');

console.log('The test starting ....');

var handler = function(request,response){
    console.log("Received request from " + request.connection.remoteAddress);
    response.writeHead(200);
    response.end("Container HostName : " + os.hostname() + "\n");
}

var www = http.createServer(handler)
www.listen(8080);

console.log("Server running at http://127.0.0.1:8080/");
