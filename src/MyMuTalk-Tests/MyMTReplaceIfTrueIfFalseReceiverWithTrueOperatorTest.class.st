Class {
	#name : 'MyMTReplaceIfTrueIfFalseReceiverWithTrueOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'accessing' }
MyMTReplaceIfTrueIfFalseReceiverWithTrueOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^ true ifTrue:[1].
]

{ #category : 'accessing' }
MyMTReplaceIfTrueIfFalseReceiverWithTrueOperatorTest >> methodWithOneSender [
	1 = 2
		ifTrue: [^ 1]
		ifFalse: [^ 8]
]

{ #category : 'accessing' }
MyMTReplaceIfTrueIfFalseReceiverWithTrueOperatorTest >> methodWithOneSenderModified [
	true
		ifTrue: [^ 1]
		ifFalse: [^ 8]
]

{ #category : 'accessing' }
MyMTReplaceIfTrueIfFalseReceiverWithTrueOperatorTest >> methodWithTwoSenders [
	|a|
	a := (1 = 1) ifTrue: [1] ifFalse:[8].
	^(1 = 2) ifTrue: [a + 1] ifFalse: [a + 8].
	
]

{ #category : 'accessing' }
MyMTReplaceIfTrueIfFalseReceiverWithTrueOperatorTest >> methodWithTwoSendersModifiedFirst [
	|a|
	a := true ifTrue: [1] ifFalse:[8].
	^(1 = 2) ifTrue: [a + 1] ifFalse: [a + 8].
]

{ #category : 'accessing' }
MyMTReplaceIfTrueIfFalseReceiverWithTrueOperatorTest >> methodWithTwoSendersModifiedSecond [
	|a|
	a := (1 = 1) ifTrue: [1] ifFalse:[8].
	^true ifTrue: [a + 1] ifFalse: [a + 8].
]

{ #category : 'accessing' }
MyMTReplaceIfTrueIfFalseReceiverWithTrueOperatorTest >> operator [
	^ MyMTReplaceIfTrueIfFalseReceiverWithTrueOperator new
]
