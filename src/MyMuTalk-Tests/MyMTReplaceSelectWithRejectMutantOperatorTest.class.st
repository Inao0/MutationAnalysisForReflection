Class {
	#name : 'MyMTReplaceSelectWithRejectMutantOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'accessing' }
MyMTReplaceSelectWithRejectMutantOperatorTest >> methodWithNoSenders [  
	^ 1 + 2
]

{ #category : 'accessing' }
MyMTReplaceSelectWithRejectMutantOperatorTest >> methodWithOneSender [  
	^OrderedCollection new 
		select: [:element | element notNil]
]

{ #category : 'accessing' }
MyMTReplaceSelectWithRejectMutantOperatorTest >> methodWithOneSenderModified [
	^OrderedCollection new 
		reject: [:element | element notNil]
]

{ #category : 'accessing' }
MyMTReplaceSelectWithRejectMutantOperatorTest >> methodWithTwoSenders [
	OrderedCollection new 
		select: [:element | element notNil].
	OrderedCollection new 
		select: [:element | element isNil]
]

{ #category : 'accessing' }
MyMTReplaceSelectWithRejectMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	OrderedCollection new 
		reject: [:element | element notNil].
	OrderedCollection new 
		select: [:element | element isNil]
]

{ #category : 'accessing' }
MyMTReplaceSelectWithRejectMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	OrderedCollection new 
		select: [:element | element notNil].
	OrderedCollection new 
		reject: [:element | element isNil]
]

{ #category : 'accessing' }
MyMTReplaceSelectWithRejectMutantOperatorTest >> operator [
	^ MyMTReplaceSelectWithRejectMutantOperator new
]
