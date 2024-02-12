Class {
	#name : 'MyMTRemoveExceptionHandlerOperator',
	#superclass : 'MyMTMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'printing' }
MyMTRemoveExceptionHandlerOperator >> description [
	^'Remove Exception Handler Operator'
]

{ #category : 'applying' }
MyMTRemoveExceptionHandlerOperator >> expressionToReplace [ 
	^'``@aBlock on: ``@anException do: ``@anotherBlock'

]

{ #category : 'applying' }
MyMTRemoveExceptionHandlerOperator >> newExpression [ 
	^'``@aBlock value'

]

{ #category : 'suggestions' }
MyMTRemoveExceptionHandlerOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByARemoveExceptionHandlerOperator: aMutation.
]
