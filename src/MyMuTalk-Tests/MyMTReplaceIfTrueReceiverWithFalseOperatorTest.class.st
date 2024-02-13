Class {
	#name : 'MyMTReplaceIfTrueReceiverWithFalseOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'accessing' }
MyMTReplaceIfTrueReceiverWithFalseOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^ true ifTrue:[1] ifFalse:[2].
]

{ #category : 'accessing' }
MyMTReplaceIfTrueReceiverWithFalseOperatorTest >> methodWithOneSender [  
	(1 = 2) ifTrue: [^true]. 
	 ^false
]

{ #category : 'accessing' }
MyMTReplaceIfTrueReceiverWithFalseOperatorTest >> methodWithOneSenderModified [
	false ifTrue: [^true]. 
	 ^false
]

{ #category : 'accessing' }
MyMTReplaceIfTrueReceiverWithFalseOperatorTest >> methodWithTwoSenders [
	(1 = 1) ifTrue: [^true].
	(1 = 2) ifTrue: [^true].
	^false
]

{ #category : 'accessing' }
MyMTReplaceIfTrueReceiverWithFalseOperatorTest >> methodWithTwoSendersModifiedFirst [
	false ifTrue: [^true].
	(1 = 2) ifTrue: [^true].
	^false
]

{ #category : 'accessing' }
MyMTReplaceIfTrueReceiverWithFalseOperatorTest >> methodWithTwoSendersModifiedSecond [
	(1 = 1) ifTrue: [^true].
	false ifTrue: [^true].
	^false
]

{ #category : 'accessing' }
MyMTReplaceIfTrueReceiverWithFalseOperatorTest >> operator [
	^ MyMTReplaceIfTrueReceiverWithFalseOperator new
]
