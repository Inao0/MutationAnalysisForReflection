Class {
	#name : 'MyMTReplaceIfTrueIfFalseReceiverWithTrueOperator',
	#superclass : 'MyMTReplaceIfTrueIfFalseReceiverOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'applying' }
MyMTReplaceIfTrueIfFalseReceiverWithTrueOperator >> newReceiverExpression [ 
	^'true'
]

{ #category : 'suggestions' }
MyMTReplaceIfTrueIfFalseReceiverWithTrueOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceIfTrueIfFalseReceiverWithTrueOperator: aMutation.
]
