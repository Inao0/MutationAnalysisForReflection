Class {
	#name : 'MyMTRandomOperatorMutantSelectionStrategy',
	#superclass : 'MyMTRandomMutantSelectionStrategy',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'generating' }
MyMTRandomOperatorMutantSelectionStrategy >> mutationsFor: aMutationTestingAnalysis loggingIn: aLogger [

	| mutations shuffledMutations mutationDict |
	mutations := mutationsGenerationStrategy
		             mutationsFor: aMutationTestingAnalysis
		             loggingIn: aLogger.

	"Invariant: mutationsDict values are never empty.
	If they were to be empty, we remove the entry from the dictionary."
	mutationDict := mutations groupedBy: [ :e | e operator ].
	mutationDict := mutationDict collect: [ :mutationList |
		mutationList shuffled readStream ].

	shuffledMutations := OrderedCollection new.
	1 to: mutations size do: [ :i |
		| operator operatorMutations |
		operator := mutationDict keys atRandom.
		operatorMutations := mutationDict at: operator.
		shuffledMutations add: operatorMutations next.
		operatorMutations atEnd ifTrue: [ mutationDict removeKey: operator ] ].

	^ shuffledMutations
]
