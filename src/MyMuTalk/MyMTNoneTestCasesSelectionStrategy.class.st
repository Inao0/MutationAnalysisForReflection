Class {
	#name : 'MyMTNoneTestCasesSelectionStrategy',
	#superclass : 'MyMTTestCasesSelectionStrategy',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'printing' }
MyMTNoneTestCasesSelectionStrategy >> description [
	^'Same Tests'
]

{ #category : 'selecting' }
MyMTNoneTestCasesSelectionStrategy >> testCasesFor: aTestCollection [ 
	"It returns all same tests from a collection of tests received."
	^aTestCollection
]
