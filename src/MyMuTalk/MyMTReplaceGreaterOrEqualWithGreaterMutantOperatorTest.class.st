Class {
	#name : 'MyMTReplaceGreaterOrEqualWithGreaterMutantOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceGreaterOrEqualWithGreaterMutantOperatorTest >> methodWithNoSenders [  
	^ 1 - 2
]

{ #category : 'accessing' }
MyMTReplaceGreaterOrEqualWithGreaterMutantOperatorTest >> methodWithOneSender [  
	^ 2 >= 1
]

{ #category : 'accessing' }
MyMTReplaceGreaterOrEqualWithGreaterMutantOperatorTest >> methodWithOneSenderModified [
	^ 2 > 1
]

{ #category : 'accessing' }
MyMTReplaceGreaterOrEqualWithGreaterMutantOperatorTest >> methodWithTwoSenders [
	^ 1 >= 2 or: [2 >= 3].
]

{ #category : 'accessing' }
MyMTReplaceGreaterOrEqualWithGreaterMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ 1 > 2 or: [2 >= 3].
]

{ #category : 'accessing' }
MyMTReplaceGreaterOrEqualWithGreaterMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ 1 >= 2 or: [2 > 3].
]

{ #category : 'accessing' }
MyMTReplaceGreaterOrEqualWithGreaterMutantOperatorTest >> operator [
	^ MyMTReplaceGreaterOrEqualWithGreaterMutantOperator new
]
