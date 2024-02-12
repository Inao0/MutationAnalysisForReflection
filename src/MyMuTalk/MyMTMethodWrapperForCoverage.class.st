Class {
	#name : 'MyMTMethodWrapperForCoverage',
	#superclass : 'TestCoverage',
	#instVars : [
		'tests',
		'coverageAnalysis'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'instance creation' }
MyMTMethodWrapperForCoverage class >> on: aMethodReference for: aCoverageAnalysis [
	^ self new initializeOn: aMethodReference for: aCoverageAnalysis
]

{ #category : 'initialization' }
MyMTMethodWrapperForCoverage >> initializeOn: aMethodReference for: aCoverageAnalysis [
	self initializeOn: aMethodReference.
	coverageAnalysis := aCoverageAnalysis.
	tests := Set new
]

{ #category : 'private' }
MyMTMethodWrapperForCoverage >> mark [
	|currentTest|
	super mark.
	currentTest := coverageAnalysis currentTest.
	currentTest ifNotNil: [tests add: currentTest]. 
	

]

{ #category : 'evaluation' }
MyMTMethodWrapperForCoverage >> run: aSelector with: anArray in: aReceiver [
	self mark.
	^ aReceiver withArgs: anArray executeMethod: method
]

{ #category : 'accessing' }
MyMTMethodWrapperForCoverage >> tests [
	^tests
]
