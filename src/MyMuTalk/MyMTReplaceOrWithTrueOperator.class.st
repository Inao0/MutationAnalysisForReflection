Class {
	#name : 'MyMTReplaceOrWithTrueOperator',
	#superclass : 'MyMTMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'printing' }
MyMTReplaceOrWithTrueOperator >> description [
	^'Replace #or: with true'.
]

{ #category : 'applying' }
MyMTReplaceOrWithTrueOperator >> expressionToReplace [ 
	^'``@object or: ``@aBlock'
]

{ #category : 'applying' }
MyMTReplaceOrWithTrueOperator >> newExpression [ 
	^'true'
]

{ #category : 'suggestions' }
MyMTReplaceOrWithTrueOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceOrWithTrueOperator: aMutation.
]
