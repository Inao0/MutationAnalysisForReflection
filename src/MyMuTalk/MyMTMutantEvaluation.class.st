Class {
	#name : 'MyMTMutantEvaluation',
	#superclass : 'Object',
	#instVars : [
		'mutation',
		'strategy',
		'testCases',
		'coverageAnalysisResult'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'instance creation' }
MyMTMutantEvaluation class >> for: aMutation using:aCollectionOftestCases following: aMutantEvaluationStrategy [ 
	^self for: aMutation using: aCollectionOftestCases following: aMutantEvaluationStrategy andConsidering:nil  
]

{ #category : 'instance creation' }
MyMTMutantEvaluation class >> for: aMutation using: aCollectionOftestCases following: aMutantEvaluationStrategy and: aTestSelectionStrategy [ 
	|tests|
	tests := aTestSelectionStrategy testCasesFromReferencies: aCollectionOftestCases.
	^self for: aMutation using: tests following: aMutantEvaluationStrategy andConsidering:nil
]

{ #category : 'instance creation' }
MyMTMutantEvaluation class >> for: aMutation using:aCollectionOftestCases following: aMutantEvaluationStrategy andConsidering: aCoverageAnalysisResult [ 
	^self new initializeFor: aMutation using:aCollectionOftestCases following: aMutantEvaluationStrategy andConsidering: aCoverageAnalysisResult
]

{ #category : 'accessing' }
MyMTMutantEvaluation >> coverageAnalysisResult [

	^coverageAnalysisResult 
]

{ #category : 'initialize-release' }
MyMTMutantEvaluation >> initializeCoverageResultIfNil [
	coverageAnalysisResult 
		ifNil:[ |coverageAnalysis|
				coverageAnalysis := MyMTCoverageAnalysis for: (OrderedCollection with: mutation originalClass)
															 running: testCases. 
				coverageAnalysisResult := coverageAnalysis run;result].
]

{ #category : 'initialize-release' }
MyMTMutantEvaluation >> initializeFor: aMutation using:aCollectionOftestCases following: aMutantEvaluationStrategy andConsidering: aCoverageAnalysisResult [
	mutation := aMutation.
	testCases := aCollectionOftestCases.
	strategy := aMutantEvaluationStrategy.
	coverageAnalysisResult := aCoverageAnalysisResult	
]

{ #category : 'private' }
MyMTMutantEvaluation >> runTests [

	^ mutation runMutant
]

{ #category : 'accessing' }
MyMTMutantEvaluation >> strategy [
	^strategy
]

{ #category : 'accessing' }
MyMTMutantEvaluation >> testCases [
	^testCases
]

{ #category : 'private' }
MyMTMutantEvaluation >> testResults [ 

	^ [ self runTests ] valueWithin: (strategy timeoutForTestsOf: self) milliSeconds onTimeout: [ nil ]
]

{ #category : 'evaluation' }
MyMTMutantEvaluation >> valueStoppingOnError: aBoolean [

	| testResults |
	self initializeCoverageResultIfNil.

	mutation testCaseReferences:
		(strategy testCasesToEvaluate: mutation for: self).
	testResults := mutation runMutantStoppingOnError: aBoolean.
	^ MyMTMutantEvaluationResult
		  for: mutation
		  results: testResults
		  producedBy: self
]
