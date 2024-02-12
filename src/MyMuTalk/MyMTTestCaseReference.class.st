Class {
	#name : 'MyMTTestCaseReference',
	#superclass : 'Object',
	#instVars : [
		'class',
		'selector',
		'lastTimeToRun'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'instance creation' }
MyMTTestCaseReference class >> for: aSelector in: aClass [ 
	^self new initializeFor: aSelector in: aClass
]

{ #category : 'instance creation' }
MyMTTestCaseReference class >> forTestCase: aTestCase [ 
	^self for: aTestCase selector in: aTestCase class
]

{ #category : 'comparing' }
MyMTTestCaseReference >> = anObject [

	self == anObject ifTrue: [ ^ true ].
	anObject species = self class ifFalse: [ ^ false ].
	self testCaseClass = anObject testCaseClass ifFalse: [ ^ false ].
	^ self selector = anObject selector
]

{ #category : 'comparing' }
MyMTTestCaseReference >> hash [

	^ selector hash + class hash
]

{ #category : 'initialize' }
MyMTTestCaseReference >> initializeFor: aSelector in: aClass [
	class := aClass.
	selector := aSelector.
]

{ #category : 'accessing' }
MyMTTestCaseReference >> lastTimeToRun [
	^ lastTimeToRun
]

{ #category : 'accessing' }
MyMTTestCaseReference >> method [
	
	^ class >> selector
]

{ #category : 'evaluating' }
MyMTTestCaseReference >> resources [
	^self testCase resources
]

{ #category : 'evaluating' }
MyMTTestCaseReference >> run [
	"kept for retrocompatibility"
	
	self deprecated: 'Use #runChecked instead.' transformWith: '`@receiver run' -> '`@receiver runChecked'.
	^ self runChecked
]

{ #category : 'evaluating' }
MyMTTestCaseReference >> run: aTestResult [
	^self testCase run: aTestResult
]

{ #category : 'evaluating' }
MyMTTestCaseReference >> runChecked [
	| result |	
	result := self runUnchecked.
	(result unexpectedFailureCount > 0 or: [ result unexpectedErrorCount > 0 ])
		ifTrue: [ MyMTTestsWithErrorsException signal ].
	^ result
]

{ #category : 'evaluating' }
MyMTTestCaseReference >> runUnchecked [

	| result |
	lastTimeToRun := [ result := self testCase run ] timeToRun.
	^ result
]

{ #category : 'accessing' }
MyMTTestCaseReference >> selector [

	^ selector
]

{ #category : 'evaluating' }
MyMTTestCaseReference >> testCase [
	^class selector: selector.
]

{ #category : 'accessing' }
MyMTTestCaseReference >> testCaseClass [

	^ class
]
