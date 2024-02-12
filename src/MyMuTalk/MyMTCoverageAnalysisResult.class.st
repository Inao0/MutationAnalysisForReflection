Class {
	#name : 'MyMTCoverageAnalysisResult',
	#superclass : 'Object',
	#instVars : [
		'methodToTestDictionary',
		'timeToRunTests',
		'methodReferences'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'instance creation' }
MyMTCoverageAnalysisResult class >> from: aDictionaryOfMethodToTestCasesRelations [ 
	^self new initializeFrom: aDictionaryOfMethodToTestCasesRelations.
]

{ #category : 'instance creation' }
MyMTCoverageAnalysisResult class >> from: aDictionaryOfMethodToTestCasesRelations elapsedTime: aTimeToRunTests [
	^self new initializeFrom: aDictionaryOfMethodToTestCasesRelations elapsedTime: aTimeToRunTests.
]

{ #category : 'api' }
MyMTCoverageAnalysisResult >> coveragePerTest: aMutationTestingAnalysis [
	
	| coveragePerTest |
	coveragePerTest := Dictionary new.
	aMutationTestingAnalysis testCases do: [ :testcase | | coveredMethods |
		coveredMethods := methodToTestDictionary associations
			select: [ :association | association value includes: testcase ]
			thenCollect: #key.
		coveragePerTest
			at: testcase
			put: coveredMethods
	].
	^ coveragePerTest
]

{ #category : 'accessing' }
MyMTCoverageAnalysisResult >> coveredMethods [
	^methodToTestDictionary keys asIdentitySet. "select:[:each | (methodToTestDictionary at:each) notEmpty]."
]

{ #category : 'initialize-release' }
MyMTCoverageAnalysisResult >> initializeFrom: aDictionaryOfMethodToTestCasesRelations [ 
	methodToTestDictionary := aDictionaryOfMethodToTestCasesRelations
]

{ #category : 'initialize-release' }
MyMTCoverageAnalysisResult >> initializeFrom: aDictionaryOfMethodToTestCasesRelations elapsedTime: aTimeToRunTests [
	methodToTestDictionary := aDictionaryOfMethodToTestCasesRelations.
	timeToRunTests := aTimeToRunTests.
]

{ #category : 'accessing' }
MyMTCoverageAnalysisResult >> methodReferences [

	^ methodReferences
]

{ #category : 'accessing' }
MyMTCoverageAnalysisResult >> methodReferences: anObject [

	methodReferences := anObject
]

{ #category : 'accessing' }
MyMTCoverageAnalysisResult >> testCasesThatCovers: aCompiledMethod [ 
	^methodToTestDictionary at:aCompiledMethod ifAbsent:[OrderedCollection new.].
]

{ #category : 'accessing' }
MyMTCoverageAnalysisResult >> timeToRunTests [
	^timeToRunTests
]

{ #category : 'accessing' }
MyMTCoverageAnalysisResult >> uncoveredMethods [

	^ (self methodReferences reject: #isSubclassResponsibility) asSet difference: self coveredMethods
]
