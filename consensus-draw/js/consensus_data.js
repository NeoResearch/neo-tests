// MIT License - NeoResearch 2018

var example = test_example();
console.log("testing for duplicate messages (name collisions)");
// testing for name colision
var col_count = 0;
for(var i=0; i<example.data.length; i++)
   for(var j=i+1; j<example.data.length; j++) {
         //console.log(example.data[i]);
         if(example.data[i].name == example.data[j].name) {
            console.log("REMOVING DUPLICATE MESSAGE: name collision for '"+example.data[i].name+"' at i="+i+" j="+j);
            col_count++;
            example.data.splice(j,1); // removing repeated element j
            example.colors.splice(j,1);
            j--;
         }
   }
console.log("duplicates:"+col_count);

for(var i=0; i<example.data.length; i++)
   for(var j=i+1; j<example.data.length; j++) {
         //console.log(example.data[i]);
         if(example.data[i].values[0].year == example.data[j].values[0].year) {
            console.log("WARNING: time collision for '"+example.data[i].name+"' at i="+i+" j="+j+" with first "+example.data[j].name);
            //col_count++;
            //example.data.splice(j,1); // removing repeated element j
            //example.colors.splice(j,1);
            //j--;
         }

         if(example.data[i].values[0].year == example.data[j].values[1].year) {
            console.log("WARNING: time collision for '"+example.data[i].name+"' at i="+i+" j="+j+" with second "+example.data[j].name);
            //col_count++;
            //example.data.splice(j,1); // removing repeated element j
            //example.colors.splice(j,1);
            //j--;
         }
   }

/*
while(example.data.length > 20) {
   console.log("will pop:"+JSON.stringify(example.data[example.data.length-1]));
   console.log("will pop color:"+JSON.stringify(example.colors[example.colors.length-1]));
   example.data.pop();
   example.colors.pop();
}
*/

//example.data[example.data.length-1].values[0].year = "70938.0331"

console.log(example);

var consensus_data = example.data;
/*
var consensus_data = [
  {
    "name": "PrepResponse_2_559_0",
    "values": [
      {
        "year": "64436.030",
        "position": 2
      },
      {
        "year": "64438.032",
        "position": 0
      }
    ]
  },
  {
    "name": "PrimaryTimeout_0_560_64439_64444",
    "values": [
      {
        "year": 64439.01,
        "position": 0
      },
      {
        "year": 64444.01,
        "position": 0
      }
    ]
  },
  {
    "name": "PrepResponse_3_560_0",
    "values": [
      {
        "year": "64445.030",
        "position": 3
      },
      {
        "year": "64447.033",
        "position": 0
      }
    ]
  },
  {
    "name": "PrepResponse_2_560_0",
    "values": [
      {
        "year": "64445.030",
        "position": 2
      },
      {
        "year": "64447.032",
        "position": 0
      }
    ]
  },
  {
    "name": "PrepResponse_3_561_0",
    "values": [
      {
        "year": "64452.030",
        "position": 3
      },
      {
        "year": "64454.033",
        "position": 0
      }
    ]
  },
  {
    "name": "PrepRequest_1_561_0",
    "values": [
      {
        "year": "64451.020",
        "position": 1
      },
      {
        "year": "64457.021",
        "position": 0
      }
    ]
  },
  {
    "name": "Timeout_0_561_64447_64457",
    "values": [
      {
        "year": 64447.01,
        "position": 0
      },
      {
        "year": 64457.01,
        "position": 0
      }
    ]
  },
  {
    "name": "ChangeView_3_561_0_1",
    "values": [
      {
        "year": "64456.040",
        "position": 3
      },
      {
        "year": "64458.043",
        "position": 0
      }
    ]
  },
  {
    "name": "PrepRequest_2_562_0",
    "values": [
      {
        "year": "64466.020",
        "position": 2
      },
      {
        "year": "64468.022",
        "position": 0
      }
    ]
  },
  {
    "name": "PrepResponse_3_562_0",
    "values": [
      {
        "year": "64467.030",
        "position": 3
      },
      {
        "year": "64469.033",
        "position": 0
      }
    ]
  },
  {
    "name": "PrepRequest_3_563_0",
    "values": [
      {
        "year": "64474.020",
        "position": 3
      },
      {
        "year": "64479.023",
        "position": 0
      }
    ]
  },
  {
    "name": "Timeout_0_563_64469_64479",
    "values": [
      {
        "year": 64469.01,
        "position": 0
      },
      {
        "year": 64479.01,
        "position": 0
      }
    ]
  },
  {
    "name": "PrepResponse_1_563_0",
    "values": [
      {
        "year": "64476.030",
        "position": 1
      },
      {
        "year": "64480.031",
        "position": 0
      }
    ]
  },
  {
    "name": "PrepResponse_2_563_0",
    "values": [
      {
        "year": "64475.030",
        "position": 2
      },
      {
        "year": "64480.032",
        "position": 0
      }
    ]
  },
  {
    "name": "PrimaryTimeout_0_564_64480_64485",
    "values": [
      {
        "year": 64480.01,
        "position": 0
      },
      {
        "year": 64485.01,
        "position": 0
      }
    ]
  },
  {
    "name": "PrepResponse_3_564_0",
    "values": [
      {
        "year": "64486.030",
        "position": 3
      },
      {
        "year": "64488.033",
        "position": 0
      }
    ]
  },
  {
    "name": "PrepResponse_1_564_0",
    "values": [
      {
        "year": "64486.030",
        "position": 1
      },
      {
        "year": "64488.031",
        "position": 0
      }
    ]
  },
  {
    "name": "PrepRequest_1_565_0",
    "values": [
      {
        "year": "64492.020",
        "position": 1
      },
      {
        "year": "64494.021",
        "position": 0
      }
    ]
  },
  {
    "name": "PrepResponse_3_565_0",
    "values": [
      {
        "year": "64493.030",
        "position": 3
      },
      {
        "year": "64495.033",
        "position": 0
      }
    ]
  },
  {
    "name": "PrepResponse_2_559_1",
    "values": [
      {
        "year": "64436.031",
        "position": 2
      },
      {
        "year": "64437.032",
        "position": 1
      }
    ]
  },
  {
    "name": "PrepRequest_0_560_1",
    "values": [
      {
        "year": "64444.021",
        "position": 0
      },
      {
        "year": "64446.020",
        "position": 1
      }
    ]
  },
  {
    "name": "PrepResponse_3_560_1",
    "values": [
      {
        "year": "64445.031",
        "position": 3
      },
      {
        "year": "64446.033",
        "position": 1
      }
    ]
  },
  {
    "name": "PrimaryTimeout_1_561_64446_64451",
    "values": [
      {
        "year": 64446.01,
        "position": 1
      },
      {
        "year": 64451.01,
        "position": 1
      }
    ]
  },
  {
    "name": "PrepResponse_3_561_1",
    "values": [
      {
        "year": "64452.031",
        "position": 3
      },
      {
        "year": "64454.033",
        "position": 1
      }
    ]
  },
  {
    "name": "PrepResponse_0_561_1",
    "values": [
      {
        "year": "64457.031",
        "position": 0
      },
      {
        "year": "64458.030",
        "position": 1
      }
    ]
  },
  {
    "name": "PrepRequest_2_562_1",
    "values": [
      {
        "year": "64466.021",
        "position": 2
      },
      {
        "year": "64467.022",
        "position": 1
      }
    ]
  },
  {
    "name": "Timeout_1_562_64458_64468",
    "values": [
      {
        "year": 64458.01,
        "position": 1
      },
      {
        "year": 64468.01,
        "position": 1
      }
    ]
  },
  {
    "name": "PrepResponse_3_562_1",
    "values": [
      {
        "year": "64467.031",
        "position": 3
      },
      {
        "year": "64469.033",
        "position": 1
      }
    ]
  },
  {
    "name": "PrepRequest_3_563_1",
    "values": [
      {
        "year": "64474.021",
        "position": 3
      },
      {
        "year": "64476.023",
        "position": 1
      }
    ]
  },
  {
    "name": "PrepResponse_2_563_1",
    "values": [
      {
        "year": "64475.031",
        "position": 2
      },
      {
        "year": "64477.032",
        "position": 1
      }
    ]
  },
  {
    "name": "PrepRequest_0_564_1",
    "values": [
      {
        "year": "64485.021",
        "position": 0
      },
      {
        "year": "64486.020",
        "position": 1
      }
    ]
  },
  {
    "name": "PrepResponse_3_564_1",
    "values": [
      {
        "year": "64486.031",
        "position": 3
      },
      {
        "year": "64487.033",
        "position": 1
      }
    ]
  },
  {
    "name": "PrimaryTimeout_1_565_64487_64492",
    "values": [
      {
        "year": 64487.01,
        "position": 1
      },
      {
        "year": 64492.01,
        "position": 1
      }
    ]
  },
  {
    "name": "PrepResponse_3_565_1",
    "values": [
      {
        "year": "64493.031",
        "position": 3
      },
      {
        "year": "64495.033",
        "position": 1
      }
    ]
  },
  {
    "name": "PrepResponse_2_565_1",
    "values": [
      {
        "year": "64493.031",
        "position": 2
      },
      {
        "year": "64495.032",
        "position": 1
      }
    ]
  },
  {
    "name": "PrepRequest_2_566_1",
    "values": [
      {
        "year": "64499.021",
        "position": 2
      },
      {
        "year": "64501.022",
        "position": 1
      }
    ]
  },
  {
    "name": "PrepResponse_3_566_1",
    "values": [
      {
        "year": "64500.031",
        "position": 3
      },
      {
        "year": "64502.033",
        "position": 1
      }
    ]
  },
  {
    "name": "PrepRequest_0_560_2",
    "values": [
      {
        "year": "64444.022",
        "position": 0
      },
      {
        "year": "64445.020",
        "position": 2
      }
    ]
  },
  {
    "name": "PrepResponse_3_560_2",
    "values": [
      {
        "year": "64445.032",
        "position": 3
      },
      {
        "year": "64446.033",
        "position": 2
      }
    ]
  },
  {
    "name": "Timeout_2_561_64446_64457",
    "values": [
      {
        "year": 64446.01,
        "position": 2
      },
      {
        "year": 64457.01,
        "position": 2
      }
    ]
  },
  {
    "name": "PrepRequest_1_561_2",
    "values": [
      {
        "year": "64451.022",
        "position": 1
      },
      {
        "year": "64461.021",
        "position": 2
      }
    ]
  },
  {
    "name": "PrepResponse_3_561_2",
    "values": [
      {
        "year": "64452.032",
        "position": 3
      },
      {
        "year": "64461.033",
        "position": 2
      }
    ]
  },
  {
    "name": "PrimaryTimeout_2_562_64461_64466",
    "values": [
      {
        "year": 64461.01,
        "position": 2
      },
      {
        "year": 64466.01,
        "position": 2
      }
    ]
  },
  {
    "name": "PrepResponse_1_562_2",
    "values": [
      {
        "year": "64467.032",
        "position": 1
      },
      {
        "year": "64468.031",
        "position": 2
      }
    ]
  },
  {
    "name": "PrepResponse_0_562_2",
    "values": [
      {
        "year": "64468.032",
        "position": 0
      },
      {
        "year": "64469.030",
        "position": 2
      }
    ]
  },
  {
    "name": "PrepRequest_3_563_2",
    "values": [
      {
        "year": "64474.022",
        "position": 3
      },
      {
        "year": "64475.023",
        "position": 2
      }
    ]
  },
  {
    "name": "PrepResponse_1_563_2",
    "values": [
      {
        "year": "64476.032",
        "position": 1
      },
      {
        "year": "64478.031",
        "position": 2
      }
    ]
  },
  {
    "name": "PrepRequest_0_564_2",
    "values": [
      {
        "year": "64485.022",
        "position": 0
      },
      {
        "year": "64486.020",
        "position": 2
      }
    ]
  },
  {
    "name": "PrepResponse_1_564_2",
    "values": [
      {
        "year": "64486.032",
        "position": 1
      },
      {
        "year": "64487.031",
        "position": 2
      }
    ]
  },
  {
    "name": "PrepResponse_3_564_2",
    "values": [
      {
        "year": "64486.032",
        "position": 3
      },
      {
        "year": "64487.033",
        "position": 2
      }
    ]
  },
  {
    "name": "PrepRequest_1_565_2",
    "values": [
      {
        "year": "64492.022",
        "position": 1
      },
      {
        "year": "64493.021",
        "position": 2
      }
    ]
  },
  {
    "name": "PrepResponse_3_565_2",
    "values": [
      {
        "year": "64493.032",
        "position": 3
      },
      {
        "year": "64494.033",
        "position": 2
      }
    ]
  },
  {
    "name": "PrimaryTimeout_2_566_64494_64499",
    "values": [
      {
        "year": 64494.01,
        "position": 2
      },
      {
        "year": 64499.01,
        "position": 2
      }
    ]
  },
  {
    "name": "PrepResponse_2_559_3",
    "values": [
      {
        "year": "64436.033",
        "position": 2
      },
      {
        "year": "64437.032",
        "position": 3
      }
    ]
  },
  {
    "name": "PrepRequest_0_560_3",
    "values": [
      {
        "year": "64444.023",
        "position": 0
      },
      {
        "year": "64445.020",
        "position": 3
      }
    ]
  },
  {
    "name": "PrepResponse_2_560_3",
    "values": [
      {
        "year": "64445.033",
        "position": 2
      },
      {
        "year": "64446.032",
        "position": 3
      }
    ]
  },
  {
    "name": "PrepRequest_1_561_3",
    "values": [
      {
        "year": "64451.023",
        "position": 1
      },
      {
        "year": "64452.021",
        "position": 3
      }
    ]
  },
  {
    "name": "Timeout_3_561_64446_64456",
    "values": [
      {
        "year": 64446.01,
        "position": 3
      },
      {
        "year": 64456.01,
        "position": 3
      }
    ]
  },
  {
    "name": "PrepResponse_0_561_3",
    "values": [
      {
        "year": "64457.033",
        "position": 0
      },
      {
        "year": "64458.030",
        "position": 3
      }
    ]
  },
  {
    "name": "PrepRequest_2_562_3",
    "values": [
      {
        "year": "64466.023",
        "position": 2
      },
      {
        "year": "64467.022",
        "position": 3
      }
    ]
  },
  {
    "name": "Timeout_3_562_64458_64468",
    "values": [
      {
        "year": 64458.01,
        "position": 3
      },
      {
        "year": 64468.01,
        "position": 3
      }
    ]
  },
  {
    "name": "PrepResponse_1_562_3",
    "values": [
      {
        "year": "64467.033",
        "position": 1
      },
      {
        "year": "64469.031",
        "position": 3
      }
    ]
  },
  {
    "name": "PrimaryTimeout_3_563_64469_64474",
    "values": [
      {
        "year": 64469.01,
        "position": 3
      },
      {
        "year": 64474.01,
        "position": 3
      }
    ]
  },
  {
    "name": "PrepResponse_2_563_3",
    "values": [
      {
        "year": "64475.033",
        "position": 2
      },
      {
        "year": "64476.032",
        "position": 3
      }
    ]
  },
  {
    "name": "PrepResponse_1_563_3",
    "values": [
      {
        "year": "64476.033",
        "position": 1
      },
      {
        "year": "64477.031",
        "position": 3
      }
    ]
  },
  {
    "name": "PrepRequest_0_564_3",
    "values": [
      {
        "year": "64485.023",
        "position": 0
      },
      {
        "year": "64486.020",
        "position": 3
      }
    ]
  },
  {
    "name": "Timeout_3_564_64477_64487",
    "values": [
      {
        "year": 64477.01,
        "position": 3
      },
      {
        "year": 64487.01,
        "position": 3
      }
    ]
  },
  {
    "name": "PrepResponse_1_564_3",
    "values": [
      {
        "year": "64486.033",
        "position": 1
      },
      {
        "year": "64487.031",
        "position": 3
      }
    ]
  },
  {
    "name": "PrepRequest_1_565_3",
    "values": [
      {
        "year": "64492.023",
        "position": 1
      },
      {
        "year": "64493.021",
        "position": 3
      }
    ]
  },
  {
    "name": "PrepResponse_2_565_3",
    "values": [
      {
        "year": "64493.033",
        "position": 2
      },
      {
        "year": "64494.032",
        "position": 3
      }
    ]
  },
  {
    "name": "PrepRequest_2_566_3",
    "values": [
      {
        "year": "64499.023",
        "position": 2
      },
      {
        "year": "64500.022",
        "position": 3
      }
    ]
  }
];
*/

allMessageNames = [];
messageNamesByID = [];
consensus_data.forEach(function(d,i) {
    allMessageNames[i] = d.name;
	messageNamesByID[d.name] = i;
   //console.log("got "+d.name);
});

// orange: "#FFC600" / "#FEC60B"
// purple: "#76448E"

var colorMessages = d3.scale.ordinal().range(example.colors).domain(allMessageNames);
/*
var colorMessages = d3.scale.ordinal()
		.range([
  "#00FF00",
  "#76448E",
  "#00FF00",
  "#00FF00",
  "#00FF00",
  "#FEC60B",
  "#CCCCCC",
  "#FF0000",
  "#FEC60B",
  "#00FF00",
  "#FEC60B",
  "#CCCCCC",
  "#00FF00",
  "#00FF00",
  "#76448E",
  "#00FF00",
  "#00FF00",
  "#FEC60B",
  "#00FF00",
  "#00FF00",
  "#FEC60B",
  "#00FF00",
  "#76448E",
  "#00FF00",
  "#00FF00",
  "#FEC60B",
  "#CCCCCC",
  "#00FF00",
  "#FEC60B",
  "#00FF00",
  "#FEC60B",
  "#00FF00",
  "#76448E",
  "#00FF00",
  "#00FF00",
  "#FEC60B",
  "#00FF00",
  "#FEC60B",
  "#00FF00",
  "#CCCCCC",
  "#FEC60B",
  "#00FF00",
  "#76448E",
  "#00FF00",
  "#00FF00",
  "#FEC60B",
  "#00FF00",
  "#FEC60B",
  "#00FF00",
  "#00FF00",
  "#FEC60B",
  "#00FF00",
  "#76448E",
  "#00FF00",
  "#FEC60B",
  "#00FF00",
  "#FEC60B",
  "#CCCCCC",
  "#00FF00",
  "#FEC60B",
  "#CCCCCC",
  "#00FF00",
  "#76448E",
  "#00FF00",
  "#00FF00",
  "#FEC60B",
  "#CCCCCC",
  "#00FF00",
  "#FEC60B",
  "#00FF00",
  "#FEC60B"
]).domain(allMessageNames);
*/

var startYear = example.beginTime, //64431,
	endYear = example.endTime, //64503,
	yearRange = endYear - startYear;
