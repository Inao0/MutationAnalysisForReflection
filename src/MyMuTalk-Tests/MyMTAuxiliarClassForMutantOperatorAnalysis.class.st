Class {
	#name : 'MyMTAuxiliarClassForMutantOperatorAnalysis',
	#superclass : 'Object',
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
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
