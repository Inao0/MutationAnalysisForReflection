Class {
	#name : 'MyMTMutationScoreBehavior',
	#superclass : 'Object',
	#instVars : [
		'generalResult'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'instance creation' }
MyMTMutationScoreBehavior class >> buildFor: aMutationGeneralResult [
	|handler|
	handler := self allSubclasses detect: [:class | class canHandle: aMutationGeneralResult] ifNone: [].
	^handler scoreFor: aMutationGeneralResult
	
]

{ #category : 'instance creation' }
MyMTMutationScoreBehavior class >> scoreFor: aMutationGeneralResult [

	^(self new) initializeFor: aMutationGeneralResult; yourself
	
]

{ #category : 'accessing' }
MyMTMutationScoreBehavior >> generalResult [

	^ generalResult
]

{ #category : 'initialization' }
MyMTMutationScoreBehavior >> initializeFor: aMutationGeneralResult [
	generalResult := aMutationGeneralResult.
]
