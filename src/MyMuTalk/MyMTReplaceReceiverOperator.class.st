Class {
	#name : 'MyMTReplaceReceiverOperator',
	#superclass : 'MyMTMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'testing' }
MyMTReplaceReceiverOperator class >> isAbstract [

	^ self == MyMTReplaceReceiverOperator
]

{ #category : 'printing' }
MyMTReplaceReceiverOperator >> description [
	^'Replace ', self selector printString,' receiver with ', self newReceiverExpression.
]

{ #category : 'applying' }
MyMTReplaceReceiverOperator >> expressionToReplace [ 
	^'``@receiver', ' ', self messageSendExpression.
]

{ #category : 'applying' }
MyMTReplaceReceiverOperator >> messageSendExpression [
	| numberOfArgument |
	numberOfArgument := 0.
	^ self selector keywords
		inject: ''
		into: [:expression :keyword | 
			numberOfArgument := numberOfArgument + 1.
			expression , keyword , ' ``@arg' , numberOfArgument asString , ' ']
]

{ #category : 'applying' }
MyMTReplaceReceiverOperator >> newExpression [
	^self newReceiverExpression, ' ', self messageSendExpression.
]

{ #category : 'applying' }
MyMTReplaceReceiverOperator >> newReceiverExpression [
	self subclassResponsibility
]

{ #category : 'applying' }
MyMTReplaceReceiverOperator >> selector [
	self subclassResponsibility
]
