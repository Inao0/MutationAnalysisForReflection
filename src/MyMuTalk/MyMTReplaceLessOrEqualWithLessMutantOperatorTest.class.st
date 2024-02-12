Class {
	#name : 'MyMTReplaceLessOrEqualWithLessMutantOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceLessOrEqualWithLessMutantOperatorTest >> methodWithNoSenders [  
	^ 1 - 2
]

{ #category : 'accessing' }
MyMTReplaceLessOrEqualWithLessMutantOperatorTest >> methodWithOneSender [  
	^ 1 <= 2
]

{ #category : 'accessing' }
MyMTReplaceLessOrEqualWithLessMutantOperatorTest >> methodWithOneSenderModified [
	^ 1 < 2
]

{ #category : 'accessing' }
MyMTReplaceLessOrEqualWithLessMutantOperatorTest >> methodWithTwoSenders [
	^ 1 <= 2 or: [2 <= 3].
]

{ #category : 'accessing' }
MyMTReplaceLessOrEqualWithLessMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ 1 < 2 or: [2 <= 3].
]

{ #category : 'accessing' }
MyMTReplaceLessOrEqualWithLessMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ 1 <= 2 or: [2 < 3].
]

{ #category : 'accessing' }
MyMTReplaceLessOrEqualWithLessMutantOperatorTest >> operator [
	^ MyMTReplaceLessOrEqualWithLessMutantOperator new
]
