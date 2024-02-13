Class {
	#name : 'MyMTMessageSendToYourselfOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'accessing' }
MyMTMessageSendToYourselfOperatorTest >> methodWithNoSenders [

	^ 1
]

{ #category : 'accessing' }
MyMTMessageSendToYourselfOperatorTest >> methodWithOneSender [

	self operator
]

{ #category : 'accessing' }
MyMTMessageSendToYourselfOperatorTest >> methodWithOneSenderModified [

	self yourself
]

{ #category : 'accessing' }
MyMTMessageSendToYourselfOperatorTest >> methodWithTwoSenders [

	 | dict |
dict:= Dictionary new. dict at: 1 put: 2
]

{ #category : 'accessing' }
MyMTMessageSendToYourselfOperatorTest >> methodWithTwoSendersModifiedFirst [

	| dict |
	dict := Dictionary yourself.
	dict at: 1 put: 2
]

{ #category : 'accessing' }
MyMTMessageSendToYourselfOperatorTest >> methodWithTwoSendersModifiedSecond [

	| dict |
	dict := Dictionary new.
	dict yourself
]

{ #category : 'accessing' }
MyMTMessageSendToYourselfOperatorTest >> operator [

	^ MyMTMessageSendToYourselfOperator new
]
