Class {
	#name : 'MyMTReplaceLessOrEqualWithTrueOperator',
	#superclass : 'MyMTMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'printing' }
MyMTReplaceLessOrEqualWithTrueOperator >> description [
	^'Replace #''<='' with true'
]

{ #category : 'applying' }
MyMTReplaceLessOrEqualWithTrueOperator >> expressionToReplace [ 
	^'``@object <= ``@aBlock'
]

{ #category : 'applying' }
MyMTReplaceLessOrEqualWithTrueOperator >> newExpression [ 
	^'true'
]

{ #category : 'applying' }
MyMTReplaceLessOrEqualWithTrueOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceLessOrEqualWithTrueOperator: aMutation.
]
