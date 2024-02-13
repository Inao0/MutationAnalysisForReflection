Class {
	#name : 'MyMTReplaceIfFalseReceiverWithTrueOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'accessing' }
MyMTReplaceIfFalseReceiverWithTrueOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^ true ifTrue:[1] ifFalse:[2].
]

{ #category : 'accessing' }
MyMTReplaceIfFalseReceiverWithTrueOperatorTest >> methodWithOneSender [  
	(1 = 2) ifFalse: [^true]. 
	 ^false
]

{ #category : 'accessing' }
MyMTReplaceIfFalseReceiverWithTrueOperatorTest >> methodWithOneSenderModified [
	true ifFalse: [^true]. 
	 ^false
]

{ #category : 'accessing' }
MyMTReplaceIfFalseReceiverWithTrueOperatorTest >> methodWithTwoSenders [
	(1 = 1) ifFalse: [^true].
	(1 = 2) ifFalse: [^true].
	^false
]

{ #category : 'accessing' }
MyMTReplaceIfFalseReceiverWithTrueOperatorTest >> methodWithTwoSendersModifiedFirst [
	true ifFalse: [^true].
	(1 = 2) ifFalse: [^true].
	^false
]

{ #category : 'accessing' }
MyMTReplaceIfFalseReceiverWithTrueOperatorTest >> methodWithTwoSendersModifiedSecond [
	(1 = 1) ifFalse: [^true].
	true ifFalse: [^true].
	^false
]

{ #category : 'accessing' }
MyMTReplaceIfFalseReceiverWithTrueOperatorTest >> operator [
	^ MyMTReplaceIfFalseReceiverWithTrueOperator new
]
