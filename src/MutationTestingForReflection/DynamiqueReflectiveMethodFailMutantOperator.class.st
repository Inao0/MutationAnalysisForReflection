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
DynamiqueReflectiveMethodFailMutantOperator class >> newWithMethod: aMethod [
	1 halt.
	"allReflectiveMethods first prefixedFailingMethod"
	"^ self new oldSelector: aSelector"
]

{ #category : 'tests - printing' }
DynamiqueReflectiveMethodFailMutantOperator class >> prefix [
	^ #___
]
