Class {
	#name : 'MyMTReplaceIfTrueIfFalseReceiverOperator',
	#superclass : 'MyMTReplaceReceiverOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'testing' }
MyMTReplaceIfTrueIfFalseReceiverOperator class >> isAbstract [

	^ self == MyMTReplaceIfTrueIfFalseReceiverOperator
]

{ #category : 'applying' }
MyMTReplaceIfTrueIfFalseReceiverOperator >> selector [
	^#ifTrue:ifFalse:
]
