Class {
	#name : 'AddPrefixToSelectorsMutantOperator',
	#superclass : 'SelectorReplacementMutantOperator',
	#instVars : [
		'oldSelector'
	],
	#category : 'MutationTestingForReflection',
	#package : 'MutationTestingForReflection'
}

{ #category : 'as yet unclassified' }
AddPrefixToSelectorsMutantOperator class >> newWithSelector: aSelector [
	^ self new oldSelector: aSelector
]

{ #category : 'tests - printing' }
AddPrefixToSelectorsMutantOperator class >> prefix [
	^ #___
]

{ #category : 'as yet unclassified' }
AddPrefixToSelectorsMutantOperator >> newSelector [
	^ (self class prefix, oldSelector ) asSymbol 
]

{ #category : 'as yet unclassified' }
AddPrefixToSelectorsMutantOperator >> oldSelector [
	^ oldSelector 
]

{ #category : 'as yet unclassified' }
AddPrefixToSelectorsMutantOperator >> oldSelector: aSelector [
	oldSelector := aSelector 
]
