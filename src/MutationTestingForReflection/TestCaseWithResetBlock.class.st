Class {
	#name : 'TestCaseWithResetBlock',
	#superclass : 'TestCase',
	#instVars : [
		'resetBlock'
	],
	#category : 'MutationTestingForReflection',
	#package : 'MutationTestingForReflection'
}

{ #category : 'running' }
TestCaseWithResetBlock >> initialize [ 
	resetBlock := [  ]
]

{ #category : 'accessing' }
TestCaseWithResetBlock >> resetBlock [

	^ resetBlock
]

{ #category : 'accessing' }
TestCaseWithResetBlock >> resetBlock: anObject [

	resetBlock := anObject
]

{ #category : 'running' }
TestCaseWithResetBlock >> setUp [
	super setUp.
	resetBlock value.
	"Put here a common initialization logic for tests"
]
