Class {
	#name : 'MyMTRemoveAtIfAbsentOperator',
	#superclass : 'MyMTMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'printing' }
MyMTRemoveAtIfAbsentOperator >> description [
	^'Remove at:ifAbsent:'
]

{ #category : 'applying' }
MyMTRemoveAtIfAbsentOperator >> expressionToReplace [
	^ '``@object at: ``@aBlock ifAbsent: ``@anotherBlock'
]

{ #category : 'applying' }
MyMTRemoveAtIfAbsentOperator >> newExpression [
	^ '``@anotherBlock value'
]
