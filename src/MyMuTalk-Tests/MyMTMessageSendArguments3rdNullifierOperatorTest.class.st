Class {
	#name : 'MyMTMessageSendArguments3rdNullifierOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'accessing' }
MyMTMessageSendArguments3rdNullifierOperatorTest >> methodWithNoSenders [

	^ self operatorDescription 
]

{ #category : 'accessing' }
MyMTMessageSendArguments3rdNullifierOperatorTest >> methodWithOneSender [

	| o |
	o := OrderedCollection new.
	o at: 1 put: 2.
	o collect: [:s | s] from: 0 to: 2.
	o at: 1 put: 2
]

{ #category : 'accessing' }
MyMTMessageSendArguments3rdNullifierOperatorTest >> methodWithOneSenderModified [

	| o |
	o := OrderedCollection new.
	o at: 1 put: 2.
	o collect: [ :s | s ] from: 0 to: nil.
	o at: 1 put: 2
]

{ #category : 'accessing' }
MyMTMessageSendArguments3rdNullifierOperatorTest >> methodWithTwoSenders [

	| o |
	o := OrderedCollection new.
	o at: 1 put: 2.
	o collect: [ :s | s ] from: 0 to: 2.
	o collect: [ :s | s ] from: 0 to: 2.
	o at: 1 put: 2
]

{ #category : 'accessing' }
MyMTMessageSendArguments3rdNullifierOperatorTest >> methodWithTwoSendersModifiedFirst [

	| o |
	o := OrderedCollection new.
	o at: 1 put: 2.
	o collect: [ :s | s ] from: 0 to: nil.
	o collect: [ :s | s ] from: 0 to: 2.
	o at: 1 put: 2
]

{ #category : 'accessing' }
MyMTMessageSendArguments3rdNullifierOperatorTest >> methodWithTwoSendersModifiedSecond [

	| o |
	o := OrderedCollection new.
	o at: 1 put: 2.
	o collect: [ :s | s ] from: 0 to: 2.
	o collect: [ :s | s ] from: 0 to: nil.
	o at: 1 put: 2
]

{ #category : 'accessing' }
MyMTMessageSendArguments3rdNullifierOperatorTest >> operator [

	^ MyMTMessageSendArguments3rdNullifierOperator new
]
