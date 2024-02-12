Class {
	#name : 'MyMTReplaceLessOrEqualWithLessMutantOperator',
	#superclass : 'MyMTSelectorReplacementMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceLessOrEqualWithLessMutantOperator >> newSelector [
	^#<
]

{ #category : 'accessing' }
MyMTReplaceLessOrEqualWithLessMutantOperator >> oldSelector [
	^#<=
]

{ #category : 'suggestions' }
MyMTReplaceLessOrEqualWithLessMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [ 
	^ aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceLessOrEqualWithLessMutantOperator: aMutation
]
