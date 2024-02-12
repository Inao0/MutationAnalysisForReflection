Class {
	#name : 'MyMTReplaceAndWithOrMutantOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceAndWithOrMutantOperatorTest >> methodWithNoSenders [  
	^ true or: [false]
]

{ #category : 'accessing' }
MyMTReplaceAndWithOrMutantOperatorTest >> methodWithOneSender [  
	^ true and: [false]
]

{ #category : 'accessing' }
MyMTReplaceAndWithOrMutantOperatorTest >> methodWithOneSenderModified [
	^ true or: [false]
]

{ #category : 'accessing' }
MyMTReplaceAndWithOrMutantOperatorTest >> methodWithTwoSenders [  
	^ true and: [true and: [false]]
]

{ #category : 'accessing' }
MyMTReplaceAndWithOrMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ true or: [true and: [false]]
]

{ #category : 'accessing' }
MyMTReplaceAndWithOrMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ true and: [true or: [false]]
]

{ #category : 'accessing' }
MyMTReplaceAndWithOrMutantOperatorTest >> operator [
	^ MyMTReplaceAndWithOrMutantOperator new
]
