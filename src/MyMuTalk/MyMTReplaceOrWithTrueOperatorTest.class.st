Class {
	#name : 'MyMTReplaceOrWithTrueOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceOrWithTrueOperatorTest >> methodWithNoSenders [  
	^ true and: [false]
]

{ #category : 'accessing' }
MyMTReplaceOrWithTrueOperatorTest >> methodWithOneSender [  
	^ true or: [true]
]

{ #category : 'accessing' }
MyMTReplaceOrWithTrueOperatorTest >> methodWithOneSenderModified [
	^ true
]

{ #category : 'accessing' }
MyMTReplaceOrWithTrueOperatorTest >> methodWithTwoSenders [  
	^ true or: [true or: [true]]
]

{ #category : 'accessing' }
MyMTReplaceOrWithTrueOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ true
]

{ #category : 'accessing' }
MyMTReplaceOrWithTrueOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ true or: [true]
]

{ #category : 'accessing' }
MyMTReplaceOrWithTrueOperatorTest >> operator [
	^ MyMTReplaceOrWithTrueOperator new
]
