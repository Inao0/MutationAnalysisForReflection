Class {
	#name : 'MyMTReplaceOrWithAndMutantOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceOrWithAndMutantOperatorTest >> methodWithNoSenders [  
	^ true and: [false]
]

{ #category : 'accessing' }
MyMTReplaceOrWithAndMutantOperatorTest >> methodWithOneSender [  
	^ true or: [false]
]

{ #category : 'accessing' }
MyMTReplaceOrWithAndMutantOperatorTest >> methodWithOneSenderModified [
	^ true and: [false]
]

{ #category : 'accessing' }
MyMTReplaceOrWithAndMutantOperatorTest >> methodWithTwoSenders [  
	^ true or: [true or: [false]]
]

{ #category : 'accessing' }
MyMTReplaceOrWithAndMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ true and: [true or: [false]]
]

{ #category : 'accessing' }
MyMTReplaceOrWithAndMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ true or: [true and: [false]]
]

{ #category : 'accessing' }
MyMTReplaceOrWithAndMutantOperatorTest >> operator [
	^ MyMTReplaceOrWithAndMutantOperator new
]
