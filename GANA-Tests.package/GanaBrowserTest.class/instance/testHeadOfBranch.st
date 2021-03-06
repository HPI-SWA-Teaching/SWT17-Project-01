testing
testHeadOfBranch

	| version1 version2 version3 workingCopy squitRepository |
	squitRepository := MockRepository new.
	version1 := MockVersion newWith: 'Not' From: #() at: TimeStamp now id:'ABCD1234'.
	version2 := MockVersion newWith: 'Not' From: {version1} at: TimeStamp now id:'ABFE4569'.
	version3 := MockVersion newWith: 'I am the Head' From: {version2} at: TimeStamp now id:'XYUALIWL'.
	workingCopy := self newWorkingCopyWithMasterAt: version3.
	self setWorkingCopy: workingCopy.
	self uiCommitList do: [:element| (element complexContents item version message  = 'I am the Head') 
											ifTrue: [self assert: (element colorToUse = element complexContents firstVersionColor)] 
											ifFalse: [self assert: (element colorToUse = element complexContents firstVersionColor) not]].