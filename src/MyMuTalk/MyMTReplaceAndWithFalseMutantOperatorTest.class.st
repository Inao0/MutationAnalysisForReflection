Class {
	#name : 'MyMTReplaceAndWithFalseMutantOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceAndWithFalseMutantOperatorTest >> methodWithNoSenders [  
	^ true or: [false]
]

{ #category : 'accessing' }
MyMTReplaceAndWithFalseMutantOperatorTest >> methodWithOneSender [  
	^ true and: [false]
]

{ #category : 'accessing' }
MyMTReplaceAndWithFalseMutantOperatorTest >> methodWithOneSenderModified [
	^ false
]

{ #category : 'accessing' }
MyMTReplaceAndWithFalseMutantOperatorTest >> methodWithTwoSenders [  
	^ true and: [true and: [false]]
]

{ #category : 'accessing' }
MyMTReplaceAndWithFalseMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ false
]

{ #category : 'accessing' }
MyMTReplaceAndWithFalseMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ true and: [false]
]

{ #category : 'accessing' }
MyMTReplaceAndWithFalseMutantOperatorTest >> operator [
	^ MyMTReplaceAndWithFalseOperator new
]
