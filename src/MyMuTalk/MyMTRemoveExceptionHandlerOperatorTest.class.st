Class {
	#name : 'MyMTRemoveExceptionHandlerOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTRemoveExceptionHandlerOperatorTest >> methodWithNoSenders [  
	"[x y] on:E do:[:e| b] "
	OrderedCollection new do: [:elem | elem notNil]
]

{ #category : 'accessing' }
MyMTRemoveExceptionHandlerOperatorTest >> methodWithOneSender [  
	^[1 /0] on:Exception do:[:ex | Transcript show: 'error'].
]

{ #category : 'accessing' }
MyMTRemoveExceptionHandlerOperatorTest >> methodWithOneSenderModified [
	^[1 /0] value 
]

{ #category : 'accessing' }
MyMTRemoveExceptionHandlerOperatorTest >> methodWithTwoSenders [
	[self error:'an error'] on:Exception do:[:ex | Transcript show: 'error'].
	^[1 /0] on:Exception do:[:ex | Transcript show: 'error'].
]

{ #category : 'accessing' }
MyMTRemoveExceptionHandlerOperatorTest >> methodWithTwoSendersModifiedFirst [
	[self error:'an error'.] value.
	^[1 /0] on:Exception do:[:ex | Transcript show: 'error'].
]

{ #category : 'accessing' }
MyMTRemoveExceptionHandlerOperatorTest >> methodWithTwoSendersModifiedSecond [
	[self error:'an error'] on:Exception do:[:ex | Transcript show: 'error'].
	^[1 /0] value
]

{ #category : 'accessing' }
MyMTRemoveExceptionHandlerOperatorTest >> operator [
	^ MyMTRemoveExceptionHandlerOperator new
]
