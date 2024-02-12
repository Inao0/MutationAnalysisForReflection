Class {
	#name : 'MyMTAnalysis',
	#superclass : 'Object',
	#instVars : [
		'modelClasses',
		'operators',
		'elapsedTime',
		'mutations',
		'testCases',
		'coverageAnalysisResult',
		'logger',
		'budget',
		'mutantResults',
		'stopOnErrorOrFail',
		'testSelectionStrategy',
		'mutantSelectionStrategy',
		'testFilter'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'defaults' }
MyMTAnalysis class >> defaultLogger [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ MyMTNullAnalysisLogger new
]

{ #category : 'defaults' }
MyMTAnalysis class >> defaultMutantSelectionStrategy [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ MyMTAllMutantSelectionStrategy new
]

{ #category : 'defaults' }
MyMTAnalysis class >> defaultMutationTestingBudget [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ MyMTFreeBudget new
]

{ #category : 'defaults' }
MyMTAnalysis class >> defaultTestSelectionStrategy [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ MyMTAllTestsMethodsRunningTestSelectionStrategy new
]

{ #category : 'instance creation' }
MyMTAnalysis class >> for: testCases mutating: classes using: operatorCollection [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: testCases
		  mutating: classes
		  using: operatorCollection
		  with: self defaultTestSelectionStrategy
		  with: self defaultMutantSelectionStrategy
]

{ #category : 'instance creation' }
MyMTAnalysis class >> for: testCases mutating: classes using: operatorCollection budget: aBudget [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: testCases
		  mutating: classes
		  using: operatorCollection
		  with: self defaultTestSelectionStrategy
		  with: self defaultMutantSelectionStrategy
		  budget: aBudget
]

{ #category : 'instance creation' }
MyMTAnalysis class >> for: testCases mutating: classes using: operatorCollection loggingIn: aLogger [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: testCases
		  mutating: classes
		  using: operatorCollection
		  with: self defaultTestSelectionStrategy
		  with: self defaultMutantSelectionStrategy
		  loggingIn: aLogger
]

{ #category : 'instance creation' }
MyMTAnalysis class >> for: testCases mutating: classes using: operatorCollection loggingIn: aLogger budget: aBudget [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: testCases
		  mutating: classes
		  using: operatorCollection
		  with: self defaultTestSelectionStrategy
		  with: self defaultMutantSelectionStrategy
		  loggingIn: aLogger
		  budget: aBudget
]

{ #category : 'instance creation' }
MyMTAnalysis class >> for: testCases mutating: classes using: operatorCollection with: aMutantEvaluationStrategy [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: testCases
		  mutating: classes
		  using: operatorCollection
		  with: aMutantEvaluationStrategy
		  with: self defaultMutantSelectionStrategy
]

{ #category : 'instance creation' }
MyMTAnalysis class >> for: testCases mutating: classes using: operatorCollection with: aMutantEvaluationStrategy budget: aBudget [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: testCases
		  mutating: classes
		  using: operatorCollection
		  with: aMutantEvaluationStrategy
		  with: self defaultMutantSelectionStrategy
		  budget: aBudget
]

{ #category : 'instance creation' }
MyMTAnalysis class >> for: testCases mutating: classes using: operatorCollection with: aMutantEvaluationStrategy loggingIn: aLogger [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: testCases
		  mutating: classes
		  using: operatorCollection
		  with: aMutantEvaluationStrategy
		  with: self defaultMutantSelectionStrategy
		  loggingIn: aLogger
]

{ #category : 'instance creation' }
MyMTAnalysis class >> for: testCases mutating: classes using: operatorCollection with: aMutantEvaluationStrategy loggingIn: aLogger budget: aBudget [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: testCases
		  mutating: classes
		  using: operatorCollection
		  with: aMutantEvaluationStrategy
		  with: self defaultMutantSelectionStrategy
		  loggingIn: aLogger
		  budget: aBudget
]

{ #category : 'instance creation' }
MyMTAnalysis class >> for: testCases mutating: classes using: operatorCollection with: aMutantsEvaluationStrategy with: aMutationsGenerationStrategy [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: testCases
		  mutating: classes
		  using: operatorCollection
		  with: aMutantsEvaluationStrategy
		  with: aMutationsGenerationStrategy
		  loggingIn: self defaultLogger
]

{ #category : 'instance creation' }
MyMTAnalysis class >> for: testCases mutating: classes using: operatorCollection with: aMutantsEvaluationStrategy with: aMutationsGenerationStrategy budget: aBudget [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: testCases
		  mutating: classes
		  using: operatorCollection
		  with: aMutantsEvaluationStrategy
		  with: aMutationsGenerationStrategy
		  loggingIn: self defaultLogger
		  budget: aBudget
]

{ #category : 'instance creation' }
MyMTAnalysis class >> for: testCases mutating: classes using: operatorCollection with: aMutantsEvaluationStrategy with: aMutationsGenerationStrategy loggingIn: aLogger [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: testCases
		  mutating: classes
		  using: operatorCollection
		  with: aMutantsEvaluationStrategy
		  with: aMutationsGenerationStrategy
		  loggingIn: aLogger
		  budget: self defaultMutationTestingBudget
]

{ #category : 'instance creation' }
MyMTAnalysis class >> for: testCases mutating: classes using: operatorCollection with: aMutantsEvaluationStrategy with: aMutationsGenerationStrategy loggingIn: aLogger budget: aBudget [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self new
		  testCases: testCases;
		  classesToMutate: classes;
		  operators: operatorCollection;
		  testSelectionStrategy: aMutantsEvaluationStrategy;
		  mutantSelectionStrategy: aMutationsGenerationStrategy;
		  logger: aLogger;
		  budget: aBudget;
		  yourself
]

{ #category : 'instance creation' }
MyMTAnalysis class >> testCasesFrom: testClasses [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ testClasses
		  inject: OrderedCollection new
		  into: [ :testCases :testClass |
			  testClass isAbstract ifFalse: [
				  testCases addAll: (self testCasesReferencesFrom: testClass) ].
			  testCases ]
]

{ #category : 'instance creation' }
MyMTAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: (self testCasesFrom: testClasses)
		  mutating: classes
		  using: operatorCollection
]

{ #category : 'instance creation' }
MyMTAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection budget: aBudget [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: (self testCasesFrom: testClasses)
		  mutating: classes
		  using: operatorCollection
		  budget: aBudget
]

{ #category : 'instance creation' }
MyMTAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection logginIn: aLogger [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: (self testCasesFrom: testClasses)
		  mutating: classes
		  using: operatorCollection
		  loggingIn: aLogger
]

{ #category : 'instance creation' }
MyMTAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection logginIn: aLogger budget: aBudget [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: (self testCasesFrom: testClasses)
		  mutating: classes
		  using: operatorCollection
		  loggingIn: aLogger
		  budget: aBudget
]

{ #category : 'instance creation' }
MyMTAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: (self testCasesFrom: testClasses)
		  mutating: classes
		  using: operatorCollection
		  with: anEvaluationStrategy
]

{ #category : 'instance creation' }
MyMTAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy budget: aBudget [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: (self testCasesFrom: testClasses)
		  mutating: classes
		  using: operatorCollection
		  with: anEvaluationStrategy
		  budget: aBudget
]

{ #category : 'instance creation' }
MyMTAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy loggingIn: aLogger [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: (self testCasesFrom: testClasses)
		  mutating: classes
		  using: operatorCollection
		  with: anEvaluationStrategy
		  loggingIn: aLogger
]

{ #category : 'instance creation' }
MyMTAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy loggingIn: aLogger budget: aBudget [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: (self testCasesFrom: testClasses)
		  mutating: classes
		  using: operatorCollection
		  with: anEvaluationStrategy
		  loggingIn: aLogger
		  budget: aBudget
]

{ #category : 'instance creation' }
MyMTAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy with: aGenerationStrategy [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: (self testCasesFrom: testClasses)
		  mutating: classes
		  using: operatorCollection
		  with: anEvaluationStrategy
		  with: aGenerationStrategy
]

{ #category : 'instance creation' }
MyMTAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy with: aGenerationStrategy budget: aBudget [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: (self testCasesFrom: testClasses)
		  mutating: classes
		  using: operatorCollection
		  with: anEvaluationStrategy
		  with: aGenerationStrategy
		  budget: aBudget
]

{ #category : 'instance creation' }
MyMTAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy with: aGenerationStrategy loggingIn: aLogger [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: (self testCasesFrom: testClasses)
		  mutating: classes
		  using: operatorCollection
		  with: anEvaluationStrategy
		  with: aGenerationStrategy
		  loggingIn: aLogger
]

{ #category : 'instance creation' }
MyMTAnalysis class >> testCasesFrom: testClasses mutating: classes using: operatorCollection with: anEvaluationStrategy with: aGenerationStrategy loggingIn: aLogger budget: aBudget [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ self
		  for: (self testCasesFrom: testClasses)
		  mutating: classes
		  using: operatorCollection
		  with: anEvaluationStrategy
		  with: aGenerationStrategy
		  loggingIn: aLogger
		  budget: aBudget
]

{ #category : 'instance creation' }
MyMTAnalysis class >> testCasesReferencesFrom: testClass [

	self deprecated:
		'This method will be removed in the next version of MuTalk.
		To create an instance of `MutationTestingAnalysis`, please refer to `MutationTestingAnalysisBuilder` instead.'.
	^ testClass allTestSelectors collect: [ :each |
		  MyMTTestCaseReference for: each in: testClass ]
]

{ #category : 'accessing' }
MyMTAnalysis >> budget [

	^ budget
]

{ #category : 'accessing' }
MyMTAnalysis >> budget: anObject [

	budget := anObject
]

{ #category : 'accessing' }
MyMTAnalysis >> classesToMutate: anObject [

	modelClasses := anObject
]

{ #category : 'accessing' }
MyMTAnalysis >> coverageAnalysisResult [

	^ coverageAnalysisResult
]

{ #category : 'accessing' }
MyMTAnalysis >> coverageAnalysisResult: anObject [

	coverageAnalysisResult := anObject
]

{ #category : 'accessing - defaults' }
MyMTAnalysis >> defaultBudget [

	^ MyMTFreeBudget new
]

{ #category : 'defaults' }
MyMTAnalysis >> defaultLogger [

	^ MyMTNullAnalysisLogger new
]

{ #category : 'accessing - defaults' }
MyMTAnalysis >> defaultMutantSelectionStrategy [

	^ MyMTAllMutantSelectionStrategy new
]

{ #category : 'accessing - defaults' }
MyMTAnalysis >> defaultOperators [

	^ MyMTMutantOperator contents
]

{ #category : 'accessing - defaults' }
MyMTAnalysis >> defaultTestFilter [

	^ MyMTFreeTestFilter new
]

{ #category : 'accessing - defaults' }
MyMTAnalysis >> defaultTestSelectionStrategy [

	^ MyMTAllTestsMethodsRunningTestSelectionStrategy new
]

{ #category : 'accessing' }
MyMTAnalysis >> doNotStopOnErrorOrFail [

	stopOnErrorOrFail := false
]

{ #category : 'results' }
MyMTAnalysis >> generalResult [

	^ MyMTGeneralResult for: mutantResults timed: elapsedTime
]

{ #category : 'running' }
MyMTAnalysis >> generateCoverageAnalysis [

	coverageAnalysisResult := (MyMTCoverageAnalysis
		                           for: self modelClasses
		                           running: testCases)
		                          run;
		                          result
]

{ #category : 'running' }
MyMTAnalysis >> generateMutations [

	^ mutations ifNil: [
		  mutations := mutantSelectionStrategy
			               mutationsFor: self
			               loggingIn: logger ]
]

{ #category : 'running' }
MyMTAnalysis >> generateResults [

	| tests |
	mutantResults := OrderedCollection new.
	tests := testFilter filterTests: testCases.

	mutations do: [ :aMutation |
		(budget exceedsBudgetOn: mutantResults fromTotalMutations: mutations)
			ifTrue: [ ^ mutantResults ].
		logger logStartEvaluating: aMutation.
		mutantResults add: ((MyMTMutantEvaluation
				  for: aMutation
				  using: tests
				  following: testSelectionStrategy
				  andConsidering: self coverageAnalysisResult)
				 valueStoppingOnError: stopOnErrorOrFail) ].
	^ mutantResults
]

{ #category : 'running' }
MyMTAnalysis >> initialTestRun [
	"Do an initial run of the tests to check that they are all green.
	Only green tests count for the mutation testing analysis"

	testCases do: [ :aTestCase | aTestCase runChecked ]
]

{ #category : 'initialization' }
MyMTAnalysis >> initialize [

	super initialize.
	operators := self defaultOperators.
	mutantSelectionStrategy := self defaultMutantSelectionStrategy.
	testSelectionStrategy := self defaultTestSelectionStrategy.
	mutantResults := OrderedCollection new.
	elapsedTime := 0.
	logger := self defaultLogger.
	budget := self defaultBudget.
	testFilter := self defaultTestFilter.
	stopOnErrorOrFail := true
]

{ #category : 'accessing' }
MyMTAnalysis >> logger [

	^ logger
]

{ #category : 'accessing' }
MyMTAnalysis >> logger: anObject [

	logger := anObject
]

{ #category : 'accessing' }
MyMTAnalysis >> modelClasses [
	"Filter tests and testsResources"

	^ modelClasses reject: [ :class |
		  self testBaseClasses anySatisfy: [ :classToFilter |
			  class includesBehavior: classToFilter ] ]
]

{ #category : 'results' }
MyMTAnalysis >> mutantResults [

	^ mutantResults
]

{ #category : 'accessing' }
MyMTAnalysis >> mutantSelectionStrategy [

	^ mutantSelectionStrategy
]

{ #category : 'accessing' }
MyMTAnalysis >> mutantSelectionStrategy: anObject [

	mutantSelectionStrategy := anObject
]

{ #category : 'accessing' }
MyMTAnalysis >> mutations [

	^ mutations
]

{ #category : 'accessing' }
MyMTAnalysis >> mutations: anObject [

	mutations := anObject
]

{ #category : 'accessing' }
MyMTAnalysis >> operators [

	^ operators
]

{ #category : 'accessing' }
MyMTAnalysis >> operators: anObject [

	operators := anObject
]

{ #category : 'running' }
MyMTAnalysis >> run [
	"Obtain mutants applying the operators in the classes (or
	methods of
	those classes) and execute all mutants in the set of testClases.
	We obtain a result for each mutant generated"

	^ [
	  budget start.
	  self initialTestRun.
	  logger logAnalysisStartFor: self.
	  elapsedTime := [
	                 self generateCoverageAnalysis.
	                 self generateMutations.
	                 self generateResults ] timeToRun.
	  true ]
		  on: MyMTTestsWithErrorsException
		  do: [ :ex |
			  self inform:
				  'Your tests have Errors or Failures. Please correct them.'.
			  ex return: false ]
]

{ #category : 'accessing' }
MyMTAnalysis >> stopOnErrorOrFail: aBoolean [

	stopOnErrorOrFail := aBoolean
]

{ #category : 'accessing' }
MyMTAnalysis >> testBaseClasses [

	^ OrderedCollection with: TestCase with: TestResource
]

{ #category : 'accessing' }
MyMTAnalysis >> testCases [

	^ testCases
]

{ #category : 'accessing' }
MyMTAnalysis >> testCases: anObject [

	testCases := anObject
]

{ #category : 'accessing' }
MyMTAnalysis >> testCasesFrom: aClassCollection [

	^ aClassCollection
		  inject: OrderedCollection new
		  into: [ :testCase :testClass |
			  testClass isAbstract ifFalse: [
				  testCase addAll: (self testCasesReferencesFrom: testClass) ].
			  testCase ]
]

{ #category : 'tests' }
MyMTAnalysis >> testCasesReferencesFrom: testClass [

	^ testClass allTestSelectors collect: [ :each |
		  MyMTTestCaseReference for: each in: testClass ]
]

{ #category : 'accessing' }
MyMTAnalysis >> testClasses: aClassCollection [

	testCases := self testCasesFrom: aClassCollection
]

{ #category : 'accessing' }
MyMTAnalysis >> testFilter [

	^ testFilter
]

{ #category : 'accessing' }
MyMTAnalysis >> testFilter: anObject [

	testFilter := anObject
]

{ #category : 'accessing' }
MyMTAnalysis >> testSelectionStrategy [

	^ testSelectionStrategy
]

{ #category : 'accessing' }
MyMTAnalysis >> testSelectionStrategy: anObject [

	testSelectionStrategy := anObject
]
