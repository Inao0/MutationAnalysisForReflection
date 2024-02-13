Class {
	#name : 'MyMTResource',
	#superclass : 'TestResource',
	#instVars : [
		'testResource'
	],
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'building' }
MyMTResource >> evaluationResultEmpty [
	"Build a MutationEvaluationResult empty"
	| mutant testResultEmpty |
	mutant := self mutation.
	testResultEmpty := self testResultEmpty.
	^ MyMTMutantEvaluationResult 
		for: mutant
		results: testResultEmpty
]

{ #category : 'building' }
MyMTResource >> evaluationResultForAliveMutant [
	"Build a MutationEvaluationResult for aMutant with only one survived"
	| mutation testResultWithoutErrors |
	mutation := self mutation.
	testResultWithoutErrors := self testResultWithoutErrorOrFailure.
	^ MyMTMutantEvaluationResult 
		for: mutation
		results: testResultWithoutErrors
]

{ #category : 'building' }
MyMTResource >> evaluationResultForKilledMutantByError [
	"Build a MutationEvaluationResult for aMutant with only one Error"
	| mutation testResultWithOneError |
	mutation := self mutation.
	testResultWithOneError := self testResultWithError.
	^ MyMTMutantEvaluationResult 
		for: mutation
		results: testResultWithOneError
]

{ #category : 'building' }
MyMTResource >> evaluationResultForKilledMutantByFailure [
	"Build a MutationEvaluationResult for aMutant with only one Failure"
	| mutation testResultWithOneFailure |
	mutation := self mutation.
	testResultWithOneFailure := self testResultWithFailure.
	^ MyMTMutantEvaluationResult 
		for: mutation
		results: testResultWithOneFailure
]

{ #category : 'building' }
MyMTResource >> evaluationResultForTerminatedMutant [
	"Build a MutationEvaluationResult for aMutant terminated"
	| mutation |
	mutation := self mutation.
	^ MyMTMutantEvaluationResult 
		for: mutation
		results: nil
]

{ #category : 'building-private' }
MyMTResource >> methodForBuildingMutant [
	^1+2
]

{ #category : 'building-private' }
MyMTResource >> mutation [
	"Build Mock Object that simulates a Mutant"
	| method |
	method := self class >> #methodForBuildingMutant.
	^ MyMTMethodMutation
		for: method
		using: MyMTReplacePlusWithMinusMutantOperator new
		nodeNumber: 1
		ofClass: self class
]

{ #category : 'running' }
MyMTResource >> setUp [

	super setUp.
	testResource := MyMTMutationTestCaseResource new
]

{ #category : 'building-private' }
MyMTResource >> testResultEmpty [
	"Build a TestResult empty"
	^ TestResult new
]

{ #category : 'building-private' }
MyMTResource >> testResultWithError [
	"Build a TestResult with error"
	| case |
	case := testResource class selector: #error.
	^ case run
]

{ #category : 'building-private' }
MyMTResource >> testResultWithFailure [
	"Build a TestResult with failure"
	| case |
	case := testResource class selector: #fail.
	^ case run
]

{ #category : 'building-private' }
MyMTResource >> testResultWithoutErrorOrFailure [
	"Build a TestResult without errors or failures"
	| case |
	case := testResource class selector: #pass.
	^ case run
]
