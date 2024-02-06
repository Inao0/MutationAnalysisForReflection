Class {
	#name : 'AddPrefixToSelectorsMutantOperator',
	#superclass : 'MTSelectorReplacementMutantOperator',
	#instVars : [
		'oldSelector',
		'prefix'
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
AddPrefixToSelectorsMutantOperator >> initialize [ 
	super initialize.
	prefix := self class prefix.
	oldSelector := ''.
	
]

{ #category : 'accessing' }
AddPrefixToSelectorsMutantOperator >> newSelector [
	^ (self prefix, oldSelector ) asSymbol 
]

{ #category : 'accessing' }
AddPrefixToSelectorsMutantOperator >> oldSelector [
	^ oldSelector 
]

{ #category : 'accessing' }
AddPrefixToSelectorsMutantOperator >> oldSelector: aSelector [
	oldSelector := aSelector 
]

{ #category : 'accessing' }
AddPrefixToSelectorsMutantOperator >> prefix [
	^ prefix 
]

{ #category : 'accessing' }
AddPrefixToSelectorsMutantOperator >> prefix: aSymbol [
	prefix := aSymbol 
]
