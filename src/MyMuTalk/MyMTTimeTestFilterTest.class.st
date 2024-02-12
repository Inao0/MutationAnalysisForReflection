Class {
	#name : 'MyMTTimeTestFilterTest',
	#superclass : 'MyMTTestFilterTest',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'running' }
MyMTTimeTestFilterTest >> runAnalysisForTimeCondition: aDuration [

	self
		runAnalysisWithFilter: (MyMTTimeTestFilter for: aDuration)
		on: { MyMTAuxiliarClassForTimeTestFilter }
		withTests: { MyMTAuxiliarClassForTimeTestFilterTest }
]

{ #category : 'running' }
MyMTTimeTestFilterTest >> testWith10MillisecondsCondition [

	| testCaseReference |
	testCaseReference := MyMTTestCaseReference
		                     for: #test10Milliseconds
		                     in: MyMTAuxiliarClassForTimeTestFilterTest.
	self runAnalysisForTimeCondition:
		(self timeToRunFor: testCaseReference) * 10.

	self
		assert: (analysis generalResult particularResults at: 1) runCount
		equals: 1
]

{ #category : 'running' }
MyMTTimeTestFilterTest >> testWith1SecondCondition [

	| testCaseReference |
	testCaseReference := MyMTTestCaseReference
		                     for: #test1Second
		                     in: MyMTAuxiliarClassForTimeTestFilterTest.
	self runAnalysisForTimeCondition:
		(self timeToRunFor: testCaseReference) * 10.

	self
		assert: (analysis generalResult particularResults at: 1) runCount
		equals: 2
]

{ #category : 'running' }
MyMTTimeTestFilterTest >> timeToRunFor: aTestCaseReference [

	aTestCaseReference runUnchecked.
	^ aTestCaseReference lastTimeToRun
]
