testing
testEmptyCommitMessage

	 | version1 version2 workingCopy squitRepository |
	 squitRepository := MockRepository new. 
	 version1 := MockVersion newWith: '' From: #() at: TimeStamp now id:'11111111'.
	 version2 := MockVersion newWith: '2' From: {version1} at: TimeStamp now id:'22222222'.
	 workingCopy := self newWorkingCopyWithMasterAt: version2.
	 self setWorkingCopy: workingCopy.
	 self assert: (self uiCommitList size = 2).	