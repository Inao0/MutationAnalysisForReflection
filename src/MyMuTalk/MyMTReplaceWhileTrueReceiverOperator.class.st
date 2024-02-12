Class {
	#name : 'MyMTReplaceWhileTrueReceiverOperator',
	#superclass : 'MyMTReplaceReceiverOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'testing' }
MyMTReplaceWhileTrueReceiverOperator class >> isAbstract [

	^ self == MyMTReplaceWhileTrueReceiverOperator
]

{ #category : 'applying' }
MyMTReplaceWhileTrueReceiverOperator >> selector [

	^ #whileTrue:
]
