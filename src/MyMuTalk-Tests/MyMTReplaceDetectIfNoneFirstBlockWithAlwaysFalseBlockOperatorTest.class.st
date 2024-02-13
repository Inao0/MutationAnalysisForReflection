Class {
	#name : 'MyMTReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'accessing' }
MyMTReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^#(1) detect:[:each | true]  
]

{ #category : 'accessing' }
MyMTReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperatorTest >> methodWithOneSender [  
	^OrderedCollection new 
		detect: [:each | each notNil] 
		ifNone: [true]
]

{ #category : 'accessing' }
MyMTReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperatorTest >> methodWithOneSenderModified [
		^OrderedCollection new 
		detect: [:each | false] 
		ifNone: [true]
]

{ #category : 'accessing' }
MyMTReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperatorTest >> methodWithTwoSenders [
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
MyMTReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperatorTest >> methodWithTwoSendersModifiedFirst [
	|collection|
	collection := OrderedCollection with: 1 with: 2.
	^collection 
		detect: [:each | false] 
		ifNone: [0]
]

{ #category : 'accessing' }
MyMTReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperatorTest >> methodWithTwoSendersModifiedSecond [
	|collection|
	collection := OrderedCollection with: 1 with: 2.
	^collection 
		detect: [:number | 
			|anotherNumber|
			anotherNumber := collection 
							detect: [:each | false] 
							ifNone: [3].
			anotherNumber = 1] 
		ifNone: [0]
]

{ #category : 'accessing' }
MyMTReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperatorTest >> operator [
	^ MyMTReplaceDetectIfNoneFirstBlockWithAlwaysFalseBlockOperator new
]
