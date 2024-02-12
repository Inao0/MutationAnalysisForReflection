Class {
	#name : 'MyMTAuxiliarClassForMutantOperatorAnalysis',
	#superclass : 'Object',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'auxiliar' }
MyMTAuxiliarClassForMutantOperatorAnalysis >> methodA [

	| result |
	result := 1 + 1.
	^ result
]

{ #category : 'auxiliar' }
MyMTAuxiliarClassForMutantOperatorAnalysis >> methodB [

	false ifFalse: [ ^ 1 ]
]
