Class {
	#name : 'MyMTReplaceOrReceiverWithFalseOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceOrReceiverWithFalseOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^ true ifTrue:[1].
]

{ #category : 'accessing' }
MyMTReplaceOrReceiverWithFalseOperatorTest >> methodWithOneSender [
	^1 = 2
		or: [2 = 2]
]

{ #category : 'accessing' }
MyMTReplaceOrReceiverWithFalseOperatorTest >> methodWithOneSenderModified [
	^false
		or: [2 = 2]
]

{ #category : 'accessing' }
MyMTReplaceOrReceiverWithFalseOperatorTest >> methodWithTwoSenders [
	^1 = 2
		or: [2 = 2 or: [3 = 3]]
	
]

{ #category : 'accessing' }
MyMTReplaceOrReceiverWithFalseOperatorTest >> methodWithTwoSendersModifiedFirst [
	^false
		or: [2 = 2 or: [3 = 3]]
]

{ #category : 'accessing' }
MyMTReplaceOrReceiverWithFalseOperatorTest >> methodWithTwoSendersModifiedSecond [
	^1 = 2
		or: [false or: [3 = 3]]
]

{ #category : 'accessing' }
MyMTReplaceOrReceiverWithFalseOperatorTest >> operator [
	^ MyMTReplaceOrReceiverWithFalseOperator new
]
