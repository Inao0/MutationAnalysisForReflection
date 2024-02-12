Class {
	#name : 'MyMTReplaceOrWithXorMutantOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceOrWithXorMutantOperatorTest >> methodWithNoSenders [  
	^ true and: [false]
]

{ #category : 'accessing' }
MyMTReplaceOrWithXorMutantOperatorTest >> methodWithOneSender [  
	^ true or: [false]
]

{ #category : 'accessing' }
MyMTReplaceOrWithXorMutantOperatorTest >> methodWithOneSenderModified [
	^ true bXor: [false]
]

{ #category : 'accessing' }
MyMTReplaceOrWithXorMutantOperatorTest >> methodWithTwoSenders [  
	^ true or: [true or: [false]]
]

{ #category : 'accessing' }
MyMTReplaceOrWithXorMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ true bXor: [true or: [false]]
]

{ #category : 'accessing' }
MyMTReplaceOrWithXorMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ true or: [true bXor: [false]]
]

{ #category : 'accessing' }
MyMTReplaceOrWithXorMutantOperatorTest >> operator [
	^ MyMTReplaceOrWithXorMutantOperator new
]
