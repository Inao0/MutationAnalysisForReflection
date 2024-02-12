Class {
	#name : 'MyMTReplaceOrWithAndMutantOperator',
	#superclass : 'MyMTSelectorReplacementMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceOrWithAndMutantOperator >> newSelector [
	^#and:
]

{ #category : 'accessing' }
MyMTReplaceOrWithAndMutantOperator >> oldSelector [
	^#or:
]

{ #category : 'suggestions' }
MyMTReplaceOrWithAndMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [ 
	^ aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceOrWithAndMutantOperator: aMutation
]
