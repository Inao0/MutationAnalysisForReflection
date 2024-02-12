Class {
	#name : 'MyMTReplaceRejectBlockWithAlwaysFalseBlockOperator',
	#superclass : 'MyMTMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'printing' }
MyMTReplaceRejectBlockWithAlwaysFalseBlockOperator >> description [
	^'Replace Reject block with [:each | false]'.
]

{ #category : 'applying' }
MyMTReplaceRejectBlockWithAlwaysFalseBlockOperator >> expressionToReplace [ 
	^'``@collection reject: ``@aBlock'
]

{ #category : 'applying' }
MyMTReplaceRejectBlockWithAlwaysFalseBlockOperator >> newExpression [
	^'``@collection reject: [:each | false]'
]
