testing
testSearchMessage

	| version1 version2 version3 ganaBrowser |
	ganaBrowser := self subject model.
	version1 := MockVersion newWith: 'Message To The SWT Teaching Team' From: #() at: TimeStamp now id:'ABCD1234'.
	version2 := MockVersion newWith: 'Here we are writing beautiful pretty tests' From: {version1} at: TimeStamp now id:'ABFE4569'.
	version3 := MockVersion newWith: 'pretty' From: {version2} at: TimeStamp now id:'XYUALIWL'.
	self setWorkingCopy: (self newWorkingCopyWithMasterAt: version3).
	self assertCommitListIncludesAll: { version1 . version2 . version3}.
	
	ganaBrowser searchTerm: 'pretty'.
	self 
		assertCommitListIncludesAll: {version2 . version3};
		assertCommitListIncludesNone: { version1 }.