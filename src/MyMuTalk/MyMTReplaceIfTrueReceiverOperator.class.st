Class {
	#name : 'MyMTReplaceIfTrueReceiverOperator',
	#superclass : 'MyMTReplaceReceiverOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'testing' }
MyMTReplaceIfTrueReceiverOperator class >> isAbstract [

	^ self == MyMTReplaceIfTrueReceiverOperator
]

{ #category : 'applying' }
MyMTReplaceIfTrueReceiverOperator >> selector [
	^#ifTrue:
]
