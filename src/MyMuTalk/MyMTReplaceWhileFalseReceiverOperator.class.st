Class {
	#name : 'MyMTReplaceWhileFalseReceiverOperator',
	#superclass : 'MyMTReplaceReceiverOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'testing' }
MyMTReplaceWhileFalseReceiverOperator class >> isAbstract [

	^ self == MyMTReplaceWhileFalseReceiverOperator
]

{ #category : 'applying' }
MyMTReplaceWhileFalseReceiverOperator >> selector [

	^ #whileFalse:
]
