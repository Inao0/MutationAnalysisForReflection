Class {
	#name : 'MyMTMutationNonAcceptableScore',
	#superclass : 'MyMTMutationScoreBehavior',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'instance creation' }
MyMTMutationNonAcceptableScore class >> canHandle: aMutationTestingGeneralResult [ 
	^aMutationTestingGeneralResult mutationScore < 50
]

{ #category : 'accessing' }
MyMTMutationNonAcceptableScore >> color [
	^Color red
]

{ #category : 'testing' }
MyMTMutationNonAcceptableScore >> isAcceptableScore [
	^false
]

{ #category : 'testing' }
MyMTMutationNonAcceptableScore >> isAlmostAcceptableScore [
	^false
]

{ #category : 'testing' }
MyMTMutationNonAcceptableScore >> isNonAcceptableScore [
	^true
]
