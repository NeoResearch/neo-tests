// MIT License - NeoResearch 2018

// ==================================== BEGIN EXAMPLE ============================================

function exdata1() { return ' \n\
[23:46:16] timeout: height=1 view=0 state=Backup, RequestReceived, SignatureSent \n\
[23:46:16] request change view: height=1 view=0 nv=1 state=Backup, RequestReceived, SignatureSent, ViewChanging \n\
[23:46:17] OnPrepareResponseReceived: height=1 view=0 index=2 \n\
[23:46:17] Commit sent: height=1 state=Backup, RequestReceived, SignatureSent, ViewChanging, CommitSent \n\
[23:46:17] OnPrepareResponseReceived: height=1 view=0 index=2 \n\
[23:46:17] OnPrepareResponseReceived: height=1 view=0 index=3 \n\
[23:46:17] OnCommitAgreement: height=1 view=0 index=2 \n\
[23:46:18] OnCommitAgreement: height=1 view=0 index=3 \n\
[23:46:18] relay block: 0x746359646bd358b2d7b9c62d07b6df1b08f97d3edcacf31f01d364247a024916 \n\
[23:46:19] OnChangeViewReceived: height=1 view=0 index=2 nv=1 \n\
[23:46:19] persist block: 0x746359646bd358b2d7b9c62d07b6df1b08f97d3edcacf31f01d364247a024916 \n\
[23:46:19] initialize: height=2 view=0 index=0 role=Backup \n\
[23:46:25] OnPrepareRequestReceived: height=2 view=0 index=2 tx=1 \n\
[23:46:25] send perpare response \n\
[23:46:25] OnPrepareRequestReceived: height=2 view=0 index=2 tx=1 \n\
[23:46:28] OnPrepareResponseReceived: height=2 view=0 index=3 \n\
[23:46:28] Commit sent: height=2 state=Backup, RequestReceived, SignatureSent, CommitSent \n\
[23:46:29] timeout: height=2 view=0 state=Backup, RequestReceived, SignatureSent, CommitSent \n\
[23:46:29] request change view: height=2 view=0 nv=1 state=Backup, RequestReceived, SignatureSent, ViewChanging, CommitSent \n\
[23:46:29] OnPrepareResponseReceived: height=2 view=0 index=1 \n\
[23:46:29] OnChangeViewReceived: height=2 view=0 index=1 nv=1 \n\
[23:46:29] OnChangeViewReceived: height=2 view=0 index=3 nv=1 \n\
[23:46:29] initialize: height=2 view=1 index=0 role=Backup \n\
[23:46:31] persist block: 0x3e956336bd01428af1a6f70de4d6d153669e491315c1e1ea44c90de8269294e7 \n\
[23:46:31] initialize: height=3 view=0 index=0 role=Backup \n\
[23:46:36] OnPrepareRequestReceived: height=3 view=0 index=3 tx=1 \n\
[23:46:36] send perpare response \n\
[23:46:37] OnPrepareResponseReceived: height=3 view=0 index=2 \n\
[23:46:37] Commit sent: height=3 state=Backup, RequestReceived, SignatureSent, CommitSent \n\
[23:46:37] OnPrepareResponseReceived: height=3 view=0 index=2 \n\
[23:46:38] OnPrepareResponseReceived: height=3 view=0 index=1 \n\
[23:46:39] OnCommitAgreement: height=3 view=0 index=1 \n\
[23:46:39] OnCommitAgreement: height=3 view=0 index=3 \n\
[23:46:39] relay block: 0xb79f0f09285382cee374ba948a42296b16396e2abc7dc09ef138846655a95b61 \n\
[23:46:39] persist block: 0xb79f0f09285382cee374ba948a42296b16396e2abc7dc09ef138846655a95b61 \n\
[23:46:39] initialize: height=4 view=0 index=0 role=Primary \n\
[23:46:44] timeout: height=4 view=0 state=Primary \n\
[23:46:44] send perpare request: height=4 view=0 \n\
[23:46:47] OnPrepareResponseReceived: height=4 view=0 index=1 \n\
[23:46:47] OnPrepareResponseReceived: height=4 view=0 index=3 \n\
[23:46:47] Commit sent: height=4 state=Primary, RequestSent, CommitSent \n\
[23:46:47] OnPrepareResponseReceived: height=4 view=0 index=2 \n\
[23:46:47] OnPrepareResponseReceived: height=4 view=0 index=2 \n\
[23:46:48] OnCommitAgreement: height=4 view=0 index=1 \n\
[23:46:48] OnCommitAgreement: height=4 view=0 index=3 \n\
[23:46:48] relay block: 0x66ff431947531361c7e0bc9696ede7054b14ca8b63cf78ca24147cff5305736d \n\
[23:46:48] persist block: 0x66ff431947531361c7e0bc9696ede7054b14ca8b63cf78ca24147cff5305736d \n\
[23:46:48] initialize: height=5 view=0 index=0 role=Backup \n\
[23:46:55] OnPrepareRequestReceived: height=5 view=0 index=1 tx=1 \n\
[23:46:55] send perpare response \n\
'};

// [23:46:08] OnStart \n\
function exdata2() {return ' \n\
[23:46:08] initialize: height=1 view=0 index=1 role=Primary \n\
[23:46:08] timeout: height=1 view=0 state=Primary \n\
[23:46:08] send perpare request: height=1 view=0 \n\
[23:46:14] OnPrepareResponseReceived: height=1 view=0 index=3 \n\
[23:46:15] OnPrepareResponseReceived: height=1 view=0 index=2 \n\
[23:46:15] Commit sent: height=1 state=Primary, RequestSent, CommitSent \n\
[23:46:16] OnCommitAgreement: height=1 view=0 index=3 \n\
[23:46:16] OnPrepareResponseReceived: height=1 view=0 index=2 \n\
[23:46:16] OnCommitAgreement: height=1 view=0 index=2 \n\
[23:46:17] relay block: 0x746359646bd358b2d7b9c62d07b6df1b08f97d3edcacf31f01d364247a024916 \n\
[23:46:17] persist block: 0x746359646bd358b2d7b9c62d07b6df1b08f97d3edcacf31f01d364247a024916 \n\
[23:46:17] initialize: height=2 view=0 index=1 role=Backup \n\
[23:46:25] OnPrepareRequestReceived: height=2 view=0 index=2 tx=1 \n\
[23:46:25] send perpare response \n\
[23:46:25] OnPrepareRequestReceived: height=2 view=0 index=2 tx=1 \n\
[23:46:27] timeout: height=2 view=0 state=Backup, RequestReceived, SignatureSent \n\
[23:46:27] request change view: height=2 view=0 nv=1 state=Backup, RequestReceived, SignatureSent, ViewChanging \n\
[23:46:29] OnPrepareResponseReceived: height=2 view=0 index=0 \n\
[23:46:29] Commit sent: height=2 state=Backup, RequestReceived, SignatureSent, ViewChanging, CommitSent \n\
[23:46:30] OnChangeViewReceived: height=2 view=0 index=3 nv=1 \n\
[23:46:30] OnCommitAgreement: height=2 view=0 index=3 \n\
[23:46:30] OnCommitAgreement: height=2 view=0 index=0 \n\
[23:46:30] relay block: 0x3e956336bd01428af1a6f70de4d6d153669e491315c1e1ea44c90de8269294e7 \n\
[23:46:30] persist block: 0x3e956336bd01428af1a6f70de4d6d153669e491315c1e1ea44c90de8269294e7 \n\
[23:46:30] initialize: height=3 view=0 index=1 role=Backup \n\
[23:46:37] OnPrepareRequestReceived: height=3 view=0 index=3 tx=1 \n\
[23:46:37] send perpare response \n\
[23:46:38] OnPrepareResponseReceived: height=3 view=0 index=2 \n\
[23:46:38] Commit sent: height=3 state=Backup, RequestReceived, SignatureSent, CommitSent \n\
[23:46:38] OnPrepareResponseReceived: height=3 view=0 index=2 \n\
[23:46:38] OnPrepareResponseReceived: height=3 view=0 index=0 \n\
[23:46:39] OnCommitAgreement: height=3 view=0 index=2 \n\
[23:46:39] OnCommitAgreement: height=3 view=0 index=0 \n\
[23:46:39] relay block: 0xb79f0f09285382cee374ba948a42296b16396e2abc7dc09ef138846655a95b61 \n\
[23:46:39] persist block: 0xb79f0f09285382cee374ba948a42296b16396e2abc7dc09ef138846655a95b61 \n\
[23:46:39] initialize: height=4 view=0 index=1 role=Backup \n\
[23:46:46] OnPrepareRequestReceived: height=4 view=0 index=0 tx=2 \n\
[23:46:46] send perpare response \n\
[23:46:47] OnPrepareResponseReceived: height=4 view=0 index=2 \n\
[23:46:47] Commit sent: height=4 state=Backup, RequestReceived, SignatureSent, CommitSent \n\
[23:46:47] OnPrepareResponseReceived: height=4 view=0 index=2 \n\
[23:46:47] OnPrepareResponseReceived: height=4 view=0 index=3 \n\
[23:46:49] OnCommitAgreement: height=4 view=0 index=2 \n\
[23:46:49] OnCommitAgreement: height=4 view=0 index=3 \n\
[23:46:49] relay block: 0x66ff431947531361c7e0bc9696ede7054b14ca8b63cf78ca24147cff5305736d \n\
[23:46:49] persist block: 0x66ff431947531361c7e0bc9696ede7054b14ca8b63cf78ca24147cff5305736d \n\
[23:46:49] initialize: height=5 view=0 index=1 role=Primary \n\
[23:46:54] timeout: height=5 view=0 state=Primary \n\
[23:46:54] send perpare request: height=5 view=0 \n\
'};

function exdata3(){return ' \n\
[23:46:29] persist block: 0x3e956336bd01428af1a6f70de4d6d153669e491315c1e1ea44c90de8269294e7 \n\
[23:46:29] initialize: height=3 view=0 index=2 role=Backup \n\
[23:46:29] persist block: 0x3e956336bd01428af1a6f70de4d6d153669e491315c1e1ea44c90de8269294e7 \n\
[23:46:29] initialize: height=3 view=0 index=2 role=Backup \n\
[23:46:36] OnPrepareRequestReceived: height=3 view=0 index=3 tx=1 \n\
[23:46:36] send perpare response \n\
[23:46:36] OnPrepareRequestReceived: height=3 view=0 index=3 tx=1 \n\
[23:46:36] send perpare response \n\
[23:46:37] OnPrepareResponseReceived: height=3 view=0 index=0 \n\
[23:46:37] Commit sent: height=3 state=Backup, RequestReceived, SignatureSent, CommitSent \n\
[23:46:37] OnPrepareResponseReceived: height=3 view=0 index=0 \n\
[23:46:37] Commit sent: height=3 state=Backup, RequestReceived, SignatureSent, CommitSent \n\
[23:46:38] OnPrepareResponseReceived: height=3 view=0 index=1 \n\
[23:46:38] OnPrepareResponseReceived: height=3 view=0 index=1 \n\
[23:46:38] OnCommitAgreement: height=3 view=0 index=0 \n\
[23:46:38] OnCommitAgreement: height=3 view=0 index=0 \n\
[23:46:39] OnCommitAgreement: height=3 view=0 index=1 \n\
[23:46:39] relay block: 0xb79f0f09285382cee374ba948a42296b16396e2abc7dc09ef138846655a95b61 \n\
[23:46:39] OnCommitAgreement: height=3 view=0 index=1 \n\
[23:46:39] relay block: 0xb79f0f09285382cee374ba948a42296b16396e2abc7dc09ef138846655a95b61 \n\
[23:46:39] reject block: 0xb79f0f09285382cee374ba948a42296b16396e2abc7dc09ef138846655a95b61 \n\
[23:46:39] persist block: 0xb79f0f09285382cee374ba948a42296b16396e2abc7dc09ef138846655a95b61 \n\
[23:46:39] initialize: height=4 view=0 index=2 role=Backup \n\
[23:46:39] persist block: 0xb79f0f09285382cee374ba948a42296b16396e2abc7dc09ef138846655a95b61 \n\
[23:46:39] initialize: height=4 view=0 index=2 role=Backup \n\
[23:46:45] OnPrepareRequestReceived: height=4 view=0 index=0 tx=2 \n\
[23:46:45] send perpare response \n\
[23:46:45] OnPrepareRequestReceived: height=4 view=0 index=0 tx=2 \n\
[23:46:45] send perpare response \n\
[23:46:47] OnPrepareResponseReceived: height=4 view=0 index=1 \n\
[23:46:47] Commit sent: height=4 state=Backup, RequestReceived, SignatureSent, CommitSent \n\
[23:46:47] OnPrepareResponseReceived: height=4 view=0 index=1 \n\
[23:46:47] Commit sent: height=4 state=Backup, RequestReceived, SignatureSent, CommitSent \n\
[23:46:47] OnPrepareResponseReceived: height=4 view=0 index=3 \n\
[23:46:47] OnPrepareResponseReceived: height=4 view=0 index=3 \n\
[23:46:48] OnCommitAgreement: height=4 view=0 index=1 \n\
[23:46:48] OnCommitAgreement: height=4 view=0 index=1 \n\
[23:46:48] OnCommitAgreement: height=4 view=0 index=3 \n\
[23:46:48] relay block: 0x66ff431947531361c7e0bc9696ede7054b14ca8b63cf78ca24147cff5305736d \n\
[23:46:48] OnCommitAgreement: height=4 view=0 index=3 \n\
[23:46:48] relay block: 0x66ff431947531361c7e0bc9696ede7054b14ca8b63cf78ca24147cff5305736d \n\
[23:46:48] reject block: 0x66ff431947531361c7e0bc9696ede7054b14ca8b63cf78ca24147cff5305736d \n\
[23:46:48] persist block: 0x66ff431947531361c7e0bc9696ede7054b14ca8b63cf78ca24147cff5305736d \n\
[23:46:48] initialize: height=5 view=0 index=2 role=Backup \n\
[23:46:48] persist block: 0x66ff431947531361c7e0bc9696ede7054b14ca8b63cf78ca24147cff5305736d \n\
[23:46:48] initialize: height=5 view=0 index=2 role=Backup \n\
[23:46:55] OnPrepareRequestReceived: height=5 view=0 index=1 tx=1 \n\
[23:46:55] send perpare response \n\
[23:46:55] OnPrepareRequestReceived: height=5 view=0 index=1 tx=1 \n\
[23:46:55] send perpare response \n\
'};

function exdata4(){ return ' [23:46:14] Commit sent: height=1 state=Backup, RequestReceived, SignatureSent, CommitSent \n\
[23:46:14] OnPrepareResponseReceived: height=1 view=0 index=2 \n\
[23:46:15] OnCommitAgreement: height=1 view=0 index=2 \n\
[23:46:17] OnChangeViewReceived: height=1 view=0 index=2 nv=1 \n\
[23:46:17] OnCommitAgreement: height=1 view=0 index=1 \n\
[23:46:18] relay block: 0x746359646bd358b2d7b9c62d07b6df1b08f97d3edcacf31f01d364247a024916 \n\
[23:46:18] persist block: 0x746359646bd358b2d7b9c62d07b6df1b08f97d3edcacf31f01d364247a024916 \n\
[23:46:18] initialize: height=2 view=0 index=3 role=Backup \n\
[23:46:27] OnPrepareRequestReceived: height=2 view=0 index=2 tx=1 \n\
[23:46:27] send perpare response \n\
[23:46:27] OnPrepareRequestReceived: height=2 view=0 index=2 tx=1 \n\
[23:46:28] timeout: height=2 view=0 state=Backup, RequestReceived, SignatureSent \n\
[23:46:28] request change view: height=2 view=0 nv=1 state=Backup, RequestReceived, SignatureSent, ViewChanging \n\
[23:46:28] OnPrepareResponseReceived: height=2 view=0 index=0 \n\
[23:46:28] Commit sent: height=2 state=Backup, RequestReceived, SignatureSent, ViewChanging, CommitSent \n\
[23:46:29] OnCommitAgreement: height=2 view=0 index=0 \n\
[23:46:29] OnPrepareResponseReceived: height=2 view=0 index=1 \n\
[23:46:29] OnChangeViewReceived: height=2 view=0 index=1 nv=1 \n\
[23:46:30] OnCommitAgreement: height=2 view=0 index=2 \n\
[23:46:30] relay block: 0x3e956336bd01428af1a6f70de4d6d153669e491315c1e1ea44c90de8269294e7 \n\
[23:46:30] persist block: 0x3e956336bd01428af1a6f70de4d6d153669e491315c1e1ea44c90de8269294e7 \n\
[23:46:30] initialize: height=3 view=0 index=3 role=Primary \n\
[23:46:35] timeout: height=3 view=0 state=Primary \n\
[23:46:35] send perpare request: height=3 view=0 \n\
[23:46:37] OnPrepareResponseReceived: height=3 view=0 index=0 \n\
[23:46:38] OnPrepareResponseReceived: height=3 view=0 index=2 \n\
[23:46:38] Commit sent: height=3 state=Primary, RequestSent, CommitSent \n\
[23:46:38] OnPrepareResponseReceived: height=3 view=0 index=2 \n\
[23:46:38] OnPrepareResponseReceived: height=3 view=0 index=1 \n\
[23:46:39] OnCommitAgreement: height=3 view=0 index=2 \n\
[23:46:39] OnCommitAgreement: height=3 view=0 index=0 \n\
[23:46:39] relay block: 0xb79f0f09285382cee374ba948a42296b16396e2abc7dc09ef138846655a95b61 \n\
[23:46:39] persist block: 0xb79f0f09285382cee374ba948a42296b16396e2abc7dc09ef138846655a95b61 \n\
[23:46:39] initialize: height=4 view=0 index=3 role=Backup \n\
[23:46:45] OnPrepareRequestReceived: height=4 view=0 index=0 tx=2 \n\
[23:46:45] send perpare response \n\
[23:46:47] OnPrepareResponseReceived: height=4 view=0 index=2 \n\
[23:46:47] Commit sent: height=4 state=Backup, RequestReceived, SignatureSent, CommitSent \n\
[23:46:47] OnPrepareResponseReceived: height=4 view=0 index=2 \n\
[23:46:47] OnPrepareResponseReceived: height=4 view=0 index=1 \n\
[23:46:48] OnCommitAgreement: height=4 view=0 index=2 \n\
[23:46:48] OnCommitAgreement: height=4 view=0 index=0 \n\
[23:46:48] relay block: 0x66ff431947531361c7e0bc9696ede7054b14ca8b63cf78ca24147cff5305736d \n\
[23:46:48] persist block: 0x66ff431947531361c7e0bc9696ede7054b14ca8b63cf78ca24147cff5305736d \n\
[23:46:48] initialize: height=5 view=0 index=3 role=Backup \n\
[23:46:55] OnPrepareRequestReceived: height=5 view=0 index=1 tx=1 \n\
[23:46:55] send perpare response \n\
[23:46:56] OnPrepareResponseReceived: height=5 view=0 index=2 \n\
[23:46:56] Commit sent: height=5 state=Backup, RequestReceived, SignatureSent, CommitSent \n\
[23:46:56] OnPrepareResponseReceived: height=5 view=0 index=2 \n\
'};

function test_example() {
   return parseLogsGenerateJson(exdata1(), exdata2(), exdata3(), exdata4());
}
