Class {
	#name : 'MyMTReplaceAndWithOrMutantOperator',
	#superclass : 'MyMTSelectorReplacementMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceAndWithOrMutantOperator >> newSelector [
	^#or:
]

{ #category : 'accessing' }
MyMTReplaceAndWithOrMutantOperator >> oldSelector [
	^#and:
]

{ #category : 'suggestions' }
MyMTReplaceAndWithOrMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [ 
	^ aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceAndWithOrMutantOperator: aMutation
]
