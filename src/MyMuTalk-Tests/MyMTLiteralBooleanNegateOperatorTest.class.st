Class {
	#name : 'MyMTLiteralBooleanNegateOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'accessing' }
MyMTLiteralBooleanNegateOperatorTest >> methodWithNoSenders [

	^ Dictionary new at: #hello put: 'Hi'
]

{ #category : 'accessing' }
MyMTLiteralBooleanNegateOperatorTest >> methodWithOneSender [

	^ Dictionary new at: 1 ifAbsent: [ self error: true ]
]

{ #category : 'accessing' }
MyMTLiteralBooleanNegateOperatorTest >> methodWithOneSenderModified [

	^ Dictionary new at: 1 ifAbsent: [ self error: false ]
]

{ #category : 'accessing' }
MyMTLiteralBooleanNegateOperatorTest >> methodWithTwoSenders [

	^ true & false
]

{ #category : 'accessing' }
MyMTLiteralBooleanNegateOperatorTest >> methodWithTwoSendersModifiedFirst [

	^ false & false
]

{ #category : 'accessing' }
MyMTLiteralBooleanNegateOperatorTest >> methodWithTwoSendersModifiedSecond [

	^ true & true
]

{ #category : 'accessing' }
MyMTLiteralBooleanNegateOperatorTest >> operator [

	^ MyMTLiteralBooleanNegateOperator new
]
