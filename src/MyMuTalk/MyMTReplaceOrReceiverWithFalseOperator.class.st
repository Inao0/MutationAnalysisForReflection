Class {
	#name : 'MyMTReplaceOrReceiverWithFalseOperator',
	#superclass : 'MyMTReplaceOrReceiverOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'applying' }
MyMTReplaceOrReceiverWithFalseOperator >> newReceiverExpression [ 
	^'false'
]

{ #category : 'applying' }
MyMTReplaceOrReceiverWithFalseOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceOrReceiverWithFalseOperator: aMutation.
]
