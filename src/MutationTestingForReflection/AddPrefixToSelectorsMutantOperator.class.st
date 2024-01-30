Class {
	#name : 'AddPrefixToSelectorsMutantOperator',
	#superclass : 'SelectorReplacementMutantOperator',
	#instVars : [
		'oldSelector'
	],
	#category : 'MutationTestingForReflection',
	#package : 'MutationTestingForReflection'
}

{ #category : 'instance creation' }
AddPrefixToSelectorsMutantOperator class >> newWithSelector: aSelector [
	^ self new oldSelector: aSelector
]

{ #category : 'tests - printing' }
AddPrefixToSelectorsMutantOperator class >> prefix [
	^ #___
]

{ #category : 'accessing' }
AddPrefixToSelectorsMutantOperator >> newSelector [
	^ (self class prefix, oldSelector ) asSymbol 
]

{ #category : 'accessing' }
AddPrefixToSelectorsMutantOperator >> oldSelector [
	^ oldSelector 
]

{ #category : 'accessing' }
AddPrefixToSelectorsMutantOperator >> oldSelector: aSelector [
	oldSelector := aSelector 
]