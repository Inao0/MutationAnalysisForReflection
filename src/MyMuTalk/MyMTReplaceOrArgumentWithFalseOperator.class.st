Class {
	#name : 'MyMTReplaceOrArgumentWithFalseOperator',
	#superclass : 'MyMTMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'printing' }
MyMTReplaceOrArgumentWithFalseOperator >> description [
	^'Replace #or: argument with [false]'
]

{ #category : 'applying' }
MyMTReplaceOrArgumentWithFalseOperator >> expressionToReplace [ 
	^'``@object or: ``@aBlock'
]

{ #category : 'applying' }
MyMTReplaceOrArgumentWithFalseOperator >> newExpression [
	^'``@object or: [false]'
]

{ #category : 'suggestions' }
MyMTReplaceOrArgumentWithFalseOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceOrArgumentWithFalseOperator: aMutation.
]
