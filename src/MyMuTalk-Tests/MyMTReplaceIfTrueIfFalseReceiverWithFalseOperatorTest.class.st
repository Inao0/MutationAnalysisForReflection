Class {
	#name : 'MyMTReplaceIfTrueIfFalseReceiverWithFalseOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'accessing' }
MyMTReplaceIfTrueIfFalseReceiverWithFalseOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^ true ifTrue:[1].
]

{ #category : 'accessing' }
MyMTReplaceIfTrueIfFalseReceiverWithFalseOperatorTest >> methodWithOneSender [
	1 = 2
		ifTrue: [^ 1]
		ifFalse: [^ 8]
]

{ #category : 'accessing' }
MyMTReplaceIfTrueIfFalseReceiverWithFalseOperatorTest >> methodWithOneSenderModified [
	false
		ifTrue: [^ 1]
		ifFalse: [^ 8]
]

{ #category : 'accessing' }
MyMTReplaceIfTrueIfFalseReceiverWithFalseOperatorTest >> methodWithTwoSenders [
	|a|
	a := (1 = 1) ifTrue: [1] ifFalse:[8].
	^(1 = 2) ifTrue: [a + 1] ifFalse: [a + 8].
	
]

{ #category : 'accessing' }
MyMTReplaceIfTrueIfFalseReceiverWithFalseOperatorTest >> methodWithTwoSendersModifiedFirst [
	|a|
	a := false ifTrue: [1] ifFalse:[8].
	^(1 = 2) ifTrue: [a + 1] ifFalse: [a + 8].
]

{ #category : 'accessing' }
MyMTReplaceIfTrueIfFalseReceiverWithFalseOperatorTest >> methodWithTwoSendersModifiedSecond [
	|a|
	a := (1 = 1) ifTrue: [1] ifFalse:[8].
	^false ifTrue: [a + 1] ifFalse: [a + 8].
]

{ #category : 'accessing' }
MyMTReplaceIfTrueIfFalseReceiverWithFalseOperatorTest >> operator [
	^ MyMTReplaceIfTrueIfFalseReceiverWithFalseOperator new
]
