Class {
	#name : 'MyMTReplaceAndReceiverWithTrueOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceAndReceiverWithTrueOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^ true ifTrue:[1].
]

{ #category : 'accessing' }
MyMTReplaceAndReceiverWithTrueOperatorTest >> methodWithOneSender [
	^1 = 2
		and: [2 = 2]
]

{ #category : 'accessing' }
MyMTReplaceAndReceiverWithTrueOperatorTest >> methodWithOneSenderModified [
	^true
		and: [2 = 2]
]

{ #category : 'accessing' }
MyMTReplaceAndReceiverWithTrueOperatorTest >> methodWithTwoSenders [
	^1 = 2
		and: [2 = 2 and: [3 = 3]]
	
]

{ #category : 'accessing' }
MyMTReplaceAndReceiverWithTrueOperatorTest >> methodWithTwoSendersModifiedFirst [
	^true
		and: [2 = 2 and: [3 = 3]]
]

{ #category : 'accessing' }
MyMTReplaceAndReceiverWithTrueOperatorTest >> methodWithTwoSendersModifiedSecond [
	^1 = 2
		and: [true and: [3 = 3]]
]

{ #category : 'accessing' }
MyMTReplaceAndReceiverWithTrueOperatorTest >> operator [
	^ MyMTReplaceAndReceiverWithTrueOperator new
]
