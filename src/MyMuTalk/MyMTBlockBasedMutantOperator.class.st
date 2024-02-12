Class {
	#name : 'MyMTBlockBasedMutantOperator',
	#superclass : 'MyMTMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'testing' }
MyMTBlockBasedMutantOperator class >> isAbstract [

	^ self == MyMTBlockBasedMutantOperator
]

{ #category : 'testing' }
MyMTBlockBasedMutantOperator class >> isOriginalOperator [
	^ false
]

{ #category : 'testing' }
MyMTBlockBasedMutantOperator >> isAPosibleMutatedNode: aRBMethodNode [

	| nodeThatMatches |
	nodeThatMatches := aRBMethodNode allChildren detect:  self newExpression ifNone: [nil].
	^ nodeThatMatches notNil and: [ 
		  self is: nodeThatMatches equalTo: aRBMethodNode ]
]

{ #category : 'testing' }
MyMTBlockBasedMutantOperator >> isAPosibleNodeToMutate: aRBMethodNode [

	| nodeThatMatches |
	nodeThatMatches := aRBMethodNode allChildren
		                   detect: self expressionToReplace
		                   ifNone: [ nil ].

	^ nodeThatMatches notNil and: [ 
		  self is: aRBMethodNode equalTo: nodeThatMatches ]
]

{ #category : 'private' }
MyMTBlockBasedMutantOperator >> modifiedSourceFor: aCompiledMethod with: aParseTree number: aNumber [

	| parser allNodes |
	parser := aParseTree copy.
	allNodes := parser allChildren select: self expressionToReplace.
	allNodes size >= aNumber ifTrue: [ 
		| oldNode newNode |
		oldNode := allNodes at: aNumber.
		newNode := self newExpression value: oldNode.
		oldNode replaceWith: newNode ].
	^ parser formattedCode
]

{ #category : 'private' }
MyMTBlockBasedMutantOperator >> timesToApplyIn: aCompiledMethod with: aParseTree [

	"Evaluates how many times can the operator be applyied"

	^ (aParseTree allChildren select: self expressionToReplace) size
]
