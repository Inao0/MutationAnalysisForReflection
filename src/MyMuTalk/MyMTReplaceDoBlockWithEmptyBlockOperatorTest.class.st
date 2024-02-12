Class {
	#name : 'MyMTReplaceDoBlockWithEmptyBlockOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceDoBlockWithEmptyBlockOperatorTest >> methodWithNoSenders [  
	^ 1 + 2
]

{ #category : 'accessing' }
MyMTReplaceDoBlockWithEmptyBlockOperatorTest >> methodWithOneSender [  
	^OrderedCollection new 
		do: [:element | element notNil]
]

{ #category : 'accessing' }
MyMTReplaceDoBlockWithEmptyBlockOperatorTest >> methodWithOneSenderModified [
	^OrderedCollection new 
		do: [:each | ]
]

{ #category : 'accessing' }
MyMTReplaceDoBlockWithEmptyBlockOperatorTest >> methodWithTwoSenders [
	OrderedCollection new 
		do: [:element | element notNil].
	OrderedCollection new 
		do: [:element | element isNil]
]

{ #category : 'accessing' }
MyMTReplaceDoBlockWithEmptyBlockOperatorTest >> methodWithTwoSendersModifiedFirst [
	OrderedCollection new 
		do: [:each | ].
	OrderedCollection new 
		do: [:element | element isNil]
]

{ #category : 'accessing' }
MyMTReplaceDoBlockWithEmptyBlockOperatorTest >> methodWithTwoSendersModifiedSecond [
	OrderedCollection new 
		do: [:element | element notNil].
	OrderedCollection new 
		do: [:each | ]
]

{ #category : 'accessing' }
MyMTReplaceDoBlockWithEmptyBlockOperatorTest >> operator [
	^ MyMTReplaceDoBlockWithEmptyBlockOperator new
]
