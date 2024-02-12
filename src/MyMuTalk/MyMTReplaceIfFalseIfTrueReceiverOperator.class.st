Class {
	#name : 'MyMTReplaceIfFalseIfTrueReceiverOperator',
	#superclass : 'MyMTReplaceReceiverOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'testing' }
MyMTReplaceIfFalseIfTrueReceiverOperator class >> isAbstract [

	^ self == MyMTReplaceIfFalseIfTrueReceiverOperator
]

{ #category : 'applying' }
MyMTReplaceIfFalseIfTrueReceiverOperator >> selector [
	^#ifFalse:IfTrue:
]
