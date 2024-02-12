Class {
	#name : 'MyMTMutationAlmostAcceptableScore',
	#superclass : 'MyMTMutationScoreBehavior',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'instance creation' }
MyMTMutationAlmostAcceptableScore class >> canHandle: aMutationTestingGeneralResult [
	| score |
	score := aMutationTestingGeneralResult mutationScore.
	^ score between: 50 and: 80
]

{ #category : 'accessing' }
MyMTMutationAlmostAcceptableScore >> color [
	^Color yellow
]

{ #category : 'testing' }
MyMTMutationAlmostAcceptableScore >> isAcceptableScore [
	^false
]

{ #category : 'testing' }
MyMTMutationAlmostAcceptableScore >> isAlmostAcceptableScore [
	^true
]

{ #category : 'testing' }
MyMTMutationAlmostAcceptableScore >> isNonAcceptableScore [
	^false
]
