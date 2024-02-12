Class {
	#name : 'MyMTAuxiliarClassForMTAnalysis',
	#superclass : 'Object',
	#category : 'MyMuTalk-TestResources',
	#package : 'MyMuTalk-TestResources'
}

{ #category : 'auxiliar' }
MyMTAuxiliarClassForMTAnalysis class >> classMethodThatSendsSelect [
	|collection|
	collection := OrderedCollection with: 1.
	^collection 
		select: [:item | item = 1]
]

{ #category : 'auxiliar' }
MyMTAuxiliarClassForMTAnalysis >> anotherMethodWithOneIfFalseSender [
	false ifFalse: [^1].
	^2
]

{ #category : 'auxiliar' }
MyMTAuxiliarClassForMTAnalysis >> methodWithOneIfFalseSender [
	true ifFalse: [^1].
	^2
]

{ #category : 'auxiliar' }
MyMTAuxiliarClassForMTAnalysis >> methodWithOneIfTrueSender [
	true ifTrue: [ ^ 1 ].
	^ 2
]

{ #category : 'auxiliar' }
MyMTAuxiliarClassForMTAnalysis >> methodWithOnePlusSender [
	^ 1 + 2
]

{ #category : 'auxiliar' }
MyMTAuxiliarClassForMTAnalysis >> methodWithTwoMinusSenders [
	^ 1 - 2 - 3
]
