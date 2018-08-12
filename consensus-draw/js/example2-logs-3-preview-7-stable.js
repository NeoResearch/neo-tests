// MIT License - NeoResearch 2018

// ==================================== BEGIN EXAMPLE ============================================

function exdata1() { return ' \n\
[19:42:13] OnPrepareResponseReceived: height=756 view=0 index=1 \n\
[19:42:13] relay block: 0xde51aa19c0dcbcf8b83bfd7ea57d58a6725dba6c7760468a3b5b498f6eec02ff \n\
[19:42:13] persist block: 0xde51aa19c0dcbcf8b83bfd7ea57d58a6725dba6c7760468a3b5b498f6eec02ff \n\
[19:42:13] initialize: height=757 view=0 index=0 role=Backup \n\
[19:42:18] OnPrepareRequestReceived: height=757 view=0 index=1 tx=1 \n\
[19:42:18] send prepare response \n\
[19:42:18] OnPrepareResponseReceived: height=757 view=0 index=3 \n\
[19:42:19] relay block: 0xde2f6789be97602719e3f6d4a2cace52ed21a7db323c5c6f0a9b3103718176b7 \n\
[19:42:19] OnPrepareResponseReceived: height=757 view=0 index=2 \n\
[19:42:19] persist block: 0xde2f6789be97602719e3f6d4a2cace52ed21a7db323c5c6f0a9b3103718176b7 \n\
[19:42:19] initialize: height=758 view=0 index=0 role=Backup \n\
[19:42:24] OnPrepareRequestReceived: height=758 view=0 index=2 tx=1 \n\
[19:42:24] send prepare response \n\
'};

// [23:46:08] OnStart \n\
function exdata2() {return ' \n\
[19:42:18] send prepare request: height=757 view=0 \n\
[19:42:18] OnPrepareResponseReceived: height=757 view=0 index=0 \n\
[19:42:18] OnPrepareResponseReceived: height=757 view=0 index=3 \n\
[19:42:19] relay block: 0xde2f6789be97602719e3f6d4a2cace52ed21a7db323c5c6f0a9b3103718176b7 \n\
[19:42:19] OnPrepareResponseReceived: height=757 view=0 index=2 \n\
[19:42:19] persist block: 0xde2f6789be97602719e3f6d4a2cace52ed21a7db323c5c6f0a9b3103718176b7 \n\
[19:42:19] initialize: height=758 view=0 index=1 role=Backup \n\
[19:42:24] OnPrepareRequestReceived: height=758 view=0 index=2 tx=1 \n\
[19:42:24] send prepare response \n\
[19:42:24] OnPrepareResponseReceived: height=758 view=0 index=3 \n\
[19:42:24] relay block: 0x28c700fb31d7c6e1ea46313b96b9093daa37fff5e3ff5c915f03ebd9af00678d \n\
[19:42:24] OnPrepareResponseReceived: height=758 view=0 index=0 \n\
[19:42:24] persist block: 0x28c700fb31d7c6e1ea46313b96b9093daa37fff5e3ff5c915f03ebd9af00678d \n\
'};

function exdata3(){return ' \n\
[19:42:19] OnPrepareResponseReceived: height=757 view=0 index=0 \n\
[19:42:19] relay block: 0xde2f6789be97602719e3f6d4a2cace52ed21a7db323c5c6f0a9b3103718176b7 \n\
[19:42:19] OnPrepareResponseReceived: height=757 view=0 index=3 \n\
[19:42:19] persist block: 0xde2f6789be97602719e3f6d4a2cace52ed21a7db323c5c6f0a9b3103718176b7 \n\
[19:42:19] initialize: height=758 view=0 index=2 role=Primary \n\
[19:42:24] timeout: height=758 view=0 state=Primary \n\
[19:42:24] send prepare request: height=758 view=0 \n\
[19:42:24] OnPrepareResponseReceived: height=758 view=0 index=0 \n\
[19:42:24] OnPrepareResponseReceived: height=758 view=0 index=3 \n\
[19:42:24] relay block: 0x28c700fb31d7c6e1ea46313b96b9093daa37fff5e3ff5c915f03ebd9af00678d \n\
[19:42:24] OnPrepareResponseReceived: height=758 view=0 index=1 \n\
[19:42:24] persist block: 0x28c700fb31d7c6e1ea46313b96b9093daa37fff5e3ff5c915f03ebd9af00678d \n\
[19:42:24] initialize: height=759 view=0 index=2 role=Backup \n\
'};

function exdata4(){ return '  \n\
[19:42:14] initialize: height=757 view=0 index=3 role=Backup \n\
[19:42:18] OnPrepareRequestReceived: height=757 view=0 index=1 tx=1 \n\
[19:42:18] send prepare response \n\
[19:42:19] OnPrepareResponseReceived: height=757 view=0 index=0 \n\
[19:42:19] relay block: 0xde2f6789be97602719e3f6d4a2cace52ed21a7db323c5c6f0a9b3103718176b7 \n\
[19:42:19] OnPrepareResponseReceived: height=757 view=0 index=2 \n\
[19:42:19] persist block: 0xde2f6789be97602719e3f6d4a2cace52ed21a7db323c5c6f0a9b3103718176b7 \n\
[19:42:19] initialize: height=758 view=0 index=3 role=Backup \n\
[19:42:24] OnPrepareRequestReceived: height=758 view=0 index=2 tx=1 \n\
[19:42:24] send prepare response \n\
[19:42:24] OnPrepareResponseReceived: height=758 view=0 index=0 \n\
[19:42:24] relay block: 0x28c700fb31d7c6e1ea46313b96b9093daa37fff5e3ff5c915f03ebd9af00678d \n\
[19:42:24] OnPrepareResponseReceived: height=758 view=0 index=1 \n\
[19:42:24] persist block: 0x28c700fb31d7c6e1ea46313b96b9093daa37fff5e3ff5c915f03ebd9af00678d \n\
[19:42:24] initialize: height=759 view=0 index=3 role=Primary \n\
'};

function test_example() {
   return parseLogsGenerateJson(exdata1(), exdata2(), exdata3(), exdata4());
}
