Class {
	#name : 'MyMTAnalysisLogger',
	#superclass : 'Object',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'logging' }
MyMTAnalysisLogger >> logAnalysisStartFor: aMutationTestingAnalysis [ 
	self subclassResponsibility 
]

{ #category : 'logging' }
MyMTAnalysisLogger >> logStartBuildingMutantionsFor: aCompiledMethod using: aMutantOperator [
	self subclassResponsibility 
]

{ #category : 'logging' }
MyMTAnalysisLogger >> logStartEvaluating: aMethodMutation [ 
	self subclassResponsibility
]
