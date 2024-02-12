Class {
	#name : 'MyMTReplaceGreaterOrEqualWithEqualMutantOperator',
	#superclass : 'MyMTSelectorReplacementMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceGreaterOrEqualWithEqualMutantOperator >> newSelector [
	^#=
]

{ #category : 'accessing' }
MyMTReplaceGreaterOrEqualWithEqualMutantOperator >> oldSelector [
	^#>=
]

{ #category : 'suggestions' }
MyMTReplaceGreaterOrEqualWithEqualMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [ 
	^ aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceGreaterOrEqualWithEqualMutantOperator: aMutation
]
