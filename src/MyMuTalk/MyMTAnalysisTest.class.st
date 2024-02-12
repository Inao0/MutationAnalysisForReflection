Class {
	#name : 'MyMTAnalysisTest',
	#superclass : 'TestCase',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTAnalysisTest class >> classNamesNotUnderTest [
	^ #('MutationBrowser' 'MutationTestRunner' )
]

{ #category : 'accessing' }
MyMTAnalysisTest class >> packageNamesUnderTest [
	^ #('MutationTesting-Model')
]

{ #category : 'accessing' }
MyMTAnalysisTest >> ifFalseForIfTrueReplacementMutation [
	"Return a Collection with a Mutation Operation to be applied to the AuxiliarClass. 
	In this case, the operation will be a boolean Replacement (ifFalse for ifTrue)."
	| operator |
	operator := MyMTReplaceIfFalseWithIfTrueMutantOperator new.
	^ OrderedCollection with: operator
]

{ #category : 'accessing' }
MyMTAnalysisTest >> ifTrueForIfFalseReplacementMutation [
	"Return a Collection with a Mutation Operation to be applied to the
	DummyClass. In this case, the operation will be a boolean Replacement (ifTrue for ifFalse)."
	| operator |
	operator := MyMTReplaceIfTrueWithIfFalseMutantOperator new.
	^ OrderedCollection with: operator
]

{ #category : 'accessing' }
MyMTAnalysisTest >> minusForPlusReplacementMutation [
	"Return a Collection with a Mutation Operation to be applied to the method in MutationTestingAuxiliarClass. 
	In this case, the operation will be an Arithmetic Replacement (Minus for Plus)."
	| operator |
	operator := MyMTReplaceMinusWithPlusMutantOperator new.
	^ OrderedCollection with: operator
]

{ #category : 'accessing' }
MyMTAnalysisTest >> plusForMinusReplacementMutation [
	"Return a Collection with a Mutation Operation to be applied to the
	DummyClass. In this case, the operation will be an Arithmetic
	Replacement (Plus for Minus)."
	| operator |
	operator := MyMTReplacePlusWithMinusMutantOperator new.
	^ OrderedCollection with: operator
]

{ #category : 'accessing' }
MyMTAnalysisTest >> selectForRejectReplacementMutation [
	| operator |
	operator := MyMTReplaceSelectWithRejectMutantOperator new.
	^ OrderedCollection with: operator
]

{ #category : 'tests' }
MyMTAnalysisTest >> testDefaultParameters [

	| analysis |
	analysis := MyMTAnalysis new.
	self
		assert: (analysis operators collect: [ :op | op species ])
		equals: (MyMTMutantOperator contents collect: [ :op | op species ]).
	self
		assert: analysis mutantSelectionStrategy species
		equals: MyMTAllMutantSelectionStrategy.
	self
		assert: analysis testSelectionStrategy species
		equals: MyMTAllTestsMethodsRunningTestSelectionStrategy.
	self assert: analysis budget species equals: MyMTFreeBudget
]

{ #category : 'testing' }
MyMTAnalysisTest >> testExecutingInfiniteLoopAnalysis [

	| analysis results mutationResult |
	"This test will execute another test that will time out.
	So this test will need a higher time limit"
	self timeLimit: self defaultTimeLimit * 2.

	analysis := MyMTAnalysis new
		            testClasses: { MyMTFakeInfiniteLoopsTest };
		            classesToMutate: { MyMTFakeInfiniteLoopForTest };
		            operators: { MyMTReplaceLessOrEqualWithTrueOperator new }.

	analysis run.

	results := analysis mutantResults.
	self assert: results size equals: 1.
	mutationResult := results first.
	self assert: mutationResult killed
]

{ #category : 'testing' }
MyMTAnalysisTest >> testExecutingInfiniteRecursionAnalysis [

	| analysis results mutationResult |
	"This test will execute another test that will time out.
	So this test will need a higher time limit"
	self timeLimit: self defaultTimeLimit * 2.

	analysis := MyMTAnalysis new
		            testClasses: { MyMTFakeInfiniteLoopsTest };
		            classesToMutate: { MyMTFakeInfiniteLoopForTest };
		            operators:
			            { MyMTReplaceIfTrueReceiverWithFalseOperator new }.

	analysis run.

	results := analysis mutantResults.
	self assert: results size equals: 1.
	mutationResult := results first.
	self assert: mutationResult killed
]

{ #category : 'testing' }
MyMTAnalysisTest >> testExecutingSimpleMutation [

	| analysis results generalResult mutationResult |
	analysis := MyMTAnalysis new
		            testClasses:
			            (Array with:
					             MyMTAuxiliarClassForMTAnalysisTest);
		            classesToMutate:
			            (Array with: MyMTAuxiliarClassForMTAnalysis);
		            operators: self plusForMinusReplacementMutation.
	analysis run.
	generalResult := analysis generalResult.
	results := analysis mutantResults.
	self assert: results size equals: 1.
	mutationResult := results first.
	self assert: mutationResult killed.
	self assert: generalResult numberOfKilledMutants equals: 1
]

{ #category : 'testing' }
MyMTAnalysisTest >> testExecutingSimpleMutationForClassMethods [

	| analysis results generalResult mutationResult |
	analysis := MyMTAnalysis new
		            testClasses:
			            (Array with:
					             MyMTAuxiliarClassForMTAnalysisTest);
		            classesToMutate:
			            (Array with: MyMTAuxiliarClassForMTAnalysis);
		            operators: self selectForRejectReplacementMutation.
	analysis run.
	generalResult := analysis generalResult.
	results := analysis mutantResults.
	self assert: results size equals: 1.
	mutationResult := results first.
	self assert: mutationResult killed.
	self assert: generalResult numberOfKilledMutants equals: 1
]

{ #category : 'testing' }
MyMTAnalysisTest >> testExecutingSimpleMutationWhenNotRunnedAnalysis [

	| analysis results generalResult |
	analysis := MyMTAnalysis new
		            testClasses:
			            (Array with:
					             MyMTAuxiliarClassForMTAnalysisTest);
		            classesToMutate:
			            (Array with: MyMTAuxiliarClassForMTAnalysis);
		            operators: self plusForMinusReplacementMutation.
	"analysis run."
	generalResult := analysis generalResult.
	results := analysis mutantResults.
	self assert: results isEmpty.
	self assert: generalResult numberOfEvaluatedMutants equals: 0
]

{ #category : 'testing' }
MyMTAnalysisTest >> testExecutingTwoMutantsFromDiferentMethods [
	"Obtain 2 mutants using ifFalse-->ifTrue replacement in two diferent methods."

	| analysis results operatorSelection |
	operatorSelection := OrderedCollection new.
	operatorSelection addAll: self ifFalseForIfTrueReplacementMutation.
	analysis := MyMTAnalysis new
		            testClasses: Array new;
		            classesToMutate:
			            (Array with: MyMTAuxiliarClassForMTAnalysis);
		            operators: operatorSelection.
	analysis run.
	results := analysis mutantResults.
	self assert: results size equals: 2.
	results do: [ :mutationResult | self deny: mutationResult killed ]
]

{ #category : 'testing' }
MyMTAnalysisTest >> testExecutingTwoMutantsFromSameMethod [
	"Obtain 2 mutants using --->+ replacement in only one method."

	| analysis results operatorSelection |
	operatorSelection := OrderedCollection new.
	operatorSelection addAll: self minusForPlusReplacementMutation.
	analysis := MyMTAnalysis new
		            testClasses: Array new;
		            classesToMutate:
			            (Array with: MyMTAuxiliarClassForMTAnalysis);
		            operators: operatorSelection.
	analysis run.
	results := analysis mutantResults.
	self assert: results size equals: 2.
	results do: [ :mutationResult | self deny: mutationResult killed ]
]

{ #category : 'testing' }
MyMTAnalysisTest >> testExecutingTwoMutations [
	"Execute 2 diferent mutations #ifTrue-->#ifFalse: and
	#+-->#-"

	| analysis results generalResult operatorSelection |
	operatorSelection := OrderedCollection new.
	operatorSelection addAll: self plusForMinusReplacementMutation.
	operatorSelection addAll: self ifTrueForIfFalseReplacementMutation.
	analysis := MyMTAnalysis new
		            testClasses:
			            (Array with:
					             MyMTAuxiliarClassForMTAnalysisTest);
		            classesToMutate:
			            (Array with: MyMTAuxiliarClassForMTAnalysis);
		            operators: operatorSelection.
	analysis run.
	generalResult := analysis generalResult.
	results := analysis mutantResults.
	self assert: results size equals: 2.
	results do: [ :mutationResult | self assert: mutationResult killed ].
	self assert: generalResult numberOfKilledMutants equals: 2
]

{ #category : 'tests' }
MyMTAnalysisTest >> testRunningAllTests [
	"This test verify that the test evaluation keeps running even after the first error, if specified"

	| analysis |
	analysis := MyMTAnalysis new
		            testClasses:
			            { MyMTAuxiliarTestClassForContinuingTestsExecutionAfterFirstFail };
		            classesToMutate: { MyMTAuxiliarClassForMTAnalysis };
		            doNotStopOnErrorOrFail.

	"In this class, tests fail after a certain of executions"
	MyMTAuxiliarTestClassForContinuingTestsExecutionAfterFirstFail reset.
	analysis run.
	"Counting the number of failed test for a mutant"
	self assert:
		analysis generalResult killedMutants first result failures size > 1
]
