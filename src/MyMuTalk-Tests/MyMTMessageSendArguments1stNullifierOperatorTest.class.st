Class {
	#name : 'MyMTMessageSendArguments1stNullifierOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'accessing' }
MyMTMessageSendArguments1stNullifierOperatorTest >> methodWithNoSenders [

	^ self operatorDescription 
]

{ #category : 'accessing' }
MyMTMessageSendArguments1stNullifierOperatorTest >> methodWithOneSender [

	| o |
	o := OrderedCollection new.
	o at: 1 put: 2.
]

{ #category : 'accessing' }
MyMTMessageSendArguments1stNullifierOperatorTest >> methodWithOneSenderModified [

	
	| o |
	o := OrderedCollection new.
	o at: nil put: 2
]

{ #category : 'accessing' }
MyMTMessageSendArguments1stNullifierOperatorTest >> methodWithTwoSenders [

	
	| o |
	o := OrderedCollection new.
	o at: 1 put: 2.
	o at: 1 .
]

{ #category : 'accessing' }
MyMTMessageSendArguments1stNullifierOperatorTest >> methodWithTwoSendersModifiedFirst [

	| o |
	o := OrderedCollection new.
	o at: nil put: 2.
	o at: 1
]

{ #category : 'accessing' }
MyMTMessageSendArguments1stNullifierOperatorTest >> methodWithTwoSendersModifiedSecond [

	| o |
	o := OrderedCollection new.
	o at: 1 put: 2.
	o at: nil
]

{ #category : 'accessing' }
MyMTMessageSendArguments1stNullifierOperatorTest >> operator [

	^ MyMTMessageSendArguments1stNullifierOperator new
]
