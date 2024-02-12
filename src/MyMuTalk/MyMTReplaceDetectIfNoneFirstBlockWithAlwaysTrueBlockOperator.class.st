Class {
	#name : 'MyMTReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperator',
	#superclass : 'MyMTMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'printing' }
MyMTReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperator >> description [
	^'Replace detect: block with [:each | true] when #detect:ifNone: '
]

{ #category : 'applying' }
MyMTReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperator >> expressionToReplace [ 
	^'``@object detect: ``@aBlock ifNone: ``@anotherBlock'

]

{ #category : 'applying' }
MyMTReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperator >> newExpression [ 
	^'``@object detect: [:each | true] ifNone: ``@anotherBlock'

]
