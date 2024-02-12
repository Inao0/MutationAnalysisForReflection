Class {
	#name : 'MyMTReplaceIfFalseReceiverOperator',
	#superclass : 'MyMTReplaceReceiverOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'testing' }
MyMTReplaceIfFalseReceiverOperator class >> isAbstract [

	^ self == MyMTReplaceIfFalseReceiverOperator
]

{ #category : 'applying' }
MyMTReplaceIfFalseReceiverOperator >> selector [
	^#ifFalse:
]
