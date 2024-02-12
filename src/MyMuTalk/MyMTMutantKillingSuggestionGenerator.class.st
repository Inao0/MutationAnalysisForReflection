Class {
	#name : 'MyMTMutantKillingSuggestionGenerator',
	#superclass : 'Object',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'evaluating' }
MyMTMutantKillingSuggestionGenerator >> suggestionFor: aMutation [
	^aMutation operator suggestionFor: aMutation using: self.
]

{ #category : 'suggestions' }
MyMTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByADoBlockWithEmptyBlockOperator: aMutation [ 
		^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll:  'It is missing a test case to check that there is an iteration doing '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' on each element of '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.]
]

{ #category : 'suggestions' }
MyMTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByARemoveCaretOperator: aMutation [ 
	^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case to check that the method is returning '.
		aStream nextPutAll: aMutation mutatedNode formattedCode asText allBold ]
]

{ #category : 'suggestions' }
MyMTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByARemoveExceptionHandlerOperator: aMutation [ 
		^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll:  'It is missing a test case to check that when an exception of kind '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' is signaled, it is handled evaluating the block '.
		aStream nextPutAll: aMutation nodeToMutate arguments second formattedCode asText allBold.]
]

{ #category : 'suggestions' }
MyMTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceAndArgumentWithTrueOperator: aMutation [ 
	^Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' is true and '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' is false' ]
]

{ #category : 'suggestions' }
MyMTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceAndReceiverWithTrueMutantOperator: aMutation [
	^Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' is false and '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' is true' ]
]

{ #category : 'suggestions' }
MyMTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceAndWithEqvMutantOperator: aMutation [ 
	^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where both conditions '.
		aStream nextPutAll: aMutation mutatedNode receiver formattedCode asText allBold.
		aStream nextPutAll: ' and '.
		aStream nextPutAll: aMutation mutatedNode arguments first formattedCode asText allBold.
		aStream nextPutAll: ' are false.' ]
]

{ #category : 'suggestions' }
MyMTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceAndWithFalseOperator: aMutation [ 
	^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where both conditions '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' and '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' are true.' ]
]

{ #category : 'suggestions' }
MyMTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceAndWithOrMutantOperator: aMutation [ 
	^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where only one of the conditions '.
		aStream nextPutAll: aMutation mutatedNode receiver formattedCode asText allBold.
		aStream nextPutAll: ' and '.
		aStream nextPutAll: aMutation mutatedNode arguments first formattedCode asText allBold.
		aStream nextPutAll: ' is True.' ]
]

{ #category : 'suggestions' }
MyMTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceGreaterOrEqualWithEqualMutantOperator: aMutation [ 
	^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' is greater than '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold. ]
]

{ #category : 'suggestions' }
MyMTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceGreaterOrEqualWithGreaterMutantOperator: aMutation [ 
	^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' is equal to '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold. ]
]

{ #category : 'suggestions' }
MyMTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceIfFalseReceiverWithFalseOperator: aMutation [ 
		^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll:  'It is missing a test case to check that when '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' is true, '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' is not evaluated'.]
]

{ #category : 'suggestions' }
MyMTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceIfFalseReceiverWithTrueOperator: aMutation [ 
		^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll:  'It is missing a test case to check that when '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' is false, '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' is evaluated'.]
]

{ #category : 'suggestions' }
MyMTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceIfTrueIfFalseReceiverWithFalseOperator: aMutation [ 
		^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll:  'It is missing a test case to check that when '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' is true, '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' is evaluated and '.
		aStream nextPutAll: aMutation nodeToMutate arguments second formattedCode asText allBold.
		aStream nextPutAll: ' is not']
]

{ #category : 'suggestions' }
MyMTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceIfTrueIfFalseReceiverWithTrueOperator: aMutation [ 
		^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll:  'It is missing a test case to check that when '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' is false, '.
		aStream nextPutAll: aMutation nodeToMutate arguments second formattedCode asText allBold.
		aStream nextPutAll: ' is evaluated and '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' is not']
]

{ #category : 'suggestions' }
MyMTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceIfTrueReceiverWithFalseOperator: aMutation [ 
		^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll:  'It is missing a test case to check that when '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' is true, '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' is evaluated'.]
]

{ #category : 'suggestions' }
MyMTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceIfTrueReceiverWithTrueOperator: aMutation [ 
		^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll:  'It is missing a test case to check that when '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' is false, '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' is not evaluated'.]
]

{ #category : 'suggestions' }
MyMTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceLessOrEqualWithEqualMutantOperator: aMutation [ 
	^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' is less than '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold. ]
]

{ #category : 'suggestions' }
MyMTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceLessOrEqualWithLessMutantOperator: aMutation [ 
	^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' is equal to '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold. ]
]

{ #category : 'suggestions' }
MyMTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceLessOrEqualWithTrueOperator: aMutation [ 
	^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' is greater than '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold. ]
]

{ #category : 'suggestions' }
MyMTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceOrArgumentWithFalseOperator: aMutation [ 
	^Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' is false and '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' is true' ]
]

{ #category : 'suggestions' }
MyMTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceOrReceiverWithFalseOperator: aMutation [ 
	^Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' is true and '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' is false' ]
]

{ #category : 'suggestions' }
MyMTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceOrWithAndMutantOperator: aMutation [ 
	^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where only one of the conditions '.
		aStream nextPutAll: aMutation mutatedNode receiver formattedCode asText allBold.
		aStream nextPutAll: ' and '.
		aStream nextPutAll: aMutation mutatedNode arguments first formattedCode asText allBold.
		aStream nextPutAll: ' is True.' ]
]

{ #category : 'suggestions' }
MyMTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceOrWithTrueOperator: aMutation [ 
		^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where both conditions '.
		aStream nextPutAll: aMutation nodeToMutate receiver formattedCode asText allBold.
		aStream nextPutAll: ' and '.
		aStream nextPutAll: aMutation nodeToMutate arguments first formattedCode asText allBold.
		aStream nextPutAll: ' are false.' ]
]

{ #category : 'suggestions' }
MyMTMutantKillingSuggestionGenerator >> suggestionForMutationProducedByAReplaceOrWithXorMutantOperator: aMutation [ 
	^ Text streamContents: 
		[ :aStream | 
		aStream nextPutAll: 'It is missing a test case where both conditions '.
		aStream nextPutAll: aMutation mutatedNode receiver formattedCode asText allBold.
		aStream nextPutAll: ' and '.
		aStream nextPutAll: aMutation mutatedNode arguments first formattedCode asText allBold.
		aStream nextPutAll: ' are true.' ]
]
