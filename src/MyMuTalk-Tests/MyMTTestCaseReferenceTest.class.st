Class {
	#name : 'MyMTTestCaseReferenceTest',
	#superclass : 'TestCase',
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'resources' }
MyMTTestCaseReferenceTest >> test1 [
	^self assert: true.
]

{ #category : 'resources' }
MyMTTestCaseReferenceTest >> testATestReferenceResult [
	| testReference |
	testReference := self testReferenceForTest1.
	self assert: testReference runUnchecked errors isEmpty.
	
]

{ #category : 'resources' }
MyMTTestCaseReferenceTest >> testReferenceForTest1 [

	^ MyMTTestCaseReference for: #test1 in: self class
]
