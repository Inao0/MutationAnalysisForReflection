Class {
	#name : 'MyMTReplaceIfFalseReceiverWithFalseOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceIfFalseReceiverWithFalseOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^ true ifTrue:[1] ifFalse:[2].
]

{ #category : 'accessing' }
MyMTReplaceIfFalseReceiverWithFalseOperatorTest >> methodWithOneSender [  
	(1 = 2) ifFalse: [^true]. 
	 ^false
]

{ #category : 'accessing' }
MyMTReplaceIfFalseReceiverWithFalseOperatorTest >> methodWithOneSenderModified [
	false ifFalse: [^true]. 
	 ^false
]

{ #category : 'accessing' }
MyMTReplaceIfFalseReceiverWithFalseOperatorTest >> methodWithTwoSenders [
	(1 = 1) ifFalse: [^true].
	(1 = 2) ifFalse: [^true].
	^false
]

{ #category : 'accessing' }
MyMTReplaceIfFalseReceiverWithFalseOperatorTest >> methodWithTwoSendersModifiedFirst [
	false ifFalse: [^true].
	(1 = 2) ifFalse: [^true].
	^false
]

{ #category : 'accessing' }
MyMTReplaceIfFalseReceiverWithFalseOperatorTest >> methodWithTwoSendersModifiedSecond [
	(1 = 1) ifFalse: [^true].
	false ifFalse: [^true].
	^false
]

{ #category : 'accessing' }
MyMTReplaceIfFalseReceiverWithFalseOperatorTest >> operator [
	^ MyMTReplaceIfFalseReceiverWithFalseOperator new
]
