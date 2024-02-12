Class {
	#name : 'MyMTReplaceSelectBlockWithAlwaysFalseBlockOperator',
	#superclass : 'MyMTMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'printing' }
MyMTReplaceSelectBlockWithAlwaysFalseBlockOperator >> description [
	^'Replace Select block with [:each | false]'.
]

{ #category : 'applying' }
MyMTReplaceSelectBlockWithAlwaysFalseBlockOperator >> expressionToReplace [ 
	^'``@collection select: ``@aBlock'
]

{ #category : 'applying' }
MyMTReplaceSelectBlockWithAlwaysFalseBlockOperator >> newExpression [
	^'``@collection select: [:each | false]'
]
