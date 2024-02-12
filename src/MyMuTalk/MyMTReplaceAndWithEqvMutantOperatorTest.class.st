Class {
	#name : 'MyMTReplaceAndWithEqvMutantOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceAndWithEqvMutantOperatorTest >> methodWithNoSenders [  
	^ true or: [false]
]

{ #category : 'accessing' }
MyMTReplaceAndWithEqvMutantOperatorTest >> methodWithOneSender [  
	^ true and: [false]
]

{ #category : 'accessing' }
MyMTReplaceAndWithEqvMutantOperatorTest >> methodWithOneSenderModified [
	^ true bEqv: [false]
]

{ #category : 'accessing' }
MyMTReplaceAndWithEqvMutantOperatorTest >> methodWithTwoSenders [  
	^ true and: [true and: [false]]
]

{ #category : 'accessing' }
MyMTReplaceAndWithEqvMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ true bEqv: [true and: [false]]
]

{ #category : 'accessing' }
MyMTReplaceAndWithEqvMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ true and: [true bEqv: [false]]
]

{ #category : 'accessing' }
MyMTReplaceAndWithEqvMutantOperatorTest >> operator [
	^ MyMTReplaceAndWithEqvMutantOperator new
]
