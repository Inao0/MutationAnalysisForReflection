Class {
	#name : 'MyMTRemoveCaretMutantOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTRemoveCaretMutantOperatorTest >> methodWithNoSenders [  
	"a string that has ^ inside"
	OrderedCollection new do: [:elem | elem notNil]
]

{ #category : 'accessing' }
MyMTRemoveCaretMutantOperatorTest >> methodWithOneSender [  
	^1 + 2
]

{ #category : 'accessing' }
MyMTRemoveCaretMutantOperatorTest >> methodWithOneSenderModified [
	1 + 2
]

{ #category : 'accessing' }
MyMTRemoveCaretMutantOperatorTest >> methodWithTwoSenders [
	true 
		ifTrue: [^1] 
		ifFalse: [^2]
]

{ #category : 'accessing' }
MyMTRemoveCaretMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	true 
		ifTrue: [1] 
		ifFalse: [^2]
]

{ #category : 'accessing' }
MyMTRemoveCaretMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	true 
		ifTrue: [^1] 
		ifFalse: [2]
]

{ #category : 'accessing' }
MyMTRemoveCaretMutantOperatorTest >> operator [
	^ MyMTRemoveCaretOperator new
]
