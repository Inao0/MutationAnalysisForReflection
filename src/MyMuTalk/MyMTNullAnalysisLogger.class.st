Class {
	#name : 'MyMTNullAnalysisLogger',
	#superclass : 'MyMTAnalysisLogger',
	#classInstVars : [
		'instance'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'instance creation' }
MyMTNullAnalysisLogger class >> new [
	instance ifNil:[instance := super new.].
	^instance.
]

{ #category : 'logging' }
MyMTNullAnalysisLogger >> logAnalysisStartFor: aMutationTestingAnalysis [ 
]

{ #category : 'logging' }
MyMTNullAnalysisLogger >> logStartBuildingMutantionsFor: aCompiledMethod using: aMutantOperator [
]

{ #category : 'logging' }
MyMTNullAnalysisLogger >> logStartEvaluating: aMethodMutation [ 
]
