Class {
	#name : 'MyMTReplaceAndWithEqvMutantOperator',
	#superclass : 'MyMTSelectorReplacementMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceAndWithEqvMutantOperator >> newSelector [
	^#bEqv:
]

{ #category : 'accessing' }
MyMTReplaceAndWithEqvMutantOperator >> oldSelector [
	^#and:
]

{ #category : 'suggestions' }
MyMTReplaceAndWithEqvMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [ 
	^ aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceAndWithEqvMutantOperator: aMutation
]
