var RPC_BASE_IMAGE="eco-neo-csharp-noderpc-mainnet-testnet";

var express  = require('express');
var http = require('http');
var logger = require('morgan');             // log requests to the console (express4)
var bodyParser = require('body-parser');    // pull information from HTML POST (express4)
var app = express();


//app.use(express.static(__dirname + '/'));                 // set the static files location /public/img will be /img for users
app.use(logger('dev'));                                         // log every request to the console
app.use(bodyParser.urlencoded({                                 // parse application/x-www-form-urlencoded
   parameterLimit: 100000,                // bigger parameter sizes
   limit: '5mb',                          // bigger parameter sizes
   extended: false
 }));
app.use(bodyParser.json());                                     // parse application/json
app.use(bodyParser.json({ type: 'application/vnd.api+json' })); // parse application/vnd.api+json as json

app.use(function (req, res, next) {
res.setHeader('Access-Control-Allow-Origin', '*');
res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
res.setHeader('Access-Control-Allow-Credentials', true);
next();
});

//app.listen(9000);

var server = http.createServer(app);

server.listen(12000 || process.env.PORT, (err) => {
  if (err) {
    return console.log('something bad happened', err)
  }
  console.log('State snapshot RPC server is up')
})

app.get('/', (req, res) => {
  console.log("Welcome to our State Snapshot RPC Server - NeoResearch");
  var obj={};
  obj["result"] = true;
  obj["welcome"] = "Welcome to our State Snapshot RPC Server - NeoResearch.";
  var arrMethods=[];
  arrMethods.push({method: "/getSnapshots" });
  arrMethods.push({method: "/getSnapshotsBestDifference/:blockHeight" });
  obj["methods"] = arrMethods;
  res.status(200).send(obj);
});


var optionsDefault = {
  timeout: 10000, // 5 seconds is already a lot... but C# is requiring 10!
  killSignal: 'SIGKILL'
}

var cmdDockerImagesFilter="(docker images " + RPC_BASE_IMAGE + "* | tail -n +2) | awk '{ print $1,$2 }'";
var rpcSnapshots = [];
var objErrorHandler = {};

function dockerImagesToArray(planImagesResponse)
{
        var arr = [];
        var planImagesResponse = planImagesResponse.match(/[^\s]+/g);
        // we loop from 1 to 1 less than the length because
        // the first two elements are empty due to the way the split worked
        for (var i = 0, l = planImagesResponse.length - 1; i < l; i=i+2) {
        	var obj = {};
        	obj["rpcsnapshot"] = planImagesResponse[i];
        	obj["version"] = planImagesResponse[i+1];
		obj["snapshotHeight"] = planImagesResponse[i].substring( (RPC_BASE_IMAGE+"-").length);
        	arr.push(obj);
        }

	arr.sort(function (a, b) {
	    return a.snapshotHeight.localeCompare(b.snapshotHeight);
	});

	return arr;
}

app.get('/getSnapshots', (req, res) => {
  var cmddocker = cmdDockerImagesFilter;
  console.log(cmddocker);

  var child = require('child_process').exec(cmddocker, optionsDefault, (e, stdout1, stderr)=> {
    if (e instanceof Error) {
      res.send("Error:"+e);
      console.error(e);
    }
    else {
        //x = stdout1.replace(/[^\x00-\x7F]/g, "");
        //res.setHeader('Content-Type', 'text/plain; charset="utf-8"');
	rpcSnapshots = dockerImagesToArray(stdout1);
        var rpcSnapshotsJson = {};
        rpcSnapshotsJson["result"] = true;
        rpcSnapshotsJson["images"] = rpcSnapshots;
	//res.send(rpcSnapshots);
	res.send(rpcSnapshotsJson);
    }
  });
});

function isInt(value) {
  var x = parseFloat(value);
  return !isNaN(value) && (x | 0) === x;
}


function checkInteger(intParamToCheck, intMin = 0 , intMax = 10000000000){
  if(!isInt(intParamToCheck) || intParamToCheck < intMin || intParamToCheck > intMax )
  {
	 console.log("Some integer param was just checked " + intParamToCheck + " and it not an intenger or not within values " + intMin + "/" + intMax);
         objErrorHandler["result"] = false;
         objErrorHandler["reason"] = "Some integer param was just checked " + intParamToCheck + " and it not an intenger or not within values " + intMin + "/" + intMax;
	 throw new Error("BROKEN")
  }
}

function getSnapshotsBestImage(blockHeight)
{
	var minIndex = 0;

	//snapshotHeight are ordered in ascending order
 	for(var sI=0;sI < rpcSnapshots.length; sI++)
        {
	        if(rpcSnapshots[sI].snapshotHeight < blockHeight) 
			minIndex = sI;
                if(rpcSnapshots[sI].snapshotHeight > blockHeight) 
			break;
        }
	return minIndex;
}

//Clean function - rpcSnapshots and blockHeight should had already been checked
function getBestIndex(blockHeight)
{
	var bestIndexJson = {};
	var minIndex = getSnapshotsBestImage(blockHeight);
        var maxIndex = rpcSnapshots.length;
	// now we just want the first that is higher
 	for(var sI=0;sI < rpcSnapshots.length; sI++)
	        if(rpcSnapshots[sI].snapshotHeight > blockHeight) 
		{
			maxIndex = sI;
			break;
		}

	if(minIndex > maxIndex)
		console.log("WE HAVE A PROBLEM INSIDE getBestIndex!");

	bestIndexJson["lowerIndex"] = minIndex;
	bestIndexJson["lowerHeight"] = rpcSnapshots[minIndex].snapshotHeight;
	bestIndexJson["upperIndex"] = maxIndex;
	bestIndexJson["upperHeight"] = rpcSnapshots[maxIndex].snapshotHeight;
        bestIndexJson["heightDiff"] = rpcSnapshots[maxIndex].snapshotHeight - rpcSnapshots[minIndex].snapshotHeight;
	return bestIndexJson;
}

function checkSnapshots()
{
  objErrorHandler = {};
  if(rpcSnapshots.length === 0)
  {
         objErrorHandler["result"] = false;
         objErrorHandler["reason"] = "Snapshots json array seems to be empty. Maybe theree are not snapshots. Check the route /getSnapshots first (it will probably do its job)!";
	 throw new Error("BROKEN")
  }
}

app.get('/getSnapshotsBestDifference/:blockHeight', (req, res) => {
  var obj = {};
  checkSnapshots();

  var minSnapshotHeight = rpcSnapshots[0].snapshotHeight;
  var maxSnapshotHeight = rpcSnapshots[rpcSnapshots.length-1].snapshotHeight;

  //console.log(minSnapshotHeight)
  //console.log(maxSnapshotHeight)
  //console.log(req.params.blockHeight)

  checkInteger(req.params.blockHeight, minSnapshotHeight , maxSnapshotHeight);

  obj["result"] = true;
  obj["reason"] = "best pair has been obtained!";
  obj["bestSnapshotPair"] = getBestIndex(req.params.blockHeight);

  res.send(obj);
});

app.get('/getStorage/scriptHash/:scriptHash/key/:key/type/:type/blockHeight/:blockHeight', (req, res) => {
  var obj = {};
  checkSnapshots();

  var minSnapshotHeight = rpcSnapshots[0].snapshotHeight;
  var maxSnapshotHeight = rpcSnapshots[rpcSnapshots.length-1].snapshotHeight;

  checkInteger(req.params.blockHeight, minSnapshotHeight , maxSnapshotHeight);
  
  obj["result"] = true;
  obj["reason"] = "best pair has been obtained!";
  obj["bestSnapshotPair"] = getBestIndex(req.params.blockHeight);

  res.send(obj);
});

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handler
app.use(function(err, req, res, next) {
  // render the error page
  if(!objErrorHandler.result)
  {
	console.log("Obj error handler should have something");
	//console.log(objErrorHandler);
	res.send(objErrorHandler);
	return;
  }

  var obj={};
  obj["result"] = false;
  obj["reason"] = "Something went wrong in this route invocation! Try again with our set of knonw functions provided by invoking our root route!! Good luck.";
  res.send(obj);
});

module.exports = app;
