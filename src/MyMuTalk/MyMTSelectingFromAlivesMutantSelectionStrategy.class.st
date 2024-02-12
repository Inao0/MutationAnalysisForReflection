Class {
	#name : 'MyMTSelectingFromAlivesMutantSelectionStrategy',
	#superclass : 'MyMTMutantSelectionStrategy',
	#instVars : [
		'analysis'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTSelectingFromAlivesMutantSelectionStrategy >> analysis: anObject [

	analysis := anObject
]

{ #category : 'generating' }
MyMTSelectingFromAlivesMutantSelectionStrategy >> methodsToMutateFrom: aMutationTestingAnalysis [

	^ (analysis generalResult aliveMutants collect: [ :alive | 
		   alive mutant originalMethod ]) asSet 
]
