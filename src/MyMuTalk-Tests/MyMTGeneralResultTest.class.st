Class {
	#name : 'MyMTGeneralResultTest',
	#superclass : 'TestCase',
	#instVars : [
		'resource'
	],
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'accessing' }
MyMTGeneralResultTest class >> packageNamesUnderTest [
	^ #('MutationTesting-Model')
]

{ #category : 'accessing' }
MyMTGeneralResultTest class >> resources [
	^ {MyMTResource}
]

{ #category : 'accessing' }
MyMTGeneralResultTest >> mutationEngineGeneralEmptyResult [
	"Returns an empty Mutant Engine General Result."

	^ MyMTGeneralResult empty
]

{ #category : 'accessing' }
MyMTGeneralResultTest >> mutationEngineGeneralResultWithOneAliveMutant [
	"Returns a Mutant Engine General Result with only one mutant survived."

	^ MyMTGeneralResult for:
		  (OrderedCollection with: resource evaluationResultForAliveMutant)
]

{ #category : 'accessing' }
MyMTGeneralResultTest >> mutationEngineGeneralResultWithOneKilledMutantByError [
	"Returns a Mutant Engine General Result with only one mutant killed by
	error. "

	^ MyMTGeneralResult for: (OrderedCollection with:
			   resource evaluationResultForKilledMutantByError)
]

{ #category : 'accessing' }
MyMTGeneralResultTest >> mutationEngineGeneralResultWithOneKilledMutantByFailure [
	"Returns a Mutant Engine General Result with only one mutant killed by
	failure."

	^ MyMTGeneralResult for: (OrderedCollection with:
			   resource evaluationResultForKilledMutantByFailure)
]

{ #category : 'accessing' }
MyMTGeneralResultTest >> mutationEngineGeneralResultWithOneTerminatedMutant [
	"Returns a Mutant Engine General Result with only one terminated mutant."

	^ MyMTGeneralResult for:
		  (OrderedCollection with:
			   resource evaluationResultForTerminatedMutant)
]

{ #category : 'running' }
MyMTGeneralResultTest >> setUp [

	super setUp.
	resource := MyMTResource current
]

{ #category : 'testing' }
MyMTGeneralResultTest >> testAccessorsOnEmptyResult [
	"Test the accessors methods for an empty result set"
	| emptyResult |
	emptyResult := self mutationEngineGeneralEmptyResult.
	self assert: emptyResult numberOfEvaluatedMutants = 0.
	self assert: emptyResult numberOfKilledMutants = 0.
	self assert: emptyResult numberOfAliveMutants = 0.
	self assert: emptyResult numberOfTerminatedMutants = 0.
	self assert: emptyResult mutationScore = 0.
	self assert: emptyResult isNonAcceptableScore.
	self deny: emptyResult isAcceptableScore
]

{ #category : 'testing' }
MyMTGeneralResultTest >> testAccessorsWithOnlyOneAliveMutant [
	"Build a MutationEngineGeneralResult with only 1 alive mutant."
	| mutantResult |
	mutantResult := self mutationEngineGeneralResultWithOneAliveMutant.
	self assert: mutantResult numberOfEvaluatedMutants = 1.
	self assert: mutantResult numberOfKilledMutants = 0.
	self assert: mutantResult numberOfAliveMutants = 1.
	self assert: mutantResult numberOfTerminatedMutants = 0.
	self assert: mutantResult mutationScore = 0.
	self assert: mutantResult isNonAcceptableScore.
	self deny: mutantResult isAcceptableScore
]

{ #category : 'testing' }
MyMTGeneralResultTest >> testAccessorsWithOnlyOneKilledMutantByError [
	"Build a MutationEngineGeneralResult with only 1 killed mutant by error."
	| mutantResult |
	mutantResult := self mutationEngineGeneralResultWithOneKilledMutantByError.
	self assert: mutantResult numberOfEvaluatedMutants = 1.
	self assert: mutantResult numberOfKilledMutants = 1.
	self assert: mutantResult numberOfAliveMutants = 0.
	self assert: mutantResult numberOfTerminatedMutants = 0.
	self assert: mutantResult mutationScore = 100.
	self deny: mutantResult isNonAcceptableScore.
	self assert: mutantResult isAcceptableScore
]

{ #category : 'testing' }
MyMTGeneralResultTest >> testAccessorsWithOnlyOneKilledMutantByFailure [
	"Build a MutationEngineGeneralResult with only 1 killed mutant by failure."
	| mutantResult |
	mutantResult := self mutationEngineGeneralResultWithOneKilledMutantByFailure.
	self assert: mutantResult numberOfEvaluatedMutants = 1.
	self assert: mutantResult numberOfKilledMutants = 1.
	self assert: mutantResult numberOfAliveMutants = 0.
	self assert: mutantResult numberOfTerminatedMutants = 0.
	self assert: mutantResult mutationScore = 100.
	self deny: mutantResult isNonAcceptableScore.
	self assert: mutantResult isAcceptableScore
]

{ #category : 'testing' }
MyMTGeneralResultTest >> testAccessorsWithOnlyOneTerminatedMutant [
	"Build a MutationEngineGeneralResult with only 1 terminated mutant."
	| mutantResult |
	mutantResult := self mutationEngineGeneralResultWithOneTerminatedMutant.
	self assert: mutantResult numberOfEvaluatedMutants = 1.
	self assert: mutantResult numberOfKilledMutants = 0.
	self assert: mutantResult numberOfAliveMutants = 0.
	self assert: mutantResult numberOfTerminatedMutants = 1.
	self assert: mutantResult mutationScore = 100.
	self assert: mutantResult isAcceptableScore.
	self deny: mutantResult isNonAcceptableScore
]

{ #category : 'testing - printing' }
MyMTGeneralResultTest >> testPrintingOnEmptyResult [
	"Test printing an empty general result"
	| emptyResult stream|
	emptyResult := self mutationEngineGeneralEmptyResult.
	stream := WriteStream with: '0 mutants, 0 killed, 0 alive, 0 terminated. Mutation Score: 0%.'.
	self assert: emptyResult printString = stream contents.
]

{ #category : 'testing - printing' }
MyMTGeneralResultTest >> testPrintingWithOnlyOneAliveMutant [
	"printing a mutation general result with only one alive mutant."
	| oneKilledMutantResult stream|
	oneKilledMutantResult := self mutationEngineGeneralResultWithOneAliveMutant.
	stream := WriteStream with: '1 mutants, 0 killed, 1 alive, 0 terminated. Mutation Score: 0%.'.
	self assert: oneKilledMutantResult printString = stream contents.
]

{ #category : 'testing - printing' }
MyMTGeneralResultTest >> testPrintingWithOnlyOneKilledMutantByError [
	"printing a mutation general result with one mutant killed by error."
	| oneKilledMutantResult stream|
	oneKilledMutantResult := self mutationEngineGeneralResultWithOneKilledMutantByError.
	stream := WriteStream with: '1 mutants, 1 killed, 0 alive, 0 terminated. Mutation Score: 100%.'.
	self assert: oneKilledMutantResult printString = stream contents.
]

{ #category : 'testing - printing' }
MyMTGeneralResultTest >> testPrintingWithOnlyOneKilledMutantByFailure [
	"printing a mutation general result with one mutant killed by failure."
	| oneKilledMutantResult stream |
	oneKilledMutantResult := self mutationEngineGeneralResultWithOneKilledMutantByFailure.
	stream := WriteStream with: '1 mutants, 1 killed, 0 alive, 0 terminated. Mutation Score: 100%.'.
	self assert: oneKilledMutantResult printString = stream contents
]

{ #category : 'testing - printing' }
MyMTGeneralResultTest >> testPrintingWithOnlyOneTerminatedMutant [
	"printing a mutation general result with one mutant terminated."
	| oneKilledMutantResult stream |
	oneKilledMutantResult := self mutationEngineGeneralResultWithOneTerminatedMutant.
	stream := WriteStream with: '1 mutants, 0 killed, 0 alive, 1 terminated. Mutation Score: 100%.'.
	self assert: oneKilledMutantResult printString = stream contents
]
