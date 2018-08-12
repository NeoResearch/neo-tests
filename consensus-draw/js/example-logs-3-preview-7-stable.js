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
[19:42:24] OnPrepareResponseReceived: height=758 view=0 index=3 \n\
[19:42:24] relay block: 0x28c700fb31d7c6e1ea46313b96b9093daa37fff5e3ff5c915f03ebd9af00678d \n\
[19:42:24] OnPrepareResponseReceived: height=758 view=0 index=1 \n\
[19:42:24] persist block: 0x28c700fb31d7c6e1ea46313b96b9093daa37fff5e3ff5c915f03ebd9af00678d \n\
[19:42:24] initialize: height=759 view=0 index=0 role=Backup \n\
[19:42:29] OnPrepareRequestReceived: height=759 view=0 index=3 tx=1 \n\
[19:42:29] send prepare response \n\
[19:42:29] OnPrepareResponseReceived: height=759 view=0 index=2 \n\
[19:42:29] relay block: 0xc8a3c2aa0d3543748b4871b591d9eb0f901f49f1ab1a0d2f84b11e3e51ef9ba9 \n\
[19:42:29] persist block: 0xc8a3c2aa0d3543748b4871b591d9eb0f901f49f1ab1a0d2f84b11e3e51ef9ba9 \n\
[19:42:29] initialize: height=760 view=0 index=0 role=Primary \n\
[19:42:34] timeout: height=760 view=0 state=Primary \n\
[19:42:34] send prepare request: height=760 view=0 \n\
[19:42:34] OnPrepareResponseReceived: height=760 view=0 index=1 \n\
[19:42:34] OnPrepareResponseReceived: height=760 view=0 index=2 \n\
[19:42:34] relay block: 0xc6c7d8ddf604a68e9fafc21ff0844083b91075acf2642d95d702e0616f8e2810 \n\
[19:42:34] OnPrepareResponseReceived: height=760 view=0 index=3 \n\
[19:42:34] persist block: 0xc6c7d8ddf604a68e9fafc21ff0844083b91075acf2642d95d702e0616f8e2810 \n\
[19:42:34] initialize: height=761 view=0 index=0 role=Backup \n\
[19:42:39] OnPrepareRequestReceived: height=761 view=0 index=1 tx=1 \n\
[19:42:39] send prepare response \n\
[19:42:39] OnPrepareResponseReceived: height=761 view=0 index=3 \n\
[19:42:39] relay block: 0x825b2debc56c25bfd29a8bd9bd9a0af0d4491e4f6e5a6b7865e343371ee43b3e \n\
[19:42:39] OnPrepareResponseReceived: height=761 view=0 index=2 \n\
[19:42:39] persist block: 0x825b2debc56c25bfd29a8bd9bd9a0af0d4491e4f6e5a6b7865e343371ee43b3e \n\
[19:42:39] initialize: height=762 view=0 index=0 role=Backup \n\
[19:42:44] OnPrepareRequestReceived: height=762 view=0 index=2 tx=1 \n\
[19:42:44] send prepare response \n\
[19:42:44] OnPrepareResponseReceived: height=762 view=0 index=3 \n\
[19:42:44] relay block: 0xdf95d25e336d5e0306578484beeffe065e20ed68f478e2b398646e30c408ef8f \n\
[19:42:44] OnPrepareResponseReceived: height=762 view=0 index=1 \n\
[19:42:44] persist block: 0xdf95d25e336d5e0306578484beeffe065e20ed68f478e2b398646e30c408ef8f \n\
[19:42:44] initialize: height=763 view=0 index=0 role=Backup \n\
[19:42:49] OnPrepareRequestReceived: height=763 view=0 index=3 tx=1 \n\
[19:42:49] send prepare response \n\
[19:42:49] OnPrepareResponseReceived: height=763 view=0 index=1 \n\
[19:42:49] relay block: 0x3a6dacc56b1fc4ddca4c534d54625812a090e5858c37c6f6669e66e63a120118 \n\
[19:42:49] OnPrepareResponseReceived: height=763 view=0 index=2 \n\
'};

// [23:46:08] OnStart \n\
function exdata2() {return ' \n\
[19:42:18] timeout: height=757 view=0 state=Primary \n\
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
[19:42:24] initialize: height=759 view=0 index=1 role=Backup \n\
[19:42:29] OnPrepareRequestReceived: height=759 view=0 index=3 tx=1 \n\
[19:42:29] send prepare response \n\
[19:42:29] OnPrepareResponseReceived: height=759 view=0 index=0 \n\
[19:42:29] relay block: 0xc8a3c2aa0d3543748b4871b591d9eb0f901f49f1ab1a0d2f84b11e3e51ef9ba9 \n\
[19:42:29] OnPrepareResponseReceived: height=759 view=0 index=2 \n\
[19:42:29] persist block: 0xc8a3c2aa0d3543748b4871b591d9eb0f901f49f1ab1a0d2f84b11e3e51ef9ba9 \n\
[19:42:29] initialize: height=760 view=0 index=1 role=Backup \n\
[19:42:34] OnPrepareRequestReceived: height=760 view=0 index=0 tx=1 \n\
[19:42:34] send prepare response \n\
[19:42:34] OnPrepareResponseReceived: height=760 view=0 index=3 \n\
[19:42:34] relay block: 0xc6c7d8ddf604a68e9fafc21ff0844083b91075acf2642d95d702e0616f8e2810 \n\
[19:42:34] OnPrepareResponseReceived: height=760 view=0 index=2 \n\
[19:42:34] persist block: 0xc6c7d8ddf604a68e9fafc21ff0844083b91075acf2642d95d702e0616f8e2810 \n\
[19:42:34] initialize: height=761 view=0 index=1 role=Primary \n\
[19:42:39] timeout: height=761 view=0 state=Primary \n\
[19:42:39] send prepare request: height=761 view=0 \n\
[19:42:39] OnPrepareResponseReceived: height=761 view=0 index=3 \n\
[19:42:39] OnPrepareResponseReceived: height=761 view=0 index=2 \n\
[19:42:39] relay block: 0x825b2debc56c25bfd29a8bd9bd9a0af0d4491e4f6e5a6b7865e343371ee43b3e \n\
[19:42:39] OnPrepareResponseReceived: height=761 view=0 index=0 \n\
[19:42:39] persist block: 0x825b2debc56c25bfd29a8bd9bd9a0af0d4491e4f6e5a6b7865e343371ee43b3e \n\
[19:42:39] initialize: height=762 view=0 index=1 role=Backup \n\
[19:42:44] OnPrepareRequestReceived: height=762 view=0 index=2 tx=1 \n\
[19:42:44] send prepare response \n\
[19:42:44] OnPrepareResponseReceived: height=762 view=0 index=3 \n\
[19:42:44] relay block: 0xdf95d25e336d5e0306578484beeffe065e20ed68f478e2b398646e30c408ef8f \n\
[19:42:44] OnPrepareRequestReceived: height=762 view=0 index=2 tx=1 \n\
[19:42:44] OnPrepareResponseReceived: height=762 view=0 index=0 \n\
[19:42:44] persist block: 0xdf95d25e336d5e0306578484beeffe065e20ed68f478e2b398646e30c408ef8f \n\
[19:42:44] initialize: height=763 view=0 index=1 role=Backup \n\
[19:42:49] OnPrepareRequestReceived: height=763 view=0 index=3 tx=1 \n\
[19:42:49] send prepare response \n\
[19:42:49] OnPrepareResponseReceived: height=763 view=0 index=0 \n\
[19:42:49] relay block: 0x3a6dacc56b1fc4ddca4c534d54625812a090e5858c37c6f6669e66e63a120118 \n\
[19:42:49] OnPrepareResponseReceived: height=763 view=0 index=2 \n\
[19:42:49] persist block: 0x3a6dacc56b1fc4ddca4c534d54625812a090e5858c37c6f6669e66e63a120118 \n\
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
[19:42:29] OnPrepareRequestReceived: height=759 view=0 index=3 tx=1 \n\
[19:42:29] send prepare response \n\
[19:42:29] OnPrepareResponseReceived: height=759 view=0 index=0 \n\
[19:42:29] relay block: 0xc8a3c2aa0d3543748b4871b591d9eb0f901f49f1ab1a0d2f84b11e3e51ef9ba9 \n\
[19:42:29] OnPrepareResponseReceived: height=759 view=0 index=1 \n\
[19:42:29] persist block: 0xc8a3c2aa0d3543748b4871b591d9eb0f901f49f1ab1a0d2f84b11e3e51ef9ba9 \n\
[19:42:29] initialize: height=760 view=0 index=2 role=Backup \n\
[19:42:34] OnPrepareRequestReceived: height=760 view=0 index=0 tx=1 \n\
[19:42:34] send prepare response \n\
[19:42:34] OnPrepareResponseReceived: height=760 view=0 index=3 \n\
[19:42:34] relay block: 0xc6c7d8ddf604a68e9fafc21ff0844083b91075acf2642d95d702e0616f8e2810 \n\
[19:42:34] OnPrepareResponseReceived: height=760 view=0 index=1 \n\
[19:42:34] persist block: 0xc6c7d8ddf604a68e9fafc21ff0844083b91075acf2642d95d702e0616f8e2810 \n\
[19:42:34] initialize: height=761 view=0 index=2 role=Backup \n\
[19:42:39] OnPrepareRequestReceived: height=761 view=0 index=1 tx=1 \n\
[19:42:39] send prepare response \n\
[19:42:39] OnPrepareResponseReceived: height=761 view=0 index=3 \n\
[19:42:39] relay block: 0x825b2debc56c25bfd29a8bd9bd9a0af0d4491e4f6e5a6b7865e343371ee43b3e \n\
[19:42:39] OnPrepareResponseReceived: height=761 view=0 index=0 \n\
[19:42:39] persist block: 0x825b2debc56c25bfd29a8bd9bd9a0af0d4491e4f6e5a6b7865e343371ee43b3e \n\
[19:42:39] initialize: height=762 view=0 index=2 role=Primary \n\
[19:42:44] timeout: height=762 view=0 state=Primary \n\
[19:42:44] send prepare request: height=762 view=0 \n\
[19:42:44] OnPrepareResponseReceived: height=762 view=0 index=3 \n\
[19:42:44] OnPrepareResponseReceived: height=762 view=0 index=0 \n\
[19:42:44] relay block: 0xdf95d25e336d5e0306578484beeffe065e20ed68f478e2b398646e30c408ef8f \n\
[19:42:44] OnPrepareResponseReceived: height=762 view=0 index=1 \n\
[19:42:44] persist block: 0xdf95d25e336d5e0306578484beeffe065e20ed68f478e2b398646e30c408ef8f \n\
[19:42:44] initialize: height=763 view=0 index=2 role=Backup \n\
[19:42:49] OnPrepareRequestReceived: height=763 view=0 index=3 tx=1 \n\
[19:42:49] send prepare response \n\
[19:42:49] OnPrepareResponseReceived: height=763 view=0 index=1 \n\
[19:42:49] relay block: 0x3a6dacc56b1fc4ddca4c534d54625812a090e5858c37c6f6669e66e63a120118 \n\
[19:42:49] OnPrepareResponseReceived: height=763 view=0 index=0 \n\
[19:42:49] persist block: 0x3a6dacc56b1fc4ddca4c534d54625812a090e5858c37c6f6669e66e63a120118 \n\
[19:42:49] initialize: height=764 view=0 index=2 role=Backup \n\
[19:42:54] OnPrepareRequestReceived: height=764 view=0 index=0 tx=1 \n\
[19:42:54] send prepare response \n\
'};

function exdata4(){ return '  \n\
[19:42:13] persist block: 0xde51aa19c0dcbcf8b83bfd7ea57d58a6725dba6c7760468a3b5b498f6eec02ff \n\
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
[19:42:29] timeout: height=759 view=0 state=Primary \n\
[19:42:29] send prepare request: height=759 view=0 \n\
[19:42:29] OnPrepareResponseReceived: height=759 view=0 index=0 \n\
[19:42:29] OnPrepareResponseReceived: height=759 view=0 index=2 \n\
[19:42:29] relay block: 0xc8a3c2aa0d3543748b4871b591d9eb0f901f49f1ab1a0d2f84b11e3e51ef9ba9 \n\
[19:42:29] OnPrepareResponseReceived: height=759 view=0 index=1 \n\
[19:42:29] persist block: 0xc8a3c2aa0d3543748b4871b591d9eb0f901f49f1ab1a0d2f84b11e3e51ef9ba9 \n\
[19:42:29] initialize: height=760 view=0 index=3 role=Backup \n\
[19:42:34] OnPrepareRequestReceived: height=760 view=0 index=0 tx=1 \n\
[19:42:34] send prepare response \n\
[19:42:34] OnPrepareResponseReceived: height=760 view=0 index=1 \n\
[19:42:34] relay block: 0xc6c7d8ddf604a68e9fafc21ff0844083b91075acf2642d95d702e0616f8e2810 \n\
[19:42:34] OnPrepareResponseReceived: height=760 view=0 index=2 \n\
[19:42:34] persist block: 0xc6c7d8ddf604a68e9fafc21ff0844083b91075acf2642d95d702e0616f8e2810 \n\
[19:42:34] initialize: height=761 view=0 index=3 role=Backup \n\
[19:42:39] OnPrepareRequestReceived: height=761 view=0 index=1 tx=1 \n\
[19:42:39] send prepare response \n\
[19:42:39] OnPrepareResponseReceived: height=761 view=0 index=2 \n\
[19:42:39] relay block: 0x825b2debc56c25bfd29a8bd9bd9a0af0d4491e4f6e5a6b7865e343371ee43b3e \n\
[19:42:39] OnPrepareResponseReceived: height=761 view=0 index=0 \n\
[19:42:39] persist block: 0x825b2debc56c25bfd29a8bd9bd9a0af0d4491e4f6e5a6b7865e343371ee43b3e \n\
[19:42:39] initialize: height=762 view=0 index=3 role=Backup \n\
[19:42:44] OnPrepareRequestReceived: height=762 view=0 index=2 tx=1 \n\
[19:42:44] send prepare response \n\
[19:42:44] OnPrepareResponseReceived: height=762 view=0 index=0 \n\
'};

function test_example() {
   return parseLogsGenerateJson(exdata1(), exdata2(), exdata3(), exdata4());
}
