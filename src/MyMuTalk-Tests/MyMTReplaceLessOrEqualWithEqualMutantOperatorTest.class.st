Class {
	#name : 'MyMTReplaceLessOrEqualWithEqualMutantOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'accessing' }
MyMTReplaceLessOrEqualWithEqualMutantOperatorTest >> methodWithNoSenders [  
	^ 1 - 2
]

{ #category : 'accessing' }
MyMTReplaceLessOrEqualWithEqualMutantOperatorTest >> methodWithOneSender [  
	^ 1 <= 2
]

{ #category : 'accessing' }
MyMTReplaceLessOrEqualWithEqualMutantOperatorTest >> methodWithOneSenderModified [
	^ 1 = 2
]

{ #category : 'accessing' }
MyMTReplaceLessOrEqualWithEqualMutantOperatorTest >> methodWithTwoSenders [
	^ 1 <= 2 or: [2 <= 3].
]

{ #category : 'accessing' }
MyMTReplaceLessOrEqualWithEqualMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ 1 = 2 or: [2 <= 3].
]

{ #category : 'accessing' }
MyMTReplaceLessOrEqualWithEqualMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ 1 <= 2 or: [2 = 3].
]

{ #category : 'accessing' }
MyMTReplaceLessOrEqualWithEqualMutantOperatorTest >> operator [
	^ MyMTReplaceLessOrEqualWithEqualMutantOperator new
]
