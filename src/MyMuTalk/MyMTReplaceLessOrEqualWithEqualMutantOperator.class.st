Class {
	#name : 'MyMTReplaceLessOrEqualWithEqualMutantOperator',
	#superclass : 'MyMTSelectorReplacementMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceLessOrEqualWithEqualMutantOperator >> newSelector [ 
	^#=
]

{ #category : 'accessing' }
MyMTReplaceLessOrEqualWithEqualMutantOperator >> oldSelector [
	^#<=
]

{ #category : 'suggestions' }
MyMTReplaceLessOrEqualWithEqualMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [ 
	^ aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceLessOrEqualWithEqualMutantOperator: aMutation
]
