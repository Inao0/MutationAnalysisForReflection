Class {
	#name : 'MyMTMutationAcceptableScore',
	#superclass : 'MyMTMutationScoreBehavior',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'instance creation' }
MyMTMutationAcceptableScore class >> canHandle: aMutationTestingGeneralResult [ 
	^aMutationTestingGeneralResult mutationScore > 80
]

{ #category : 'accessing' }
MyMTMutationAcceptableScore >> color [
	 ^ Color green 
]

{ #category : 'testing' }
MyMTMutationAcceptableScore >> isAcceptableScore [
	^true
]

{ #category : 'testing' }
MyMTMutationAcceptableScore >> isAlmostAcceptableScore [
	^false
]

{ #category : 'testing' }
MyMTMutationAcceptableScore >> isNonAcceptableScore [
	^false
]
