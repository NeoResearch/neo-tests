// MIT License - NeoResearch 2018

// ==================================== BEGIN EXAMPLE ============================================

function exdata1() { return ' \n\
[17:53:55] send perpare response \n\
[17:53:56] chain sync: expected=559 current: 557 nodes=12 \n\
[17:53:56] persist block: 0xb6fe32f0004194d77b788083f7ff0f15befd5d2a8523dde81b3703f92f55e56d \n\
[17:53:56] initialize: height=559 view=0 index=0 role=Backup \n\
[17:53:58] OnPrepareResponseReceived: height=559 view=0 index=2 \n\
[17:53:59] persist block: 0xeab1b4f74b9da38c9d99eb6a09f666abf08a6fc290eccdbc5a0c5773a2dd3f1d \n\
[17:53:59] initialize: height=560 view=0 index=0 role=Primary \n\
[17:54:04] timeout: height=560 view=0 state=Primary \n\
[17:54:04] send perpare request: height=560 view=0 \n\
[17:54:07] OnPrepareResponseReceived: height=560 view=0 index=3 \n\
[17:54:07] OnPrepareResponseReceived: height=560 view=0 index=2 \n\
[17:54:07] relay block: 0xf00672a199d601be6008cbcb19f9ded60e9017d59c1c81fa9a0558b62de0c91a \n\
[17:54:07] persist block: 0xf00672a199d601be6008cbcb19f9ded60e9017d59c1c81fa9a0558b62de0c91a \n\
[17:54:07] initialize: height=561 view=0 index=0 role=Backup \n\
[17:54:14] OnPrepareResponseReceived: height=561 view=0 index=3 \n\
[17:54:17] OnPrepareRequestReceived: height=561 view=0 index=1 tx=1 \n\
[17:54:17] send perpare response \n\
[17:54:17] timeout: height=561 view=0 state=Backup, RequestReceived, SignatureSent \n\
[17:54:17] request change view: height=561 view=0 nv=1 state=Backup, RequestReceived, SignatureSent, ViewChanging \n\
[17:54:18] OnChangeViewReceived: height=561 view=0 index=3 nv=1 \n\
[17:54:20] persist block: 0x61fcd1d36364f111033786d0d8ab067dd1990436883693486d3fdb4ae76ac8f0 \n\
[17:54:20] initialize: height=562 view=0 index=0 role=Backup \n\
[17:54:28] OnPrepareRequestReceived: height=562 view=0 index=2 tx=1 \n\
[17:54:28] send perpare response \n\
[17:54:29] OnPrepareResponseReceived: height=562 view=0 index=3 \n\
[17:54:29] relay block: 0x075bb3251d7c62142f7777547831b09db51ed97d2c7cbfa9a621bfc3cef75935 \n\
[17:54:29] persist block: 0x075bb3251d7c62142f7777547831b09db51ed97d2c7cbfa9a621bfc3cef75935 \n\
[17:54:29] initialize: height=563 view=0 index=0 role=Backup \n\
[17:54:39] OnPrepareRequestReceived: height=563 view=0 index=3 tx=1 \n\
[17:54:39] send perpare response \n\
[17:54:39] timeout: height=563 view=0 state=Backup, RequestReceived, SignatureSent \n\
[17:54:39] request change view: height=563 view=0 nv=1 state=Backup, RequestReceived, SignatureSent, ViewChanging \n\
[17:54:40] OnPrepareResponseReceived: height=563 view=0 index=1 \n\
[17:54:40] relay block: 0x1ac54af7c1846a8c6c505f305bed8f78e071537036df1a544da487b50a68e9db \n\
[17:54:40] persist block: 0x1ac54af7c1846a8c6c505f305bed8f78e071537036df1a544da487b50a68e9db \n\
[17:54:40] OnPrepareResponseReceived: height=563 view=0 index=2 \n\
[17:54:40] initialize: height=564 view=0 index=0 role=Primary \n\
[17:54:45] timeout: height=564 view=0 state=Primary \n\
[17:54:45] send perpare request: height=564 view=0 \n\
[17:54:48] OnPrepareResponseReceived: height=564 view=0 index=3 \n\
[17:54:48] OnPrepareResponseReceived: height=564 view=0 index=1 \n\
[17:54:48] relay block: 0x0f04651bbd1e3ca9fe0e68adec2197f0d6ae50d3742668245adbf091dfa88988 \n\
[17:54:48] persist block: 0x0f04651bbd1e3ca9fe0e68adec2197f0d6ae50d3742668245adbf091dfa88988 \n\
[17:54:48] initialize: height=565 view=0 index=0 role=Backup \n\
[17:54:54] OnPrepareRequestReceived: height=565 view=0 index=1 tx=1 \n\
[17:54:54] send perpare response \n\
[17:54:55] OnPrepareResponseReceived: height=565 view=0 index=3 \n\
[17:54:55] relay block: 0x5e7c007f5e1b6b310345d4d504131e9785fa1aa03366eaa95bbbcd2242f5b7a2 \n\
[17:54:55] persist block: 0x5e7c007f5e1b6b310345d4d504131e9785fa1aa03366eaa95bbbcd2242f5b7a2 \n\
[17:54:55] initialize: height=566 view=0 index=0 role=Backup \n\
'};

function exdata2() {return ' \n\
[17:53:57] OnPrepareResponseReceived: height=559 view=0 index=2 \n\
[17:53:57] relay block: 0xeab1b4f74b9da38c9d99eb6a09f666abf08a6fc290eccdbc5a0c5773a2dd3f1d \n\
[17:53:57] persist block: 0xeab1b4f74b9da38c9d99eb6a09f666abf08a6fc290eccdbc5a0c5773a2dd3f1d \n\
[17:53:57] initialize: height=560 view=0 index=1 role=Backup \n\
[17:54:06] OnPrepareRequestReceived: height=560 view=0 index=0 tx=1 \n\
[17:54:06] send perpare response \n\
[17:54:06] OnPrepareResponseReceived: height=560 view=0 index=3 \n\
[17:54:06] relay block: 0xf00672a199d601be6008cbcb19f9ded60e9017d59c1c81fa9a0558b62de0c91a \n\
[17:54:06] persist block: 0xf00672a199d601be6008cbcb19f9ded60e9017d59c1c81fa9a0558b62de0c91a \n\
[17:54:06] initialize: height=561 view=0 index=1 role=Primary \n\
[17:54:11] timeout: height=561 view=0 state=Primary \n\
[17:54:11] send perpare request: height=561 view=0 \n\
[17:54:14] OnPrepareResponseReceived: height=561 view=0 index=3 \n\
[17:54:18] OnPrepareResponseReceived: height=561 view=0 index=0 \n\
[17:54:18] relay block: 0x61fcd1d36364f111033786d0d8ab067dd1990436883693486d3fdb4ae76ac8f0 \n\
[17:54:18] persist block: 0x61fcd1d36364f111033786d0d8ab067dd1990436883693486d3fdb4ae76ac8f0 \n\
[17:54:18] initialize: height=562 view=0 index=1 role=Backup \n\
[17:54:27] OnPrepareRequestReceived: height=562 view=0 index=2 tx=1 \n\
[17:54:27] send perpare response \n\
[17:54:28] timeout: height=562 view=0 state=Backup, RequestReceived, SignatureSent \n\
[17:54:28] request change view: height=562 view=0 nv=1 state=Backup, RequestReceived, SignatureSent, ViewChanging \n\
[17:54:29] OnPrepareResponseReceived: height=562 view=0 index=3 \n\
[17:54:29] relay block: 0x075bb3251d7c62142f7777547831b09db51ed97d2c7cbfa9a621bfc3cef75935 \n\
[17:54:29] persist block: 0x075bb3251d7c62142f7777547831b09db51ed97d2c7cbfa9a621bfc3cef75935 \n\
[17:54:29] initialize: height=563 view=0 index=1 role=Backup \n\
[17:54:36] OnPrepareRequestReceived: height=563 view=0 index=3 tx=1 \n\
[17:54:36] send perpare response \n\
[17:54:37] OnPrepareResponseReceived: height=563 view=0 index=2 \n\
[17:54:37] relay block: 0x1ac54af7c1846a8c6c505f305bed8f78e071537036df1a544da487b50a68e9db \n\
[17:54:37] persist block: 0x1ac54af7c1846a8c6c505f305bed8f78e071537036df1a544da487b50a68e9db \n\
[17:54:37] initialize: height=564 view=0 index=1 role=Backup \n\
[17:54:46] OnPrepareRequestReceived: height=564 view=0 index=0 tx=1 \n\
[17:54:46] send perpare response \n\
[17:54:47] OnPrepareResponseReceived: height=564 view=0 index=3 \n\
[17:54:47] relay block: 0x0f04651bbd1e3ca9fe0e68adec2197f0d6ae50d3742668245adbf091dfa88988 \n\
[17:54:47] persist block: 0x0f04651bbd1e3ca9fe0e68adec2197f0d6ae50d3742668245adbf091dfa88988 \n\
[17:54:47] initialize: height=565 view=0 index=1 role=Primary \n\
[17:54:52] timeout: height=565 view=0 state=Primary \n\
[17:54:52] send perpare request: height=565 view=0 \n\
[17:54:55] OnPrepareResponseReceived: height=565 view=0 index=3 \n\
[17:54:55] OnPrepareResponseReceived: height=565 view=0 index=2 \n\
[17:54:55] relay block: 0x5e7c007f5e1b6b310345d4d504131e9785fa1aa03366eaa95bbbcd2242f5b7a2 \n\
[17:54:55] persist block: 0x5e7c007f5e1b6b310345d4d504131e9785fa1aa03366eaa95bbbcd2242f5b7a2 \n\
[17:54:55] initialize: height=566 view=0 index=1 role=Backup \n\
[17:55:01] OnPrepareRequestReceived: height=566 view=0 index=2 tx=1 \n\
[17:55:01] send perpare response \n\
[17:55:02] OnPrepareResponseReceived: height=566 view=0 index=3 \n\
[17:55:02] relay block: 0x9f4ff15f315f6a2cf886cd9e521dfb74b2cec8043cc00c22561b1703e953d752 \n\
[17:55:02] persist block: 0x9f4ff15f315f6a2cf886cd9e521dfb74b2cec8043cc00c22561b1703e953d752 \n\
[17:55:02] initialize: height=567 view=0 index=1 role=Backup \n\
'};

function exdata3(){return ' \n\
[17:53:52] persist block: 0xb6fe32f0004194d77b788083f7ff0f15befd5d2a8523dde81b3703f92f55e56d \n\
[17:53:52] initialize: height=559 view=0 index=2 role=Backup \n\
[17:53:56] OnPrepareRequestReceived: height=559 view=0 index=3 tx=1 \n\
[17:53:56] send perpare response \n\
[17:53:57] OnPrepareResponseReceived: height=559 view=0 index=1 \n\
[17:53:57] relay block: 0xeab1b4f74b9da38c9d99eb6a09f666abf08a6fc290eccdbc5a0c5773a2dd3f1d \n\
[17:53:57] persist block: 0xeab1b4f74b9da38c9d99eb6a09f666abf08a6fc290eccdbc5a0c5773a2dd3f1d \n\
[17:53:57] initialize: height=560 view=0 index=2 role=Backup \n\
[17:54:05] OnPrepareRequestReceived: height=560 view=0 index=0 tx=1 \n\
[17:54:05] send perpare response \n\
[17:54:06] OnPrepareResponseReceived: height=560 view=0 index=3 \n\
[17:54:06] relay block: 0xf00672a199d601be6008cbcb19f9ded60e9017d59c1c81fa9a0558b62de0c91a \n\
[17:54:06] persist block: 0xf00672a199d601be6008cbcb19f9ded60e9017d59c1c81fa9a0558b62de0c91a \n\
[17:54:06] initialize: height=561 view=0 index=2 role=Backup \n\
[17:54:17] timeout: height=561 view=0 state=Backup \n\
[17:54:17] request change view: height=561 view=0 nv=1 state=Backup, ViewChanging \n\
[17:54:21] OnPrepareRequestReceived: height=561 view=0 index=1 tx=1 \n\
[17:54:21] send perpare response \n\
[17:54:21] OnPrepareResponseReceived: height=561 view=0 index=3 \n\
[17:54:21] relay block: 0x61fcd1d36364f111033786d0d8ab067dd1990436883693486d3fdb4ae76ac8f0 \n\
[17:54:21] persist block: 0x61fcd1d36364f111033786d0d8ab067dd1990436883693486d3fdb4ae76ac8f0 \n\
[17:54:21] initialize: height=562 view=0 index=2 role=Primary \n\
[17:54:26] timeout: height=562 view=0 state=Primary \n\
[17:54:26] send perpare request: height=562 view=0 \n\
[17:54:28] OnPrepareResponseReceived: height=562 view=0 index=1 \n\
[17:54:29] OnPrepareResponseReceived: height=562 view=0 index=0 \n\
[17:54:29] relay block: 0x075bb3251d7c62142f7777547831b09db51ed97d2c7cbfa9a621bfc3cef75935 \n\
[17:54:29] persist block: 0x075bb3251d7c62142f7777547831b09db51ed97d2c7cbfa9a621bfc3cef75935 \n\
[17:54:29] initialize: height=563 view=0 index=2 role=Backup \n\
[17:54:35] OnPrepareRequestReceived: height=563 view=0 index=3 tx=1 \n\
[17:54:35] send perpare response \n\
[17:54:38] OnPrepareResponseReceived: height=563 view=0 index=1 \n\
[17:54:38] relay block: 0x1ac54af7c1846a8c6c505f305bed8f78e071537036df1a544da487b50a68e9db \n\
[17:54:38] persist block: 0x1ac54af7c1846a8c6c505f305bed8f78e071537036df1a544da487b50a68e9db \n\
[17:54:38] initialize: height=564 view=0 index=2 role=Backup \n\
[17:54:46] OnPrepareRequestReceived: height=564 view=0 index=0 tx=1 \n\
[17:54:46] send perpare response \n\
[17:54:47] OnPrepareResponseReceived: height=564 view=0 index=1 \n\
[17:54:47] relay block: 0x0f04651bbd1e3ca9fe0e68adec2197f0d6ae50d3742668245adbf091dfa88988 \n\
[17:54:47] persist block: 0x0f04651bbd1e3ca9fe0e68adec2197f0d6ae50d3742668245adbf091dfa88988 \n\
[17:54:47] OnPrepareResponseReceived: height=564 view=0 index=3 \n\
[17:54:47] initialize: height=565 view=0 index=2 role=Backup \n\
[17:54:53] OnPrepareRequestReceived: height=565 view=0 index=1 tx=1 \n\
[17:54:53] send perpare response \n\
[17:54:54] OnPrepareResponseReceived: height=565 view=0 index=3 \n\
[17:54:54] relay block: 0x5e7c007f5e1b6b310345d4d504131e9785fa1aa03366eaa95bbbcd2242f5b7a2 \n\
[17:54:54] persist block: 0x5e7c007f5e1b6b310345d4d504131e9785fa1aa03366eaa95bbbcd2242f5b7a2 \n\
[17:54:54] initialize: height=566 view=0 index=2 role=Primary \n\
[17:54:59] timeout: height=566 view=0 state=Primary \n\
[17:54:59] send perpare request: height=566 view=0 \n\
'};

function exdata4(){ return ' [17:53:57] OnPrepareResponseReceived: height=559 view=0 index=1 \n\
[17:53:57] OnPrepareResponseReceived: height=559 view=0 index=2 \n\
[17:53:57] relay block: 0xeab1b4f74b9da38c9d99eb6a09f666abf08a6fc290eccdbc5a0c5773a2dd3f1d \n\
[17:53:57] persist block: 0xeab1b4f74b9da38c9d99eb6a09f666abf08a6fc290eccdbc5a0c5773a2dd3f1d \n\
[17:53:57] initialize: height=560 view=0 index=3 role=Backup \n\
[17:54:05] OnPrepareRequestReceived: height=560 view=0 index=0 tx=1 \n\
[17:54:05] send perpare response \n\
[17:54:06] OnPrepareResponseReceived: height=560 view=0 index=2 \n\
[17:54:06] relay block: 0xf00672a199d601be6008cbcb19f9ded60e9017d59c1c81fa9a0558b62de0c91a \n\
[17:54:06] persist block: 0xf00672a199d601be6008cbcb19f9ded60e9017d59c1c81fa9a0558b62de0c91a \n\
[17:54:06] initialize: height=561 view=0 index=3 role=Backup \n\
[17:54:12] OnPrepareRequestReceived: height=561 view=0 index=1 tx=1 \n\
[17:54:12] send perpare response \n\
[17:54:16] timeout: height=561 view=0 state=Backup, RequestReceived, SignatureSent \n\
[17:54:16] request change view: height=561 view=0 nv=1 state=Backup, RequestReceived, SignatureSent, ViewChanging \n\
[17:54:18] OnPrepareResponseReceived: height=561 view=0 index=0 \n\
[17:54:18] relay block: 0x61fcd1d36364f111033786d0d8ab067dd1990436883693486d3fdb4ae76ac8f0 \n\
[17:54:18] persist block: 0x61fcd1d36364f111033786d0d8ab067dd1990436883693486d3fdb4ae76ac8f0 \n\
[17:54:18] initialize: height=562 view=0 index=3 role=Backup \n\
[17:54:27] OnPrepareRequestReceived: height=562 view=0 index=2 tx=1 \n\
[17:54:27] send perpare response \n\
[17:54:28] timeout: height=562 view=0 state=Backup, RequestReceived, SignatureSent \n\
[17:54:28] request change view: height=562 view=0 nv=1 state=Backup, RequestReceived, SignatureSent, ViewChanging \n\
[17:54:29] OnPrepareResponseReceived: height=562 view=0 index=1 \n\
[17:54:29] relay block: 0x075bb3251d7c62142f7777547831b09db51ed97d2c7cbfa9a621bfc3cef75935 \n\
[17:54:29] persist block: 0x075bb3251d7c62142f7777547831b09db51ed97d2c7cbfa9a621bfc3cef75935 \n\
[17:54:29] initialize: height=563 view=0 index=3 role=Primary \n\
[17:54:34] timeout: height=563 view=0 state=Primary \n\
[17:54:34] send perpare request: height=563 view=0 \n\
[17:54:36] OnPrepareResponseReceived: height=563 view=0 index=2 \n\
[17:54:37] OnPrepareResponseReceived: height=563 view=0 index=1 \n\
[17:54:37] relay block: 0x1ac54af7c1846a8c6c505f305bed8f78e071537036df1a544da487b50a68e9db \n\
[17:54:37] persist block: 0x1ac54af7c1846a8c6c505f305bed8f78e071537036df1a544da487b50a68e9db \n\
[17:54:37] initialize: height=564 view=0 index=3 role=Backup \n\
[17:54:46] OnPrepareRequestReceived: height=564 view=0 index=0 tx=1 \n\
[17:54:46] send perpare response \n\
[17:54:47] timeout: height=564 view=0 state=Backup, RequestReceived, SignatureSent \n\
[17:54:47] request change view: height=564 view=0 nv=1 state=Backup, RequestReceived, SignatureSent, ViewChanging \n\
[17:54:47] OnPrepareResponseReceived: height=564 view=0 index=1 \n\
[17:54:47] relay block: 0x0f04651bbd1e3ca9fe0e68adec2197f0d6ae50d3742668245adbf091dfa88988 \n\
[17:54:47] persist block: 0x0f04651bbd1e3ca9fe0e68adec2197f0d6ae50d3742668245adbf091dfa88988 \n\
[17:54:47] initialize: height=565 view=0 index=3 role=Backup \n\
[17:54:53] OnPrepareRequestReceived: height=565 view=0 index=1 tx=1 \n\
[17:54:53] send perpare response \n\
[17:54:54] OnPrepareResponseReceived: height=565 view=0 index=2 \n\
[17:54:54] relay block: 0x5e7c007f5e1b6b310345d4d504131e9785fa1aa03366eaa95bbbcd2242f5b7a2 \n\
[17:54:54] persist block: 0x5e7c007f5e1b6b310345d4d504131e9785fa1aa03366eaa95bbbcd2242f5b7a2 \n\
[17:54:54] initialize: height=566 view=0 index=3 role=Backup \n\
[17:55:00] OnPrepareRequestReceived: height=566 view=0 index=2 tx=1 \n\
[17:55:00] send perpare response \n\
'};

function test_example() {
   return parseLogsGenerateJson(exdata1(), exdata2(), exdata3(), exdata4());
}
