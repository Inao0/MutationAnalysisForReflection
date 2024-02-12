Class {
	#name : 'MyMTReplaceAndArgumentWithTrueOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceAndArgumentWithTrueOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^ true ifTrue:[false].
]

{ #category : 'accessing' }
MyMTReplaceAndArgumentWithTrueOperatorTest >> methodWithOneSender [
	^1 = 2
		and: [2 = 2]
]

{ #category : 'accessing' }
MyMTReplaceAndArgumentWithTrueOperatorTest >> methodWithOneSenderModified [
	^1=2
		and: [true]
]

{ #category : 'accessing' }
MyMTReplaceAndArgumentWithTrueOperatorTest >> methodWithTwoSenders [
	^1 = 2
		and: [2 = 2 and: [3 = 3]]
	
]

{ #category : 'accessing' }
MyMTReplaceAndArgumentWithTrueOperatorTest >> methodWithTwoSendersModifiedFirst [
	^1=2
		and: [true]
]

{ #category : 'accessing' }
MyMTReplaceAndArgumentWithTrueOperatorTest >> methodWithTwoSendersModifiedSecond [
	^1 = 2
		and: [2 = 2 and: [true]]
]

{ #category : 'accessing' }
MyMTReplaceAndArgumentWithTrueOperatorTest >> operator [
	^ MyMTReplaceAndArgumentWithTrueOperator new.
]
