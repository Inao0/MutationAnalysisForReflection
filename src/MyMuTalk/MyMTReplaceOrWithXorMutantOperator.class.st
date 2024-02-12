Class {
	#name : 'MyMTReplaceOrWithXorMutantOperator',
	#superclass : 'MyMTSelectorReplacementMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceOrWithXorMutantOperator >> newSelector [
	^#bXor:
]

{ #category : 'accessing' }
MyMTReplaceOrWithXorMutantOperator >> oldSelector [
	^#or:
]

{ #category : 'suggestions' }
MyMTReplaceOrWithXorMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [ 
	^ aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceOrWithXorMutantOperator: aMutation
]
