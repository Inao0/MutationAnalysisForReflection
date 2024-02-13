Class {
	#name : 'MyMTReplaceOrArgumentWithFalseOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'accessing' }
MyMTReplaceOrArgumentWithFalseOperatorTest >> methodWithNoSenders [  
	^ true and: [false]
]

{ #category : 'accessing' }
MyMTReplaceOrArgumentWithFalseOperatorTest >> methodWithOneSender [  
	^ true or: [true]
]

{ #category : 'accessing' }
MyMTReplaceOrArgumentWithFalseOperatorTest >> methodWithOneSenderModified [
	^ true or: [false]
]

{ #category : 'accessing' }
MyMTReplaceOrArgumentWithFalseOperatorTest >> methodWithTwoSenders [  
	^ true or: [true or: [true]]
]

{ #category : 'accessing' }
MyMTReplaceOrArgumentWithFalseOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ true or: [false]
]

{ #category : 'accessing' }
MyMTReplaceOrArgumentWithFalseOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ true or: [true or: [false]]
]

{ #category : 'accessing' }
MyMTReplaceOrArgumentWithFalseOperatorTest >> operator [
	^ MyMTReplaceOrArgumentWithFalseOperator new
]
