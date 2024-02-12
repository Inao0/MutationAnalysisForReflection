Class {
	#name : 'MyMTReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperator',
	#superclass : 'MyMTMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'printing' }
MyMTReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperator >> description [
	^'Replace detect: block with [:each | false] when #detect:ifNone: '
]

{ #category : 'applying' }
MyMTReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperator >> expressionToReplace [ 
	^'``@object detect: ``@aBlock ifNone: ``@anotherBlock'

]

{ #category : 'applying' }
MyMTReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperator >> newExpression [ 
	^'``@object detect: [:each | false] ifNone: ``@anotherBlock'

]
