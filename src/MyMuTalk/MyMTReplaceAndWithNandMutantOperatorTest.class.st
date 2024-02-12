Class {
	#name : 'MyMTReplaceAndWithNandMutantOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceAndWithNandMutantOperatorTest >> methodWithNoSenders [  
	^ true or: [false]
]

{ #category : 'accessing' }
MyMTReplaceAndWithNandMutantOperatorTest >> methodWithOneSender [  
	^ true and: [false]
]

{ #category : 'accessing' }
MyMTReplaceAndWithNandMutantOperatorTest >> methodWithOneSenderModified [
	^ true nand: [false]
]

{ #category : 'accessing' }
MyMTReplaceAndWithNandMutantOperatorTest >> methodWithTwoSenders [  
	^ true and: [true and: [false]]
]

{ #category : 'accessing' }
MyMTReplaceAndWithNandMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ true nand: [true and: [false]]
]

{ #category : 'accessing' }
MyMTReplaceAndWithNandMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ true and: [true nand: [false]]
]

{ #category : 'accessing' }
MyMTReplaceAndWithNandMutantOperatorTest >> operator [
	^ MyMTReplaceAndWithNandMutantOperator new
]
