Class {
	#name : 'MyMTRemoveAtIfAbsentMutantOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'accessing' }
MyMTRemoveAtIfAbsentMutantOperatorTest >> methodWithNoSenders [  
	^ 1 + 2
]

{ #category : 'accessing' }
MyMTRemoveAtIfAbsentMutantOperatorTest >> methodWithOneSender [  
	^Dictionary new 
		at: 1 
		ifAbsent: [2]
]

{ #category : 'accessing' }
MyMTRemoveAtIfAbsentMutantOperatorTest >> methodWithOneSenderModified [
	^[2] value
]

{ #category : 'accessing' }
MyMTRemoveAtIfAbsentMutantOperatorTest >> methodWithTwoSenders [
	^Dictionary new 
		at: 1 
		ifAbsent: [Dictionary new 
						at: 2 
						ifAbsent: [3]]
]

{ #category : 'accessing' }
MyMTRemoveAtIfAbsentMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^[Dictionary new 
		at: 2 
		ifAbsent: [3]] value
]

{ #category : 'accessing' }
MyMTRemoveAtIfAbsentMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^Dictionary new 
		at: 1 
		ifAbsent: [[3] value]
]

{ #category : 'accessing' }
MyMTRemoveAtIfAbsentMutantOperatorTest >> operator [
	^ MyMTRemoveAtIfAbsentOperator new
]
