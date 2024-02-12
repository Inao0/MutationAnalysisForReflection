Class {
	#name : 'MyMTRandomMutantSelectionStrategy',
	#superclass : 'Object',
	#instVars : [
		'mutationsGenerationStrategy'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'instance creation' }
MyMTRandomMutantSelectionStrategy class >> using: aMutationsGenerationStrategy [

	^ self new
		  mutantSelectionStrategy: aMutationsGenerationStrategy;
		  yourself
]

{ #category : 'accessing-defaults' }
MyMTRandomMutantSelectionStrategy >> defaultMutantSelectionStrategy [

	^ MyMTAllMutantSelectionStrategy new
]

{ #category : 'initialization' }
MyMTRandomMutantSelectionStrategy >> initialize [

	super initialize.
	mutationsGenerationStrategy := self defaultMutantSelectionStrategy
]

{ #category : 'generating' }
MyMTRandomMutantSelectionStrategy >> methodsToMutateFrom: aMutationTestingAnalysis [

	^ mutationsGenerationStrategy methodsToMutateFrom: aMutationTestingAnalysis
]

{ #category : 'accessing' }
MyMTRandomMutantSelectionStrategy >> mutantSelectionStrategy [

	^ mutationsGenerationStrategy
]

{ #category : 'accessing' }
MyMTRandomMutantSelectionStrategy >> mutantSelectionStrategy: aMutationsGenerationStrategy [

	mutationsGenerationStrategy := aMutationsGenerationStrategy
]

{ #category : 'generating' }
MyMTRandomMutantSelectionStrategy >> mutationsFor: aMutationTestingAnalysis [

	^ self
		  mutationsFor: aMutationTestingAnalysis
		  loggingIn: self nullLogger
]

{ #category : 'generating' }
MyMTRandomMutantSelectionStrategy >> mutationsFor: aMutationTestingAnalysis loggingIn: aLogger [

	| mutations |
	mutations := mutationsGenerationStrategy mutationsFor:
		             aMutationTestingAnalysis loggingIn: aLogger.
	^ mutations shuffle
]

{ #category : 'generating' }
MyMTRandomMutantSelectionStrategy >> mutationsFor: aMethod usingAll: aCollectionOfMutantOperators logginIn: aLogger [

	^ mutationsGenerationStrategy
		  mutationsFor: aMethod
		  usingAll: aCollectionOfMutantOperators
		  logginIn: aLogger
]

{ #category : 'logging' }
MyMTRandomMutantSelectionStrategy >> nullLogger [

	^ mutationsGenerationStrategy nullLogger
]
