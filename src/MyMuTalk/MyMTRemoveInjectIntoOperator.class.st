Class {
	#name : 'MyMTRemoveInjectIntoOperator',
	#superclass : 'MyMTMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'printing' }
MyMTRemoveInjectIntoOperator >> description [
	^'Replace inject:aValue into:aBlock with aValue'.
]

{ #category : 'applying' }
MyMTRemoveInjectIntoOperator >> expressionToReplace [ 
	^'``@aCollection inject: ``@aValue into:``@aBlock'
]

{ #category : 'applying' }
MyMTRemoveInjectIntoOperator >> newExpression [
	^'``@aValue'
]
