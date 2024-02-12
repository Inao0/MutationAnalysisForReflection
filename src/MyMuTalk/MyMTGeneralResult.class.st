Class {
	#name : 'MyMTGeneralResult',
	#superclass : 'Object',
	#instVars : [
		'particularResults',
		'elapsedTime'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'instance creation' }
MyMTGeneralResult class >> empty [
	^ self for: OrderedCollection new
]

{ #category : 'instance creation' }
MyMTGeneralResult class >> for: mutantsEvaluationsResults [ 
	^self for: mutantsEvaluationsResults timed: Duration new
]

{ #category : 'instance creation' }
MyMTGeneralResult class >> for: mutantsEvaluationsResults timed: anElapsedTime [ 
	^ self new initializeFor: mutantsEvaluationsResults timed: anElapsedTime;
		 yourself
]

{ #category : 'accessing' }
MyMTGeneralResult >> aliveMutants [
	^ particularResults select: [ :evaluationResult | evaluationResult survived ]
]

{ #category : 'testing' }
MyMTGeneralResult >> elapsedTime [
	^ elapsedTime
]

{ #category : 'initialize' }
MyMTGeneralResult >> initializeFor: mutantsEvaluationsResults timed: anElapsedTime [
	particularResults := mutantsEvaluationsResults.
	elapsedTime := anElapsedTime
]

{ #category : 'testing' }
MyMTGeneralResult >> isAcceptableScore [
	^ self mutationScore > 80
]

{ #category : 'testing' }
MyMTGeneralResult >> isNonAcceptableScore [
	^ self mutationScore < 50
]

{ #category : 'accessing' }
MyMTGeneralResult >> killedMutants [
	^ particularResults select: [ :evaluationResult | evaluationResult killed ]
]

{ #category : 'accessing' }
MyMTGeneralResult >> killedOrTerminatedMutants [
	^ particularResults select: [ :evaluationResult | evaluationResult killed or: [ evaluationResult terminated ] ]
]

{ #category : 'details' }
MyMTGeneralResult >> mutationScore [
	"Returns the mutation Score of this general result. A mutation score is the
	killedOrTerminatedMutants / numberOfEvaluatedMutants"
	self numberOfEvaluatedMutants = 0 ifTrue: [ ^ 0 ].
	^ (self numberOfKilledOrTerminatedMutants * 100 / self numberOfEvaluatedMutants) asInteger
]

{ #category : 'details' }
MyMTGeneralResult >> mutationScoreModel [

	^ MyMTMutationScoreBehavior buildFor: self
]

{ #category : 'details' }
MyMTGeneralResult >> numberOfAliveMutants [
	"Returns the number of survived Mutants of this result"
	^ self aliveMutants size
]

{ #category : 'details' }
MyMTGeneralResult >> numberOfEvaluatedMutants [
	"Returns the number of Mutants Evaluated"
	^ particularResults size
]

{ #category : 'details' }
MyMTGeneralResult >> numberOfKilledMutants [
	"Returns the number of killed Mutants of this result"
	^ self killedMutants size
]

{ #category : 'details' }
MyMTGeneralResult >> numberOfKilledOrTerminatedMutants [
	"Returns the number of killed or terminated Mutants of this result"
	^ self killedOrTerminatedMutants size
]

{ #category : 'details' }
MyMTGeneralResult >> numberOfTerminatedMutants [
	"Returns the number of Mutants terminated"
	^ self terminatedMutants size
]

{ #category : 'accessing' }
MyMTGeneralResult >> particularResults [

	^ particularResults
]

{ #category : 'printing' }
MyMTGeneralResult >> printDetailedInfoOn: aStream [ 
	
	(particularResults 
		groupBy:  [:result | result mutant operator]
		having: [:g | true]) 
			keysAndValuesDo: [:key :value | 
				aStream nextPutAll: key description.
				aStream nextPutAll: ' - '.
				aStream nextPutAll: value size printString; cr.
			]
]

{ #category : 'printing' }
MyMTGeneralResult >> printOn: aStream [ 
	aStream
		nextPutAll: self numberOfEvaluatedMutants printString;
		nextPutAll: ' mutants, ';
		nextPutAll: self numberOfKilledMutants printString;
		nextPutAll: ' killed, ';
		nextPutAll: self numberOfAliveMutants printString;
		nextPutAll: ' alive, ';
		nextPutAll: self numberOfTerminatedMutants printString;
		nextPutAll: ' terminated. Mutation Score: ';
		nextPutAll: self mutationScore printString;
		nextPutAll: '%.'
]

{ #category : 'accessing' }
MyMTGeneralResult >> terminatedMutants [
	^ particularResults select: [ :evaluationResult | evaluationResult terminated ]
]
