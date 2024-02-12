Class {
	#name : 'MyMTReplaceSelectBlockWithAlwaysTrueBlockOperator',
	#superclass : 'MyMTMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'printing' }
MyMTReplaceSelectBlockWithAlwaysTrueBlockOperator >> description [
	^'Replace Select block with [:each | true]'.
]

{ #category : 'applying' }
MyMTReplaceSelectBlockWithAlwaysTrueBlockOperator >> expressionToReplace [ 
	^'``@collection select: ``@aBlock'
]

{ #category : 'applying' }
MyMTReplaceSelectBlockWithAlwaysTrueBlockOperator >> newExpression [
	^'``@collection select: [:each | true]'
]
