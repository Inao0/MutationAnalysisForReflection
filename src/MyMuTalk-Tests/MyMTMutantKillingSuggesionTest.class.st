Class {
	#name : 'MyMTMutantKillingSuggesionTest',
	#superclass : 'TestCase',
	#instVars : [
		'resource'
	],
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'accessing' }
MyMTMutantKillingSuggesionTest class >> resources [
	^ {MyMTResource}
]

{ #category : 'accessing' }
MyMTMutantKillingSuggesionTest >> killedMutant [

	^resource evaluationResultForKilledMutantByError
]

{ #category : 'accessing' }
MyMTMutantKillingSuggesionTest >> methodToTestSuggestionToKillRAO [

	^2 = (1 + 1) and: [ Set new isEmpty ].

]

{ #category : 'accessing' }
MyMTMutantKillingSuggesionTest >> methodToTestSuggestionToKillRAOWithAssignments [
	|firstCondition secondCondition|
	firstCondition := 2 = (1 + 1).
	secondCondition := Set new isEmpty.
	^firstCondition and: [secondCondition ]
]

{ #category : 'accessing' }
MyMTMutantKillingSuggesionTest >> methodToTestSuggestionToKillRCOWithAssignments [
	|aValue anotherValue|
	aValue := 1.
	anotherValue :=2.
	^aValue + anotherValue.

]

{ #category : 'accessing' }
MyMTMutantKillingSuggesionTest >> methodToTestSuggestionToKillROA [

	^2 = (1 + 1) or: [ Set new isEmpty ].

]

{ #category : 'accessing' }
MyMTMutantKillingSuggesionTest >> methodToTestSuggestionToKillROAWithAssignments [
	|firstCondition secondCondition|
	firstCondition := 2 = (1 + 1).
	secondCondition := Set new isEmpty.
	^firstCondition or: [secondCondition ]
]

{ #category : 'accessing' }
MyMTMutantKillingSuggesionTest >> methodToTestSuggestionToKillRemoveExceptionHandler [

	[1/0] on:Exception do:[:ex | Transcript show:'error'].
]

{ #category : 'accessing' }
MyMTMutantKillingSuggesionTest >> methodToTestSuggestionToKillReplaceDoBlockWithEmptyBlock [
	OrderedCollection new do: [:each | Transcript show: each]
]

{ #category : 'accessing' }
MyMTMutantKillingSuggesionTest >> methodToTestSuggestionToKillReplaceIfFalseReceiver [
	^ 1 = 1 ifFalse: [ 8 ]
]

{ #category : 'accessing' }
MyMTMutantKillingSuggesionTest >> methodToTestSuggestionToKillReplaceIfTrueIfFalseReceiver [
	^ 1 = 1
		ifTrue: [1]
		ifFalse: [8]
]

{ #category : 'accessing' }
MyMTMutantKillingSuggesionTest >> methodToTestSuggestionToKillReplaceIfTrueReceiver [
	^ 1 = 1 ifTrue: [ 8 ]
]

{ #category : 'running' }
MyMTMutantKillingSuggesionTest >> setUp [

	super setUp.
	resource := MyMTResource current
]

{ #category : 'accessing' }
MyMTMutantKillingSuggesionTest >> survivedMutant [

	^resource evaluationResultForAliveMutant
]

{ #category : 'accessing' }
MyMTMutantKillingSuggesionTest >> terminatedMutant [

	^resource evaluationResultForTerminatedMutant
]

{ #category : 'testing-results' }
MyMTMutantKillingSuggesionTest >> testSuggestionForKilledMutant [

	self assert: self killedMutant killingSuggestions = 'MUTANT KILLED'
]

{ #category : 'testing-results' }
MyMTMutantKillingSuggesionTest >> testSuggestionForSurvivedMutant [

	self
		assert: self survivedMutant killingSuggestions
		equals: (MyMTMutantKillingSuggestionGenerator new suggestionFor:
				 self survivedMutant mutant)
]

{ #category : 'testing-results' }
MyMTMutantKillingSuggesionTest >> testSuggestionForTerminatedMutant [

	self assert: self terminatedMutant killingSuggestions = 'MUTANT KILLED'
]

{ #category : 'testing-operators' }
MyMTMutantKillingSuggesionTest >> testSuggestionToKillRemoveCaret [

	| operator mutation |
	operator := MyMTRemoveCaretOperator new.
	mutation := (operator mutationsFor:
		             self class
		             >> #methodToTestSuggestionToKillRCOWithAssignments)
		            first.
	self
		assert:
		(MyMTMutantKillingSuggestionGenerator new suggestionFor: mutation)
		equals:
		'It is missing a test case to check that the method is returning aValue + anotherValue'
]

{ #category : 'testing' }
MyMTMutantKillingSuggesionTest >> testSuggestionToKillRemoveExceptionHandler [

	| operator mutation |
	operator := MyMTRemoveExceptionHandlerOperator new.
	mutation := (operator mutationsFor:
		             self class
		             >> #methodToTestSuggestionToKillRemoveExceptionHandler)
		            first.
	self
		assert:
			(MyMTMutantKillingSuggestionGenerator new suggestionFor: mutation)
				string
		equals:
		'It is missing a test case to check that when an exception of kind Exception is signaled, it is handled evaluating the block [ :ex | Transcript show: ''error'' ]'
]

{ #category : 'testing-operators' }
MyMTMutantKillingSuggesionTest >> testSuggestionToKillReplaceAndForOr [

	| operator mutation mutationWithAssignment |
	operator := MyMTReplaceAndWithOrMutantOperator new.
	mutation := (operator mutationsFor:
		             self class >> #methodToTestSuggestionToKillRAO) first.
	mutationWithAssignment := (operator mutationsFor:
		                           self class
		                           >>
		                           #methodToTestSuggestionToKillRAOWithAssignments)
		                          first.
	self
		assert:
		(MyMTMutantKillingSuggestionGenerator new suggestionFor: mutation)
		equals:
		'It is missing a test case where only one of the conditions 2 = (1 + 1) and [ Set new isEmpty ] is True.'.
	self
		assert: (MyMTMutantKillingSuggestionGenerator new suggestionFor:
				 mutationWithAssignment)
		equals:
		'It is missing a test case where only one of the conditions firstCondition and [ secondCondition ] is True.'
]

{ #category : 'testing' }
MyMTMutantKillingSuggesionTest >> testSuggestionToKillReplaceDoBlockWithEmptyBlock [

	| operator mutation |
	operator := MyMTReplaceDoBlockWithEmptyBlockOperator new.
	mutation := (operator mutationsFor: self class
		             >>
		             #methodToTestSuggestionToKillReplaceDoBlockWithEmptyBlock)
		            first.
	self
		assert:
			(MyMTMutantKillingSuggestionGenerator new suggestionFor: mutation)
				string
		equals:
		'It is missing a test case to check that there is an iteration doing [ :each | Transcript show: each ] on each element of OrderedCollection new'
]

{ #category : 'testing' }
MyMTMutantKillingSuggesionTest >> testSuggestionToKillReplaceIfFalseReceiverWithFalse [

	| operator mutation |
	operator := MyMTReplaceIfFalseReceiverWithFalseOperator new.
	mutation := (operator mutationsFor:
		             self class
		             >> #methodToTestSuggestionToKillReplaceIfFalseReceiver)
		            first.
	self
		assert:
			(MyMTMutantKillingSuggestionGenerator new suggestionFor: mutation)
				string
		equals:
		'It is missing a test case to check that when 1 = 1 is true, [ 8 ] is not evaluated'
]

{ #category : 'testing' }
MyMTMutantKillingSuggesionTest >> testSuggestionToKillReplaceIfFalseReceiverWithTrue [

	| operator mutation |
	operator := MyMTReplaceIfFalseReceiverWithTrueOperator new.
	mutation := (operator mutationsFor:
		             self class
		             >> #methodToTestSuggestionToKillReplaceIfFalseReceiver)
		            first.
	self
		assert:
			(MyMTMutantKillingSuggestionGenerator new suggestionFor: mutation)
				string
		equals:
		'It is missing a test case to check that when 1 = 1 is false, [ 8 ] is evaluated'
]

{ #category : 'testing' }
MyMTMutantKillingSuggesionTest >> testSuggestionToKillReplaceIfTrueReceiverWithFalse [

	| operator mutation |
	operator := MyMTReplaceIfTrueReceiverWithFalseOperator new.
	mutation := (operator mutationsFor:
		             self class
		             >> #methodToTestSuggestionToKillReplaceIfTrueReceiver)
		            first.
	self
		assert:
			(MyMTMutantKillingSuggestionGenerator new suggestionFor: mutation)
				string
		equals:
		'It is missing a test case to check that when 1 = 1 is true, [ 8 ] is evaluated'
]

{ #category : 'testing' }
MyMTMutantKillingSuggesionTest >> testSuggestionToKillReplaceIfTrueReceiverWithTrue [

	| operator mutation |
	operator := MyMTReplaceIfTrueReceiverWithTrueOperator new.
	mutation := (operator mutationsFor:
		             self class
		             >> #methodToTestSuggestionToKillReplaceIfTrueReceiver)
		            first.
	self
		assert:
			(MyMTMutantKillingSuggestionGenerator new suggestionFor: mutation)
				string
		equals:
		'It is missing a test case to check that when 1 = 1 is false, [ 8 ] is not evaluated'
]

{ #category : 'testing' }
MyMTMutantKillingSuggesionTest >> testSuggestionToKillReplaceIfTrueifFalseReceiverWithFalse [

	| operator mutation |
	operator := MyMTReplaceIfTrueIfFalseReceiverWithFalseOperator new.
	mutation := (operator mutationsFor: self class
		             >>
		             #methodToTestSuggestionToKillReplaceIfTrueIfFalseReceiver)
		            first.
	self
		assert:
			(MyMTMutantKillingSuggestionGenerator new suggestionFor: mutation)
				string
		equals:
		'It is missing a test case to check that when 1 = 1 is true, [ 1 ] is evaluated and [ 8 ] is not'
]

{ #category : 'testing' }
MyMTMutantKillingSuggesionTest >> testSuggestionToKillReplaceIfTrueifFalseReceiverWithTrue [

	| operator mutation |
	operator := MyMTReplaceIfTrueIfFalseReceiverWithTrueOperator new.
	mutation := (operator mutationsFor: self class
		             >>
		             #methodToTestSuggestionToKillReplaceIfTrueIfFalseReceiver)
		            first.
	self
		assert:
			(MyMTMutantKillingSuggestionGenerator new suggestionFor: mutation)
				string
		equals:
		'It is missing a test case to check that when 1 = 1 is false, [ 8 ] is evaluated and [ 1 ] is not'
]

{ #category : 'testing-operators' }
MyMTMutantKillingSuggesionTest >> testSuggestionToKillReplaceOrForAnd [

	| operator mutation mutationWithAssignment |
	operator := MyMTReplaceOrWithAndMutantOperator new.
	mutation := (operator mutationsFor:
		             self class >> #methodToTestSuggestionToKillROA) first.
	mutationWithAssignment := (operator mutationsFor:
		                           self class
		                           >>
		                           #methodToTestSuggestionToKillROAWithAssignments)
		                          first.
	self
		assert:
		(MyMTMutantKillingSuggestionGenerator new suggestionFor: mutation)
		equals:
		'It is missing a test case where only one of the conditions 2 = (1 + 1) and [ Set new isEmpty ] is True.'.
	self
		assert: (MyMTMutantKillingSuggestionGenerator new suggestionFor:
				 mutationWithAssignment)
		equals:
		'It is missing a test case where only one of the conditions firstCondition and [ secondCondition ] is True.'
]
