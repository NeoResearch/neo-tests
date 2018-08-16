// MIT License - NeoResearch 2018

function LogMsg(timestamp, realtime, idstr, height=-1, view=-1, index=-1, tx=-1, nv=-1, status="", state="", role="", expected=-1, current=-1, nodes=-1)
{
   this.timestamp = timestamp;
   this.realtime = realtime;
   this.idstr = idstr;
   this.height = height;
   this.view = view;
   this.index = index;
   this.tx = tx;
   this.nv = nv;
   this.status = status;
   this.state = state;
   this.role = role;
   this.expected = expected;
   this.current = current;
   this.nodes = nodes;
};

// adds message from consensus_id to nodelist (and returns block height if known, otherwise -1)
function addMsg(x, consensus_id, nodelist=[], currentheight=-1) {
   if(x.charAt(9)==']') {  // seconds
      realtime = x.substring(1, 9);
      y = x.substring(10, x.length).trim();
   } else { // charAt 13 == ']' // milliseconds
      realtime = x.substring(1, 13);
      y = x.substring(14, x.length).trim();
   }
   a = realtime.split(':');
   timestamp = (+a[0]) * 60 * 60 + (+a[1]) * 60 + (+a[2]);
   timestamp *= 1000; // milliseconds resolution
   timestamp = Math.round(timestamp); // integer only

   idstr = ""; height = -1; view = -1; index = -1; tx = -1;
   nv = -1; status=""; state=""; role=""; expected=-1; current=-1; nodes=-1;
   idstr = "OnPrepareRequestReceived"; // [03:38:53] OnPrepareResponseReceived: height=59 view=0 index=0
   if(y.startsWith(idstr)) {
      height = Number(y.substring(y.indexOf("height=")+"height=".length, y.lenght).split(" ")[0]);
      view   = Number(y.substring(y.indexOf("view=")+"view=".length, y.lenght).split(" ")[0]);
      index  = Number(y.substring(y.indexOf("index=")+"index=".length, y.lenght).split(" ")[0]);
      tx     = Number(y.substring(y.indexOf("tx=")+"tx=".length, y.lenght).split(" ")[0]);
      nodelist.push(new LogMsg(timestamp, realtime, idstr, height, view, index, tx, nv, status, state, role, expected, current, nodes));
      return -1; // unknown block height
   }
   idstr = "initialize"; //[03:38:47] initialize: height=59 view=0 index=2 role=Backup
   if(y.startsWith(idstr)) {
      height = Number(y.substring(y.indexOf("height=")+"height=".length, y.lenght).split(" ")[0]);
      view   = Number(y.substring(y.indexOf("view=")+"view=".length, y.lenght).split(" ")[0]);
      index  = Number(y.substring(y.indexOf("index=")+"index=".length, y.lenght).split(" ")[0]);
      if(consensus_id != index) {
         console.log("ERROR! consensus "+ consensus_id + " should be "+ index);
         return;
      }
      role   = y.substring(y.indexOf("role=")+"role=".length, y.lenght).split(" ")[0];
      nodelist.push(new LogMsg(timestamp, realtime, idstr, height, view, index, tx, nv, status, state, role, expected, current, nodes));
      return height;
   }
   idstr = "timeout"; //[03:38:42] timeout: height=58 view=0 state=Primary
   if(y.startsWith(idstr)) {
      height = Number(y.substring(y.indexOf("height=")+"height=".length, y.lenght).split(" ")[0]);
      view   = Number(y.substring(y.indexOf("view=")+"view=".length, y.lenght).split(" ")[0]);
      state  = y.substring(y.indexOf("state=")+"state=".length, y.lenght).split(" ")[0];
      nodelist.push(new LogMsg(timestamp, realtime, idstr, height, view, index, tx, nv, status, state, role, expected, current, nodes));
      return height;
   }

   idstr1 = "send perpare request"; //[03:38:42] send perpare request: height=58 view=0
   idstr2 = "send prepare request";
   if(y.startsWith(idstr1) || y.startsWith(idstr2)) {
      idstr = idstr2;
      height = Number(y.substring(y.indexOf("height=")+"height=".length, y.lenght).split(" ")[0]);
      view   = Number(y.substring(y.indexOf("view=")+"view=".length, y.lenght).split(" ")[0]);
      index  = consensus_id;
      nodelist.push(new LogMsg(timestamp, realtime, idstr, height, view, index, tx, nv, status, state, role, expected, current, nodes));
      return height;
   }

   idstr1 = "send perpare response"; //[03:38:53] send perpare response
   idstr2 = "send prepare response";
   if(y.startsWith(idstr1) || y.startsWith(idstr2)) {
      idstr = idstr2;
      index  = consensus_id;
      height = currentheight; // receives current height as parameter (important to keep this!)
      nodelist.push(new LogMsg(timestamp, realtime, idstr, height, view, index, tx, nv, status, state, role, expected, current, nodes));
      return height;
   }
   idstr = "OnPrepareResponseReceived"; // [03:38:53] OnPrepareResponseReceived: height=59 view=0 index=0
   if(y.startsWith(idstr)) {
      height = Number(y.substring(y.indexOf("height=")+"height=".length, y.lenght).split(" ")[0]);
      view   = Number(y.substring(y.indexOf("view=")+"view=".length, y.lenght).split(" ")[0]);
      index  = Number(y.substring(y.indexOf("index=")+"index=".length, y.lenght).split(" ")[0]);
      nodelist.push(new LogMsg(timestamp, realtime, idstr, height, view, index, tx, nv, status, state, role, expected, current, nodes));
      return -1; // unknown block height
   }
   idstr = "relay block"; // [03:38:53] relay block: 0x06961a306d717d1507bf11704ebf80d59d7e9d42cd2beb410a5d5e01251fc8ae
   if(y.startsWith(idstr)) {
      height = currentheight; // receives current height as parameter (important to keep this!)
      nodelist.push(new LogMsg(timestamp, realtime, idstr, height, view, index, tx, nv, status, state, role, expected, current, nodes));
      return height;
   }
   idstr = "persist block"; // [03:38:53] persist block: 0x06961a306d717d1507bf11704ebf80d59d7e9d42cd2beb410a5d5e01251fc8ae
   if(y.startsWith(idstr)) {
      height = currentheight; // receives current height as parameter (important to keep this!)
      nodelist.push(new LogMsg(timestamp, realtime, idstr, height, view, index, tx, nv, status, state, role, expected, current, nodes));
      return height;
   }
   idstr = "reject block"; // [03:38:53] reject block: 0x06961a306d717d1507bf11704ebf80d59d7e9d42cd2beb410a5d5e01251fc8ae
   if(y.startsWith(idstr)) {
      height = currentheight; // receives current height as parameter (important to keep this!)
      nodelist.push(new LogMsg(timestamp, realtime, idstr, height, view, index, tx, nv, status, state, role, expected, current, nodes));
      return height;
   }
   idstr = "request change view"; // [03:39:49] request change view: height=66 view=0 nv=1 state=Backup, ViewChanging
   if(y.startsWith(idstr)) {
      index  = consensus_id;
      height = Number(y.substring(y.indexOf("height=")+"height=".length, y.lenght).split(" ")[0]);
      view   = Number(y.substring(y.indexOf("view=")+"view=".length, y.lenght).split(" ")[0]);
      nv     = Number(y.substring(y.indexOf("nv=")+"nv=".length, y.lenght).split(" ")[0]);
      state  = y.substring(y.indexOf("state=")+"state=".length, y.lenght).split("\n")[0];
      nodelist.push(new LogMsg(timestamp, realtime, idstr, height, view, index, tx, nv, status, state, role, expected, current, nodes));
      return height;
   }
   idstr = "OnChangeViewReceived"; // [17:54:18] OnChangeViewReceived: height=561 view=0 index=3 nv=1
   if(y.startsWith(idstr)) {
      height = Number(y.substring(y.indexOf("height=")+"height=".length, y.lenght).split(" ")[0]);
      view   = Number(y.substring(y.indexOf("view=")+"view=".length, y.lenght).split(" ")[0]);
      index  = Number(y.substring(y.indexOf("index=")+"index=".length, y.lenght).split(" ")[0]);
      nv     = Number(y.substring(y.indexOf("nv=")+"nv=".length, y.lenght).split(" ")[0]);
      nodelist.push(new LogMsg(timestamp, realtime, idstr, height, view, index, tx, nv, status, state, role, expected, current, nodes));
      return height;
   }
   idstr = "Commit sent"; // [23:46:37] Commit sent: height=3 state=Backup, RequestReceived, SignatureSent, CommitSent
   if(y.startsWith(idstr)) {
      index  = consensus_id;
      height = Number(y.substring(y.indexOf("height=")+"height=".length, y.lenght).split(" ")[0]);
      state  = y.substring(y.indexOf("state=")+"state=".length, y.lenght).split("\n")[0];
      nodelist.push(new LogMsg(timestamp, realtime, idstr, height, view, index, tx, nv, status, state, role, expected, current, nodes));
      return height;
   }
   idstr = "OnCommitAgreement"; // [23:46:39] OnCommitAgreement: height=3 view=0 index=1
   if(y.startsWith(idstr)) {
      height = Number(y.substring(y.indexOf("height=")+"height=".length, y.lenght).split(" ")[0]);
      view   = Number(y.substring(y.indexOf("view=")+"view=".length, y.lenght).split(" ")[0]);
      index  = Number(y.substring(y.indexOf("index=")+"index=".length, y.lenght).split(" ")[0]);
      nodelist.push(new LogMsg(timestamp, realtime, idstr, height, view, index, tx, nv, status, state, role, expected, current, nodes));
      return height;
   }
   return -1;
};

// find "send" message before "timestamp" on other consensus (k != receiver_id). senderidx = -1 means search all...
function findSendBefore(strid, cnode_lsts, senderidx, timestamp, receiver_id, height, view) {
   for(cid=0; cid<4; cid++) {
      if((senderidx != -1) && (senderidx != cid))
         continue; // specific senderidx must be found
      if(cid != receiver_id) {
         for(j=0; j<cnode_lsts[cid].length; j++) {
            if(cnode_lsts[cid][j].timestamp > timestamp)
               break; // ordered list by timestamp
            if((cnode_lsts[cid][j].idstr == strid) && (cnode_lsts[cid][j].height == height)){ // IGNORE VIEW FOR NOW! && (cnode_lsts[cid][j].view == view)) {
               return cnode_lsts[cid][j];
            }
         }
      }
   }
   return null;
};

// parseLogsGenerateJson($("#node2data")[0].value, $("#node4data")[0].value, $("#node1data")[0].value, $("#node3data")[0].value);
// order of logs is important!
function parseLogsGenerateJson(node1log, node2log, node3log, node4log) {
   var i = 0;
   node1logs = node1log.split("\n");
   node1list = [];
   node1id = 0;
   cheight = -1; // current height
   for(i=0; i<node1logs.length; i++) {
      tmpheight = addMsg(node1logs[i], node1id, node1list, cheight);
      if(tmpheight > 0)
         cheight = tmpheight;
   }

   node2logs = node2log.split("\n");
   node2list = [];
   node2id = 1;
   cheight = -1;
   for(i=0; i<node2logs.length; i++) {
      tmpheight = addMsg(node2logs[i], node2id, node2list, cheight);
      if(tmpheight > 0)
         cheight = tmpheight;
   }

   node3logs = node3log.split("\n");
   node3list = [];
   node3id = 2;
   cheight = -1;
   for(i=0; i<node3logs.length; i++) {
      tmpheight = addMsg(node3logs[i], node3id, node3list, cheight);
      if(tmpheight > 0)
         cheight = tmpheight;
   }

   node4logs = node4log.split("\n");
   node4list = [];
   node4id = 3;
   cheight = -1;
   for(i=0; i<node4logs.length; i++) {
      tmpheight = addMsg(node4logs[i], node4id, node4list, cheight);
      if(tmpheight > 0)
         cheight = tmpheight;
   }

   var beginTime = 100000000000;
   var endTime = 0;

   // any order
   nodelist = node1list.concat(node2list.concat(node3list.concat(node4list)));
   for(i=0; i<nodelist.length; i++) {
      if(nodelist[i].timestamp < beginTime)
         beginTime = nodelist[i].timestamp;
      if(nodelist[i].timestamp > endTime)
         endTime = nodelist[i].timestamp;
   }

   // normalizing times
   for(i=0; i<node1list.length; i++)
      node1list[i].timestamp -= beginTime;
   for(i=0; i<node2list.length; i++)
      node2list[i].timestamp -= beginTime;
   for(i=0; i<node3list.length; i++)
      node3list[i].timestamp -= beginTime;
   for(i=0; i<node4list.length; i++)
      node4list[i].timestamp -= beginTime;

   //beginTime -= 1; // adjust one before
   //endTime += 1;   // adjust one after
   endTime -= beginTime;
   beginTime -= beginTime;
   var begin_times = [];
   var k = 0;
   for(k=0; k<4; k++)
      begin_times.push(beginTime);
   var cnode_lists = [null, null, null, null];
   cnode_lists[node1id] = node1list;
   cnode_lists[node2id] = node2list;
   cnode_lists[node3id] = node3list;
   cnode_lists[node4id] = node4list;

   var cnode_json = [];
   var color_list = [];

   for(k=0; k<4; k++) {
      console.log("consensus k="+k);
      for(i=0; i<cnode_lists[k].length; i++) {
         //console.log("consensus k="+k+" i="+i);
         if(cnode_lists[k][i].idstr == "initialize") {
            begin_times[k] = cnode_lists[k][i].timestamp;
            continue;
         }
         if(cnode_lists[k][i].idstr == "timeout") {
            var values = [];
            values.push({"year" : begin_times[k]+0.01, "position":k, "realtime":0});
            values.push({"year" : cnode_lists[k][i].timestamp+0.01, "position":k, "realtime":cnode_lists[k][i].realtime});
            if(cnode_lists[k][i].state=="Primary") {
               cnode_json.push({"name":"PrimaryTimeout_"+k+ "_"+cnode_lists[k][i].height+"_"+begin_times[k]+"_"+cnode_lists[k][i].timestamp, "values":values});
               color_list.push("#76448E");
            }
            else {
               cnode_json.push({"name":"Timeout_"+k+"_"+cnode_lists[k][i].height+"_"+begin_times[k]+"_"+cnode_lists[k][i].timestamp, "values":values});
               color_list.push("#CCCCCC");
            }
         }

         if(cnode_lists[k][i].idstr == "OnPrepareRequestReceived") {
            //console.log("OnPrepareRequestReceived");
            var sendermsg = findSendBefore("send prepare request", cnode_lists, cnode_lists[k][i].index, cnode_lists[k][i].timestamp, k, cnode_lists[k][i].height, cnode_lists[k][i].view);
            if(!sendermsg) {
               console.log("findSendBefore for OnPrepareRequestReceived k="+k+" height="+cnode_lists[k][i].height);
               console.log("WARNING! could not find origin of message.");//+JSON.stringify(cnode_lists[k][i]));
               continue;
            }
            var senderc = sendermsg.index;  // sender consensus (destination is k)
            if(senderc == -1) {
               console.log("ERROR getting findSendBefore (came with height = -1)"+JSON.stringify(sendermsg));
            }
            var values = [];
            values.push({"year" : ""+sendermsg.timestamp+".02"+k+""+senderc+""+senderc+""+k, "position": senderc, "realtime":sendermsg.realtime});
            values.push({"year" : ""+cnode_lists[k][i].timestamp+".02"+senderc+""+k+""+senderc+""+k, "position":k, "realtime":cnode_lists[k][i].realtime});
            cnode_json.push({"name":"PrepRequest_"+senderc+"_"+sendermsg.height+"_"+k, "values":values});
            color_list.push("#FEC60B");
         }

         if(cnode_lists[k][i].idstr == "OnPrepareResponseReceived") {
            var sendermsg = findSendBefore("send prepare response", cnode_lists, cnode_lists[k][i].index, cnode_lists[k][i].timestamp, k, cnode_lists[k][i].height, cnode_lists[k][i].view);
            if(!sendermsg) {
               console.log("findSendBefore for OnPrepareResponseReceived k="+k+" height="+cnode_lists[k][i].height);
               console.log("WARNING! could not find origin of message.");//+JSON.stringify(cnode_lists[k][i]));
               continue;
            }
            var senderc = sendermsg.index;  // sender consensus (destination is k)
            if(senderc == -1) {
               console.log("ERROR getting findSendBefore (came with height = -1)"+JSON.stringify(sendermsg));
            }
            var values = [];
            values.push({"year" : ""+sendermsg.timestamp+".03"+k+""+senderc+""+senderc+""+k, "position": senderc, "realtime":sendermsg.realtime});
            values.push({"year" : ""+cnode_lists[k][i].timestamp+".03"+senderc+""+k+""+senderc+""+k, "position":k, "realtime":cnode_lists[k][i].realtime});
            cnode_json.push({"name":"PrepResponse_"+senderc+"_"+sendermsg.height+"_"+k, "values":values});
            color_list.push("#00FF00");
         }

         if(cnode_lists[k][i].idstr == "OnChangeViewReceived") {
            var sendermsg = findSendBefore("request change view", cnode_lists, cnode_lists[k][i].index, cnode_lists[k][i].timestamp, k, cnode_lists[k][i].height, cnode_lists[k][i].view);
            if(!sendermsg) {
               console.log("findSendBefore for OnChangeViewReceived k="+k+" height="+cnode_lists[k][i].height);
               console.log("WARNING! could not find origin of message.");//+JSON.stringify(cnode_lists[k][i]));
               continue;
            }
            var senderc = sendermsg.index;  // sender consensus (destination is k)
            if(senderc == -1) {
               console.log("ERROR getting findSendBefore (came with height = -1)"+JSON.stringify(sendermsg));
            }
            var values = [];
            values.push({"year" : ""+sendermsg.timestamp+".04"+k, "position": senderc, "realtime":sendermsg.realtime});
            values.push({"year" : ""+cnode_lists[k][i].timestamp+".04"+senderc, "position":k, "realtime":cnode_lists[k][i].realtime});
            cnode_json.push({"name":"ChangeView_"+senderc+"_"+sendermsg.height+"_"+k+"_"+cnode_lists[k][i].nv, "values":values});
            color_list.push("#FF0000");
         }

         if(cnode_lists[k][i].idstr == "OnCommitAgreement") {
            var sendermsg = findSendBefore("Commit sent", cnode_lists, cnode_lists[k][i].index, cnode_lists[k][i].timestamp, k, cnode_lists[k][i].height, cnode_lists[k][i].view);
            if(!sendermsg) {
               console.log("findSendBefore for OnCommitAgreement k="+k+" height="+cnode_lists[k][i].height);
               console.log("WARNING! could not find origin of message.");//+JSON.stringify(cnode_lists[k][i]));
               continue;
            }
            var senderc = sendermsg.index;  // sender consensus (destination is k)
            if(senderc == -1) {
               console.log("ERROR getting findSendBefore (came with height = -1)"+JSON.stringify(sendermsg));
            }
            var values = [];
            values.push({"year" : ""+sendermsg.timestamp+".05"+k+""+senderc+""+senderc+""+k, "position": senderc, "realtime":sendermsg.realtime});
            values.push({"year" : ""+cnode_lists[k][i].timestamp+".05"+senderc+""+k+""+senderc+""+k, "position":k, "realtime":cnode_lists[k][i].realtime});
            cnode_json.push({"name":"CommitAgreement_"+senderc+"_"+sendermsg.height+"_"+k+"_"+cnode_lists[k][i].nv, "values":values});
            color_list.push("#0000FF");
         }
         // TODO: continue.. (?)
      }
   }


   return {"data": cnode_json, "colors" : color_list, "beginTime" : beginTime, "endTime" : endTime, "rawdata" : cnode_lists};
}

// parseLogsGenerateJson($("#node2data")[0].value, $("#node4data")[0].value, $("#node1data")[0].value, $("#node3data")[0].value);
