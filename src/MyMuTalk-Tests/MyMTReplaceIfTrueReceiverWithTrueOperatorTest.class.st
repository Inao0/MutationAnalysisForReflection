Class {
	#name : 'MyMTReplaceIfTrueReceiverWithTrueOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'accessing' }
MyMTReplaceIfTrueReceiverWithTrueOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^ true ifTrue:[1] ifFalse:[2].
]

{ #category : 'accessing' }
MyMTReplaceIfTrueReceiverWithTrueOperatorTest >> methodWithOneSender [  
	(1 = 2) ifTrue: [^true]. 
	 ^false
]

{ #category : 'accessing' }
MyMTReplaceIfTrueReceiverWithTrueOperatorTest >> methodWithOneSenderModified [
	true ifTrue: [^true]. 
	 ^false
]

{ #category : 'accessing' }
MyMTReplaceIfTrueReceiverWithTrueOperatorTest >> methodWithTwoSenders [
	(1 = 1) ifTrue: [^true].
	(1 = 2) ifTrue: [^true].
	^false
]

{ #category : 'accessing' }
MyMTReplaceIfTrueReceiverWithTrueOperatorTest >> methodWithTwoSendersModifiedFirst [
	true ifTrue: [^true].
	(1 = 2) ifTrue: [^true].
	^false
]

{ #category : 'accessing' }
MyMTReplaceIfTrueReceiverWithTrueOperatorTest >> methodWithTwoSendersModifiedSecond [
	(1 = 1) ifTrue: [^true].
	true ifTrue: [^true].
	^false
]

{ #category : 'accessing' }
MyMTReplaceIfTrueReceiverWithTrueOperatorTest >> operator [
	^ MyMTReplaceIfTrueReceiverWithTrueOperator new
]
