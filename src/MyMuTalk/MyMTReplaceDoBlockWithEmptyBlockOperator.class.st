Class {
	#name : 'MyMTReplaceDoBlockWithEmptyBlockOperator',
	#superclass : 'MyMTMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'printing' }
MyMTReplaceDoBlockWithEmptyBlockOperator >> description [
	^'Replace do block with [:each |]'.
]

{ #category : 'applying' }
MyMTReplaceDoBlockWithEmptyBlockOperator >> expressionToReplace [ 
	^'``@collection do: ``@aBlock'
]

{ #category : 'applying' }
MyMTReplaceDoBlockWithEmptyBlockOperator >> newExpression [
	^'``@collection do: [:each | ]'
]

{ #category : 'suggestions' }
MyMTReplaceDoBlockWithEmptyBlockOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByADoBlockWithEmptyBlockOperator: aMutation.
]
