Class {
	#name : 'MyMTReplaceIsEmptyWithNotEmptyMutantOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceIsEmptyWithNotEmptyMutantOperatorTest >> methodWithNoSenders [  
	^ 1 + 2
]

{ #category : 'accessing' }
MyMTReplaceIsEmptyWithNotEmptyMutantOperatorTest >> methodWithOneSender [  
	^OrderedCollection new isEmpty
]

{ #category : 'accessing' }
MyMTReplaceIsEmptyWithNotEmptyMutantOperatorTest >> methodWithOneSenderModified [
	^OrderedCollection new notEmpty
]

{ #category : 'accessing' }
MyMTReplaceIsEmptyWithNotEmptyMutantOperatorTest >> methodWithTwoSenders [
	OrderedCollection new isEmpty.
	OrderedCollection new isEmpty
]

{ #category : 'accessing' }
MyMTReplaceIsEmptyWithNotEmptyMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	OrderedCollection new notEmpty.
	OrderedCollection new isEmpty
]

{ #category : 'accessing' }
MyMTReplaceIsEmptyWithNotEmptyMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	OrderedCollection new isEmpty.
	OrderedCollection new notEmpty
]

{ #category : 'accessing' }
MyMTReplaceIsEmptyWithNotEmptyMutantOperatorTest >> operator [
	^MyMTReplaceIsEmptyWithNotEmptyMutantOperator new
]
