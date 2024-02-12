Class {
	#name : 'MyMTReplaceIfTrueReceiverWithFalseOperator',
	#superclass : 'MyMTReplaceIfTrueReceiverOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'applying' }
MyMTReplaceIfTrueReceiverWithFalseOperator >> newReceiverExpression [
	^'false'
]

{ #category : 'suggestions' }
MyMTReplaceIfTrueReceiverWithFalseOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceIfTrueReceiverWithFalseOperator: aMutation.
]
