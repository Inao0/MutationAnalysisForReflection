Class {
	#name : 'MyMTMutationScoreTest',
	#superclass : 'TestCase',
	#instVars : [
		'resource'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTMutationScoreTest >> mutationResultAcceptable [

	^ MyMTGeneralResult for: (OrderedCollection with:
			   resource evaluationResultForKilledMutantByError)
]

{ #category : 'accessing' }
MyMTMutationScoreTest >> mutationResultAlmostAcceptable [

	^ MyMTGeneralResult for: (OrderedCollection
			   with: resource evaluationResultForKilledMutantByError
			   with: resource evaluationResultForAliveMutant)
]

{ #category : 'accessing' }
MyMTMutationScoreTest >> mutationResultNonAcceptable [

	^ MyMTGeneralResult for:
		  (OrderedCollection with: resource evaluationResultForAliveMutant)
]

{ #category : 'running' }
MyMTMutationScoreTest >> setUp [

	super setUp.
	resource := MyMTResource current
]

{ #category : 'testing' }
MyMTMutationScoreTest >> testMutationScoreAcceptable [
	|score|
	score := (MyMTMutationAcceptableScore scoreFor: self mutationResultAcceptable).
	self assert: score isAcceptableScore.
	self deny: score isNonAcceptableScore.
	self deny: score isAlmostAcceptableScore.
]

{ #category : 'testing' }
MyMTMutationScoreTest >> testMutationScoreAlmostAcceptable [
	|score|
	score := (MyMTMutationAlmostAcceptableScore scoreFor: self mutationResultAlmostAcceptable).
	self deny: score isAcceptableScore.
	self deny: score isNonAcceptableScore.
	self assert: score isAlmostAcceptableScore.
]

{ #category : 'testing' }
MyMTMutationScoreTest >> testMutationScoreColor [

	| score |
	score := MyMTMutationScoreBehavior buildFor:
		         self mutationResultAcceptable.
	self assert: score color equals: Color green.

	score := MyMTMutationScoreBehavior buildFor:
		         self mutationResultNonAcceptable.
	self assert: score color equals: Color red.

	score := MyMTMutationScoreBehavior buildFor:
		         self mutationResultAlmostAcceptable.
	self assert: score color equals: Color yellow
]

{ #category : 'testing' }
MyMTMutationScoreTest >> testMutationScoreCreation [

	| score |
	score := MyMTMutationScoreBehavior buildFor:
		         self mutationResultAcceptable.
	self assert: score isAcceptableScore.
	score := MyMTMutationScoreBehavior buildFor:
		         self mutationResultAlmostAcceptable.
	self assert: score isAlmostAcceptableScore.
	score := MyMTMutationScoreBehavior buildFor:
		         self mutationResultNonAcceptable.
	self assert: score isNonAcceptableScore
]

{ #category : 'testing' }
MyMTMutationScoreTest >> testMutationScoreNonAcceptable [
	|score|
	score := (MyMTMutationNonAcceptableScore scoreFor: self mutationResultNonAcceptable).
	self deny: score isAcceptableScore.
	self assert: score isNonAcceptableScore.
	self deny: score isAlmostAcceptableScore.
]
