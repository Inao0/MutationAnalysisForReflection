Class {
	#name : 'MyMTReplaceOrReceiverOperator',
	#superclass : 'MyMTReplaceReceiverOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'testing' }
MyMTReplaceOrReceiverOperator class >> isAbstract [

	^ self == MyMTReplaceOrReceiverOperator
]

{ #category : 'applying' }
MyMTReplaceOrReceiverOperator >> selector [
	^#or:
]
