Class {
	#name : 'MyMTReplaceGreaterOrEqualWithEqualMutantOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceGreaterOrEqualWithEqualMutantOperatorTest >> methodWithNoSenders [  
	^ 1 - 2
]

{ #category : 'accessing' }
MyMTReplaceGreaterOrEqualWithEqualMutantOperatorTest >> methodWithOneSender [  
	^ 2 >= 1
]

{ #category : 'accessing' }
MyMTReplaceGreaterOrEqualWithEqualMutantOperatorTest >> methodWithOneSenderModified [
	^ 2 = 1
]

{ #category : 'accessing' }
MyMTReplaceGreaterOrEqualWithEqualMutantOperatorTest >> methodWithTwoSenders [
	^ 1 >= 2 or: [2 >= 3].
]

{ #category : 'accessing' }
MyMTReplaceGreaterOrEqualWithEqualMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ 1 = 2 or: [2 >= 3].
]

{ #category : 'accessing' }
MyMTReplaceGreaterOrEqualWithEqualMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ 1 >= 2 or: [2 = 3].
]

{ #category : 'accessing' }
MyMTReplaceGreaterOrEqualWithEqualMutantOperatorTest >> operator [
	^ MyMTReplaceGreaterOrEqualWithEqualMutantOperator new
]
