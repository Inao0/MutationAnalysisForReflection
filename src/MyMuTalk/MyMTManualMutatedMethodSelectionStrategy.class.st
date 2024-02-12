Class {
	#name : 'MyMTManualMutatedMethodSelectionStrategy',
	#superclass : 'MyMTMutantSelectionStrategy',
	#instVars : [
		'targetMethods'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'generating' }
MyMTManualMutatedMethodSelectionStrategy >> methodsToMutateFrom: aMutationTestingAnalysis [

	^ targetMethods 
]

{ #category : 'accessing' }
MyMTManualMutatedMethodSelectionStrategy >> targetMethods: anObject [

	targetMethods := anObject
]
