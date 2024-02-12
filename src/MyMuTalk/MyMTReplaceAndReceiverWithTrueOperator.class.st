Class {
	#name : 'MyMTReplaceAndReceiverWithTrueOperator',
	#superclass : 'MyMTReplaceAndReceiverOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'applying' }
MyMTReplaceAndReceiverWithTrueOperator >> newReceiverExpression [ 
	^'true'
]

{ #category : 'applying' }
MyMTReplaceAndReceiverWithTrueOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [ 
	^ aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceAndReceiverWithTrueMutantOperator: aMutation
]
