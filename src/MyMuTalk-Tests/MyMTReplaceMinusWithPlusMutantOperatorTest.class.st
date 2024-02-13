Class {
	#name : 'MyMTReplaceMinusWithPlusMutantOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'accessing' }
MyMTReplaceMinusWithPlusMutantOperatorTest >> methodWithNoSenders [  
	^ 1 + 2
]

{ #category : 'accessing' }
MyMTReplaceMinusWithPlusMutantOperatorTest >> methodWithOneSender [  
	^ 1 - 2
]

{ #category : 'accessing' }
MyMTReplaceMinusWithPlusMutantOperatorTest >> methodWithOneSenderModified [
	^ 1 + 2
]

{ #category : 'accessing' }
MyMTReplaceMinusWithPlusMutantOperatorTest >> methodWithTwoSenders [
	^ 1 - 2 - 3
]

{ #category : 'accessing' }
MyMTReplaceMinusWithPlusMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ 1 - 2 + 3
]

{ #category : 'accessing' }
MyMTReplaceMinusWithPlusMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ 1 + 2 - 3
]

{ #category : 'accessing' }
MyMTReplaceMinusWithPlusMutantOperatorTest >> operator [
	^ MyMTReplaceMinusWithPlusMutantOperator new
]
