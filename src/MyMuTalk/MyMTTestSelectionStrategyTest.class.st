Class {
	#name : 'MyMTTestSelectionStrategyTest',
	#superclass : 'TestCase',
	#instVars : [
		'resource',
		'classes',
		'operator',
		'evaluationStrategy',
		'mutationTestingAnalysis',
		'testCases',
		'testCasesUsed'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'testing' }
MyMTTestSelectionStrategyTest class >> isAbstract [
	^ true
]

{ #category : 'accessing' }
MyMTTestSelectionStrategyTest class >> packageNamesUnderTest [
	^ #('MutationTesting-Model')
]

{ #category : 'accessing' }
MyMTTestSelectionStrategyTest class >> resources [
	^ {MyMTResource}
]

{ #category : 'asserting' }
MyMTTestSelectionStrategyTest >> assertMutantInCoverageOfTestCase [
	self subclassResponsibility
]

{ #category : 'asserting' }
MyMTTestSelectionStrategyTest >> assertMutantNotInCoverage [
	self subclassResponsibility
]

{ #category : 'asserting' }
MyMTTestSelectionStrategyTest >> assertMutantNotInCoverageOfTest [

	self subclassResponsibility
]

{ #category : 'running' }
MyMTTestSelectionStrategyTest >> getTestsCasesToEvaluateForMutant: aMethodSelector [
	| mutation |
	mutation := (operator mutationsFor: MyMTAuxiliarClassForTestingStrategies >> aMethodSelector) asOrderedCollection first.
	^ evaluationStrategy 
		testCasesToEvaluate: mutation
		for: mutationTestingAnalysis.

]

{ #category : 'configuring' }
MyMTTestSelectionStrategyTest >> selectionStrategy [
	^ self subclassResponsibility
]

{ #category : 'running' }
MyMTTestSelectionStrategyTest >> setUp [

	super setUp.
	resource := MyMTResource current.

	classes := OrderedCollection with: MyMTAuxiliarClassForTestingStrategies.
	operator := MyMTReplaceIfTrueWithIfFalseMutantOperator new.
	evaluationStrategy := self selectionStrategy new.
	testCasesUsed := MyMTAuxiliarTestClassForTestingStrategies suite tests.
	mutationTestingAnalysis := MyMTAnalysis new
		                           testCases: testCasesUsed;
		                           classesToMutate: classes;
		                           operators: (Set with: operator);
		                           testSelectionStrategy: evaluationStrategy.
	mutationTestingAnalysis generateCoverageAnalysis
]

{ #category : 'test' }
MyMTTestSelectionStrategyTest >> testMutantInCoverageOfTestCase [

	testCases := self getTestsCasesToEvaluateForMutant: #method1.
	^ self assertMutantInCoverageOfTestCase
]

{ #category : 'test' }
MyMTTestSelectionStrategyTest >> testMutantNotInCoverage [

	testCases := self getTestsCasesToEvaluateForMutant: #aNotCoveredMethod.
	^ self assertMutantNotInCoverage
]

{ #category : 'test' }
MyMTTestSelectionStrategyTest >> testMutantNotInCoverageOfTest [

	testCases := self getTestsCasesToEvaluateForMutant: #method1.
	^ self assertMutantNotInCoverageOfTest
]
