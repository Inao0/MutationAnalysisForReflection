Class {
	#name : #ReplaceWithPrefixMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#instVars : [
		'oldSelector'
	],
	#category : #MutationTestingForReflection
}

{ #category : #'instance creation' }
ReplaceWithPrefixMutantOperator class >> newWithSelector: aSelector [
	^ self new oldSelector: aSelector
]

{ #category : #accessing }
ReplaceWithPrefixMutantOperator >> newSelector [
	^ ('_bad_', oldSelector ) asSymbol 
]

{ #category : #accessing }
ReplaceWithPrefixMutantOperator >> oldSelector [
	^ oldSelector 
]

{ #category : #accessing }
ReplaceWithPrefixMutantOperator >> oldSelector: aSelector [
	oldSelector := aSelector 
]
