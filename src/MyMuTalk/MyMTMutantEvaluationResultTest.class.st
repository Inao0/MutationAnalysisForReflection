Class {
	#name : 'MyMTMutantEvaluationResultTest',
	#superclass : 'TestCase',
	#instVars : [
		'resource'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTMutantEvaluationResultTest class >> packageNamesUnderTest [
	^ #('MutationTesting-Model')
]

{ #category : 'accessing' }
MyMTMutantEvaluationResultTest class >> resources [
	^ {MyMTResource}
]

{ #category : 'testing - printing' }
MyMTMutantEvaluationResultTest >> mutantPrintString [
	"printing the mutation used in this tests."
	^ resource mutation printString
]

{ #category : 'running' }
MyMTMutantEvaluationResultTest >> setUp [

	super setUp.
	resource := MyMTResource current
]

{ #category : 'testing' }
MyMTMutantEvaluationResultTest >> testMutationResultEmpty [
	"Test the creation of a Mutant Result Empty."
	| result |
	result := resource evaluationResultEmpty.
	self deny: result killed.
	self assert: result survived.
	self deny: result terminated.
	self assert: result runCount = 0
]

{ #category : 'testing' }
MyMTMutantEvaluationResultTest >> testMutationResultKilledByError [
	| result |
	result := resource evaluationResultForKilledMutantByError.
	self assert: result killed.
	self deny: result survived.
	self deny: result terminated.
	self assert: result runCount = 1
]

{ #category : 'testing' }
MyMTMutantEvaluationResultTest >> testMutationResultKilledByFailure [
	| result |
	result := resource evaluationResultForKilledMutantByFailure.
	self assert: result killed.
	self deny: result survived.
	self deny: result terminated.
	self assert: result runCount = 1
]

{ #category : 'testing' }
MyMTMutantEvaluationResultTest >> testMutationResultSurvived [
	"Test the creation of a Mutant Result that survived"
	| result |
	result := resource evaluationResultForAliveMutant.
	self deny: result killed.
	self assert: result survived.
	self deny: result terminated.
	self assert: result runCount = 1
]

{ #category : 'testing' }
MyMTMutantEvaluationResultTest >> testMutationResultTerminated [
	| result |
	result := resource evaluationResultForTerminatedMutant.
	self deny: result killed.
	self deny: result survived.
	self assert: result terminated.
	self assert: result runCount = 0
]

{ #category : 'testing - printing' }
MyMTMutantEvaluationResultTest >> testPrintingMutationResultEmpty [
	"printing a mutation result empty."
	| result stream |
	result := resource evaluationResultEmpty.
	stream := WriteStream with: self mutantPrintString.
	self assert: result printString = stream contents
]

{ #category : 'testing - printing' }
MyMTMutantEvaluationResultTest >> testPrintingMutationResultKilledByError [
	"printing a mutation result killed by error."
	| result stream |
	result := resource evaluationResultForKilledMutantByError.
	stream := WriteStream with: self mutantPrintString.
	self assert: result printString = stream contents
]

{ #category : 'testing - printing' }
MyMTMutantEvaluationResultTest >> testPrintingMutationResultKilledByFailure [
	"printing a mutation result killed by failure."
	| result stream |
	result := resource evaluationResultForKilledMutantByFailure.
	stream := WriteStream with: self mutantPrintString.
	self assert: result printString = stream contents
]

{ #category : 'testing - printing' }
MyMTMutantEvaluationResultTest >> testPrintingMutationResultSurvived [
	"printing a mutation result alive."
	| result stream |
	result := resource evaluationResultForAliveMutant.
	stream := WriteStream with: self mutantPrintString.
	self assert: result printString = stream contents
]

{ #category : 'testing - printing' }
MyMTMutantEvaluationResultTest >> testPrintingMutationResultTerminated [
	"printing a mutation result terminated."
	| result stream |
	result := resource evaluationResultForTerminatedMutant.
	stream := WriteStream with: self mutantPrintString.
	self assert: result printString = stream contents
]
