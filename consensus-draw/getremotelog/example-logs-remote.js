// MIT License - NeoResearch 2018

// ==================================== BEGIN EXAMPLE ============================================

function exdata1() { return textlog1; };

function exdata2() { return textlog2; };

function exdata3() { return textlog3; };

function exdata4() { return textlog4; };

function test_example() {
   return parseLogsGenerateJson(exdata1(), exdata2(), exdata3(), exdata4());
}
