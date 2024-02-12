Class {
	#name : 'MyMTReplaceIfFalseReceiverWithFalseOperator',
	#superclass : 'MyMTReplaceIfFalseReceiverOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'applying' }
MyMTReplaceIfFalseReceiverWithFalseOperator >> newReceiverExpression [
	^'false'
]

{ #category : 'suggestions' }
MyMTReplaceIfFalseReceiverWithFalseOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceIfFalseReceiverWithFalseOperator: aMutation.
]
