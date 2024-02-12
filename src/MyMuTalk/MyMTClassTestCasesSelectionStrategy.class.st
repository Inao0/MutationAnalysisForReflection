Class {
	#name : 'MyMTClassTestCasesSelectionStrategy',
	#superclass : 'MyMTTestCasesSelectionStrategy',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'printing' }
MyMTClassTestCasesSelectionStrategy >> description [
	^'Tests in Same Clases'
]

{ #category : 'selecting' }
MyMTClassTestCasesSelectionStrategy >> testCasesFor: aTestCollection [ 
	"Returns all tests in testClases from a collection of tests."
	
	| testClasses |
	testClasses := self testClassesFrom: aTestCollection.
	^ testClasses 
		inject: OrderedCollection new
		into: 
			[ :resultTests :testClass | 
			resultTests addAll: testClass suite tests.
			resultTests ]
]

{ #category : 'selecting' }
MyMTClassTestCasesSelectionStrategy >> testClassesFrom: aTestCollection [ 
	^ (aTestCollection collect: [ :testCase | testCase class ]) asSet
]
