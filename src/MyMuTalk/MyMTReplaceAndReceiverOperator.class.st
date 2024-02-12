Class {
	#name : 'MyMTReplaceAndReceiverOperator',
	#superclass : 'MyMTReplaceReceiverOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'testing' }
MyMTReplaceAndReceiverOperator class >> isAbstract [

	^ self == MyMTReplaceAndReceiverOperator
]

{ #category : 'applying' }
MyMTReplaceAndReceiverOperator >> selector [
	^#and:
]
