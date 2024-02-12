"
I represent a mutation that does nothing for testing purposes
"
Class {
	#name : 'MyMTNullMutation',
	#superclass : 'Object',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'running' }
MyMTNullMutation >> runMutantStoppingOnError: aBoolean [
	
	"I am a null mutation that does not run any tests and does not install any code.
	Return an empty test result"
	^ TestResult new
]

{ #category : 'tests' }
MyMTNullMutation >> testCaseReferences: aCollection [ 
	
	"A null mutation does not track covering tests"
]
