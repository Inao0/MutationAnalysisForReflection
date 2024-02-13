Class {
	#name : 'MyMTFakeInfiniteLoopsTest',
	#superclass : 'TestCase',
	#category : 'MyMuTalk-TestResources',
	#package : 'MyMuTalk-TestResources'
}

{ #category : 'tests' }
MyMTFakeInfiniteLoopsTest >> testIterativeFactorial [

	| ins |
	ins := MyMTFakeInfiniteLoopForTest new.
	self assert: (ins iterativeFactorial: 3) equals: 6.
	self assert: (ins iterativeFactorial: 5) equals: 120
]

{ #category : 'tests' }
MyMTFakeInfiniteLoopsTest >> testRecursiveFactorial [

	| ins |
	ins := MyMTFakeInfiniteLoopForTest new.
	self assert: (ins recursiveFactorial: 3) equals: 6.
	self assert: (ins recursiveFactorial: 5) equals: 120
]
