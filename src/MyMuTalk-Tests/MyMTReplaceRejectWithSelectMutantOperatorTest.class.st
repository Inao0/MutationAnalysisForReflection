Class {
	#name : 'MyMTReplaceRejectWithSelectMutantOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'accessing' }
MyMTReplaceRejectWithSelectMutantOperatorTest >> methodWithNoSenders [  
	^ 1 + 2
]

{ #category : 'accessing' }
MyMTReplaceRejectWithSelectMutantOperatorTest >> methodWithOneSender [  
	^OrderedCollection new 
		reject: [:element | element notNil]
]

{ #category : 'accessing' }
MyMTReplaceRejectWithSelectMutantOperatorTest >> methodWithOneSenderModified [
	^OrderedCollection new 
		select: [:element | element notNil]
]

{ #category : 'accessing' }
MyMTReplaceRejectWithSelectMutantOperatorTest >> methodWithTwoSenders [
	OrderedCollection new 
		reject: [:element | element notNil].
	OrderedCollection new 
		reject: [:element | element isNil]
]

{ #category : 'accessing' }
MyMTReplaceRejectWithSelectMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	OrderedCollection new 
		select: [:element | element notNil].
	OrderedCollection new 
		reject: [:element | element isNil]
]

{ #category : 'accessing' }
MyMTReplaceRejectWithSelectMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	OrderedCollection new 
		reject: [:element | element notNil].
	OrderedCollection new 
		select: [:element | element isNil]
]

{ #category : 'accessing' }
MyMTReplaceRejectWithSelectMutantOperatorTest >> operator [
	^ MyMTReplaceRejectWithSelectMutantOperator new
]
