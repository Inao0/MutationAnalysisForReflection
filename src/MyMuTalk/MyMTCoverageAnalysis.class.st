Class {
	#name : 'MyMTCoverageAnalysis',
	#superclass : 'Object',
	#instVars : [
		'classes',
		'result',
		'classesAndMetaclasses',
		'testCases',
		'currentTest',
		'testRunningElapsedTime'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'instance creation' }
MyMTCoverageAnalysis class >> for: aCollectionOfClasses running: aCollectionOfTestCases [
	^self new initializeFor: aCollectionOfClasses running: aCollectionOfTestCases
]

{ #category : 'private' }
MyMTCoverageAnalysis >> addTestsFrom: aWrapper to: methodToTestDictionary [ 
	aWrapper tests notEmpty
		ifTrue: [(methodToTestDictionary
				at: aWrapper reference compiledMethod
				ifAbsentPut: [IdentitySet new])
				addAll: aWrapper tests]
]

{ #category : 'private' }
MyMTCoverageAnalysis >> classesAndMetaclasses [
	classesAndMetaclasses isNil ifTrue:[
		classesAndMetaclasses := (classes collect:[:aClass | aClass class]) asOrderedCollection.
		classesAndMetaclasses addAll: classes.].
	^classesAndMetaclasses.

]

{ #category : 'accessing' }
MyMTCoverageAnalysis >> currentTest [
	^ currentTest 
]

{ #category : 'private' }
MyMTCoverageAnalysis >> currentTest: aTestCase [
	currentTest := aTestCase.
]

{ #category : 'private' }
MyMTCoverageAnalysis >> flushMethodLookupCaches [
	Behavior flushCache.
	
]

{ #category : 'initialize-release' }
MyMTCoverageAnalysis >> initializeFor: aCollectionOfClasses running: aCollectionOfTestCases [ 
	classes := aCollectionOfClasses. 
	testCases := aCollectionOfTestCases
]

{ #category : 'private' }
MyMTCoverageAnalysis >> installAll: wrappers [ 
	wrappers do: [ :each | each install ]
]

{ #category : 'private' }
MyMTCoverageAnalysis >> methodReferences [
	^ self classesAndMetaclasses
		inject: OrderedCollection new
		into: [:methodReferences :aClass | 
			methodReferences
				addAll: (aClass selectors
						collect: [:aSelector | RGMethodDefinition class: aClass selector: aSelector]).
			methodReferences]
]

{ #category : 'private' }
MyMTCoverageAnalysis >> methodToTestDictionaryFrom: wrappers [ 
	^ wrappers
		inject: IdentityDictionary new
		into: [:methodToTestDictionary :aWrapper | 
			self addTestsFrom: aWrapper to: methodToTestDictionary.
			methodToTestDictionary]
]

{ #category : 'private' }
MyMTCoverageAnalysis >> methodWrappersFor: methodReferences [ 
	^ methodReferences collect: [ :each | MyMTMethodWrapperForCoverage on: each for: self ]
]

{ #category : 'accessing' }
MyMTCoverageAnalysis >> result [
	^result
]

{ #category : 'evaluating' }
MyMTCoverageAnalysis >> run [

	| wrappers methodReferences |
	methodReferences := self methodReferences.
	wrappers := self methodWrappersFor: methodReferences.
	self runTestsInstalling: wrappers.
	result := MyMTCoverageAnalysisResult
		          from: (self methodToTestDictionaryFrom: wrappers)
		          elapsedTime: testRunningElapsedTime.
	result methodReferences: (self classesAndMetaclasses flatCollect: [:cls | cls methods])
]

{ #category : 'private' }
MyMTCoverageAnalysis >> runTests [

	testRunningElapsedTime := [
	                          | suite |
	                          suite := MyMTTestSuiteWrappedForCoverage
		                                   for: self
		                                   named: 'Test Suite for Coverage'.
	                          suite addTests: testCases.
	                          suite run ] timeToRun
]

{ #category : 'private' }
MyMTCoverageAnalysis >> runTestsInstalling: wrappers [ 
	[self installAll: wrappers.
	self flushMethodLookupCaches.
	self runTests]
		ensure: [self uninstallAll: wrappers]
]

{ #category : 'private' }
MyMTCoverageAnalysis >> uninstallAll: wrappers [ 
	^ wrappers do: [ :each | each uninstall ]
]
