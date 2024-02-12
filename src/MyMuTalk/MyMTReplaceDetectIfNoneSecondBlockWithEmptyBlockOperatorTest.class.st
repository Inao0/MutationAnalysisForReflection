Class {
	#name : 'MyMTReplaceDetectIfNoneSecondBlockWithEmptyBlockOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceDetectIfNoneSecondBlockWithEmptyBlockOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^#(1) detect:[:each | true]  
]

{ #category : 'accessing' }
MyMTReplaceDetectIfNoneSecondBlockWithEmptyBlockOperatorTest >> methodWithOneSender [  
	^OrderedCollection new 
		detect: [:each | each notNil] 
		ifNone: [true]
]

{ #category : 'accessing' }
MyMTReplaceDetectIfNoneSecondBlockWithEmptyBlockOperatorTest >> methodWithOneSenderModified [
	^OrderedCollection new 
		detect: [:each | each notNil] 
		ifNone: []
]

{ #category : 'accessing' }
MyMTReplaceDetectIfNoneSecondBlockWithEmptyBlockOperatorTest >> methodWithTwoSenders [
	|collection|
	collection := OrderedCollection with: 1 with: 2.
	^collection 
		detect: [:number | 
			|anotherNumber|
			anotherNumber := collection 
							detect: [:otherNumber | number > otherNumber] 
							ifNone: [3].
			anotherNumber = 1] 
		ifNone: [0]
]

{ #category : 'accessing' }
MyMTReplaceDetectIfNoneSecondBlockWithEmptyBlockOperatorTest >> methodWithTwoSendersModifiedFirst [
	|collection|
	collection := OrderedCollection with: 1 with: 2.
	^collection 
		detect: [:number | 
			|anotherNumber|
			anotherNumber := collection 
							detect: [:otherNumber | number > otherNumber] 
							ifNone: [3].
			anotherNumber = 1] 
		ifNone: []
]

{ #category : 'accessing' }
MyMTReplaceDetectIfNoneSecondBlockWithEmptyBlockOperatorTest >> methodWithTwoSendersModifiedSecond [
	|collection|
	collection := OrderedCollection with: 1 with: 2.
	^collection 
		detect: [:number | 
			|anotherNumber|
			anotherNumber := collection 
							detect: [:otherNumber | number > otherNumber] 
							ifNone: [].
			anotherNumber = 1] 
		ifNone: [0]
]

{ #category : 'accessing' }
MyMTReplaceDetectIfNoneSecondBlockWithEmptyBlockOperatorTest >> operator [
	^ MyMTReplaceDetectIfNoneSecondBlockWithEmptyBlockOperator new
]
