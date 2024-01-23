Class {
	#name : 'DynamiqueReflectiveMethodFailMutantOperator',
	#superclass : 'SelectorReplacementMutantOperator',
	#instVars : [
		'oldSelector'
	],
	#category : 'MutationTestingForReflection',
	#package : 'MutationTestingForReflection'
}

{ #category : 'instance creation' }
DynamiqueReflectiveMethodFailMutantOperator class >> newWithSelector: aSelector [
	^ self new oldSelector: aSelector
]

{ #category : 'tests - printing' }
DynamiqueReflectiveMethodFailMutantOperator class >> prefix [
	^ #___
]

{ #category : 'accessing' }
DynamiqueReflectiveMethodFailMutantOperator >> newSelector [
	^ (self prefix, oldSelector ) asSymbol 
]

{ #category : 'accessing' }
DynamiqueReflectiveMethodFailMutantOperator >> oldSelector [
	^ oldSelector 
]

{ #category : 'accessing' }
DynamiqueReflectiveMethodFailMutantOperator >> oldSelector: aSelector [
	oldSelector := aSelector 
]
