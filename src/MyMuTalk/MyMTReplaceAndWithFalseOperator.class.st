Class {
	#name : 'MyMTReplaceAndWithFalseOperator',
	#superclass : 'MyMTMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'printing' }
MyMTReplaceAndWithFalseOperator >> description [
	^'Replace #and: with false'.
]

{ #category : 'applying' }
MyMTReplaceAndWithFalseOperator >> expressionToReplace [ 
	^'``@object and: ``@aBlock'
]

{ #category : 'applying' }
MyMTReplaceAndWithFalseOperator >> newExpression [ 
	^'false'
]

{ #category : 'suggestions' }
MyMTReplaceAndWithFalseOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceAndWithFalseOperator: aMutation.
]
