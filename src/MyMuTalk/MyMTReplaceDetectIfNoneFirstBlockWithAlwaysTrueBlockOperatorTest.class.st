Class {
	#name : 'MyMTReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^#(1) detect:[:each | true]  
]

{ #category : 'accessing' }
MyMTReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperatorTest >> methodWithOneSender [  
	^OrderedCollection new 
		detect: [:each | each notNil] 
		ifNone: [true]
]

{ #category : 'accessing' }
MyMTReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperatorTest >> methodWithOneSenderModified [
		^OrderedCollection new 
		detect: [:each | true] 
		ifNone: [true]
]

{ #category : 'accessing' }
MyMTReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperatorTest >> methodWithTwoSenders [
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
MyMTReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperatorTest >> methodWithTwoSendersModifiedFirst [
	|collection|
	collection := OrderedCollection with: 1 with: 2.
	^collection 
		detect: [:each | true] 
		ifNone: [0]
]

{ #category : 'accessing' }
MyMTReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperatorTest >> methodWithTwoSendersModifiedSecond [
	|collection|
	collection := OrderedCollection with: 1 with: 2.
	^collection 
		detect: [:number | 
			|anotherNumber|
			anotherNumber := collection 
							detect: [:each | true] 
							ifNone: [3].
			anotherNumber = 1] 
		ifNone: [0]
]

{ #category : 'accessing' }
MyMTReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperatorTest >> operator [
	^ MyMTReplaceDetectIfNoneFirstBlockWithAlwaysTrueBlockOperator new
]
