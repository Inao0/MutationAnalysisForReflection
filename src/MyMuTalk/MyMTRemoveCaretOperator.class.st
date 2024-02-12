Class {
	#name : 'MyMTRemoveCaretOperator',
	#superclass : 'MyMTMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'printing' }
MyMTRemoveCaretOperator >> description [
	^'Remove ^'
]

{ #category : 'applying' }
MyMTRemoveCaretOperator >> expressionToReplace [ 
	^'^``@object'

]

{ #category : 'applying' }
MyMTRemoveCaretOperator >> newExpression [ 
	^'``@object'

]

{ #category : 'suggestions' }
MyMTRemoveCaretOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByARemoveCaretOperator: aMutation.
]

{ #category : 'applying' }
MyMTRemoveCaretOperator >> timesToApplyIn: aCompiledMethod with: aParseTree [ 

	"ignore methods that contain only ^self"
	(aParseTree statements asArray = { RBParseTreeSearcher treeMatching: '^ self' in: aParseTree })
		ifTrue: [ ^ 0 ].
	
	^ super timesToApplyIn: aCompiledMethod with: aParseTree 
]
