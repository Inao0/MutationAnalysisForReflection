Class {
	#name : 'MyMTReplaceDetectIfNoneSecondBlockWithEmptyBlockOperator',
	#superclass : 'MyMTMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'printing' }
MyMTReplaceDetectIfNoneSecondBlockWithEmptyBlockOperator >> description [
	^'Replace ifNone: block with [] when #detect:ifNone:'
]

{ #category : 'applying' }
MyMTReplaceDetectIfNoneSecondBlockWithEmptyBlockOperator >> expressionToReplace [ 
	^'``@object detect: ``@aBlock ifNone: ``@anotherBlock'

]

{ #category : 'applying' }
MyMTReplaceDetectIfNoneSecondBlockWithEmptyBlockOperator >> newExpression [ 
	^'``@object detect: ``@aBlock ifNone: []'
]
