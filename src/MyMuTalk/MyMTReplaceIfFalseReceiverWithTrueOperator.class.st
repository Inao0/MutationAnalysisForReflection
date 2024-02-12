Class {
	#name : 'MyMTReplaceIfFalseReceiverWithTrueOperator',
	#superclass : 'MyMTReplaceIfFalseReceiverOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'applying' }
MyMTReplaceIfFalseReceiverWithTrueOperator >> newReceiverExpression [
	^'true'
]

{ #category : 'suggestions' }
MyMTReplaceIfFalseReceiverWithTrueOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceIfFalseReceiverWithTrueOperator: aMutation.
]
