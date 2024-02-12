Class {
	#name : 'MyMTTestResourceClassForTestingCoverage',
	#superclass : 'TestResource',
	#category : 'MyMuTalk-TestResources',
	#package : 'MyMuTalk-TestResources'
}

{ #category : 'as yet unclassified' }
MyMTTestResourceClassForTestingCoverage >> doSomething [

	^ MyMTClassForTestingCoverage new anUncoveredMethod
]

{ #category : 'as yet unclassified' }
MyMTTestResourceClassForTestingCoverage >> setUp [
	self doSomething
]
