"
A LiteralIntegersIncreaseOperatorTest is a test class for testing the behavior of LiteralIntegersIncreaseOperator
"
Class {
	#name : 'MyMTLiteralIntegersIncreaseOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTLiteralIntegersIncreaseOperatorTest >> methodWithNoSenders [

	^ Dictionary new at: #hello put: 'Hi'
]

{ #category : 'accessing' }
MyMTLiteralIntegersIncreaseOperatorTest >> methodWithOneSender [

	^ Dictionary new at: 1 ifAbsent: [ self error: 'hi' ]
]

{ #category : 'accessing' }
MyMTLiteralIntegersIncreaseOperatorTest >> methodWithOneSenderModified [

	^ Dictionary new at: 2 ifAbsent: [ self error: 'hi' ]
]

{ #category : 'accessing' }
MyMTLiteralIntegersIncreaseOperatorTest >> methodWithTwoSenders [

	^ 1 >= 2
]

{ #category : 'accessing' }
MyMTLiteralIntegersIncreaseOperatorTest >> methodWithTwoSendersModifiedFirst [

	^ 2 >= 2
]

{ #category : 'accessing' }
MyMTLiteralIntegersIncreaseOperatorTest >> methodWithTwoSendersModifiedSecond [

	^ 1 >= 3
]

{ #category : 'accessing' }
MyMTLiteralIntegersIncreaseOperatorTest >> operator [

	^ MyMTLiteralIntegersIncreaseOperator new
]
