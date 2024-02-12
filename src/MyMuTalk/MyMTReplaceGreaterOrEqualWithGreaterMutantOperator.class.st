Class {
	#name : 'MyMTReplaceGreaterOrEqualWithGreaterMutantOperator',
	#superclass : 'MyMTSelectorReplacementMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceGreaterOrEqualWithGreaterMutantOperator >> newSelector [
	^#>
]

{ #category : 'accessing' }
MyMTReplaceGreaterOrEqualWithGreaterMutantOperator >> oldSelector [
	^#>=
]

{ #category : 'suggestions' }
MyMTReplaceGreaterOrEqualWithGreaterMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [ 
	^ aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceGreaterOrEqualWithGreaterMutantOperator: aMutation
]
