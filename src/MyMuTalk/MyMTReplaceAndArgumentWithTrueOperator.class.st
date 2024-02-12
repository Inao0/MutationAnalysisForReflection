Class {
	#name : 'MyMTReplaceAndArgumentWithTrueOperator',
	#superclass : 'MyMTMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'printing' }
MyMTReplaceAndArgumentWithTrueOperator >> description [
	^'Replace #and: argument with [true]'.
]

{ #category : 'applying' }
MyMTReplaceAndArgumentWithTrueOperator >> expressionToReplace [ 
	^'``@object and: ``@aBlock'
]

{ #category : 'applying' }
MyMTReplaceAndArgumentWithTrueOperator >> newExpression [ 
	^'``@object and: [true]'
]

{ #category : 'suggestions' }
MyMTReplaceAndArgumentWithTrueOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceAndArgumentWithTrueOperator: aMutation.
]
