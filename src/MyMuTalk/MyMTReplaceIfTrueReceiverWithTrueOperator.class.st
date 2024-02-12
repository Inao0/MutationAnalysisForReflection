Class {
	#name : 'MyMTReplaceIfTrueReceiverWithTrueOperator',
	#superclass : 'MyMTReplaceIfTrueReceiverOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'applying' }
MyMTReplaceIfTrueReceiverWithTrueOperator >> newReceiverExpression [
	^'true'
]

{ #category : 'suggestions' }
MyMTReplaceIfTrueReceiverWithTrueOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceIfTrueReceiverWithTrueOperator: aMutation.
]
