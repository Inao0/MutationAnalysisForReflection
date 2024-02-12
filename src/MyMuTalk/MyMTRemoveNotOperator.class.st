Class {
	#name : 'MyMTRemoveNotOperator',
	#superclass : 'MyMTMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'printing' }
MyMTRemoveNotOperator >> description [
	^'Remove #not'.
]

{ #category : 'applying' }
MyMTRemoveNotOperator >> expressionToReplace [ 
	^'``@aBoolean not'
]

{ #category : 'applying' }
MyMTRemoveNotOperator >> newExpression [
	^'``@aBoolean'
]
