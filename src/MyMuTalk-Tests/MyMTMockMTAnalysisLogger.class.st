Class {
	#name : 'MyMTMockMTAnalysisLogger',
	#superclass : 'MyMTAnalysisLogger',
	#instVars : [
		'loggedStartAnalysis',
		'loggedStartBuildingMutations',
		'loggedEvaluationMutations'
	],
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'instance creation' }
MyMTMockMTAnalysisLogger class >> new [
	^super new initialize.
]

{ #category : 'initialization' }
MyMTMockMTAnalysisLogger >> initialize [ 
	loggedStartAnalysis := false.
	loggedStartBuildingMutations := OrderedCollection new.
	loggedEvaluationMutations := OrderedCollection new.
]

{ #category : 'logging' }
MyMTMockMTAnalysisLogger >> logAnalysisStartFor: aMutationTestingAnalysis [ 
	loggedStartAnalysis := true.
]

{ #category : 'logging' }
MyMTMockMTAnalysisLogger >> logStartBuildingMutantionsFor: aCompiledMethod using: aMutantOperator [
	loggedStartBuildingMutations add:(Array with:aCompiledMethod with: aMutantOperator ). 

	
]

{ #category : 'logging' }
MyMTMockMTAnalysisLogger >> logStartEvaluating: aMethodMutation [ 
	loggedEvaluationMutations add: aMethodMutation.
]

{ #category : 'testing' }
MyMTMockMTAnalysisLogger >> loggedStartAnalysis [
	^loggedStartAnalysis
]

{ #category : 'testing' }
MyMTMockMTAnalysisLogger >> loggedStartBuildingMutationsFor: aCompiledMethod using: aMutantOperator [
	^loggedStartBuildingMutations anySatisfy:[:array | (array at:1 ) = aCompiledMethod and:[(array at:2) = aMutantOperator ]]  
	
]

{ #category : 'testing' }
MyMTMockMTAnalysisLogger >> loggedStartMutantEvaluationForMutationOf: aCompiledMethod [ 
	^ loggedEvaluationMutations
		anySatisfy: [:aMutation | aMutation originalMethod = aCompiledMethod]
]
