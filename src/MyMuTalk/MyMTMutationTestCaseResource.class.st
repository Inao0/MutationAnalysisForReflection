Class {
	#name : 'MyMTMutationTestCaseResource',
	#superclass : 'TestCase',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTMutationTestCaseResource class >> packageNamesUnderTest [
	^ #('MutationTesting-Model')
]

{ #category : 'accessing' }
MyMTMutationTestCaseResource >> error [
	3 zork
]

{ #category : 'accessing' }
MyMTMutationTestCaseResource >> fail [
	self assert: false.
]

{ #category : 'accessing' }
MyMTMutationTestCaseResource >> pass [
	self assert: true
]
