Class {
	#name : 'MyMTTestSuiteWrappedForCoverage',
	#superclass : 'TestSuite',
	#instVars : [
		'coverageAnalysis'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'instance creation' }
MyMTTestSuiteWrappedForCoverage class >> for: aCoverageAnalysis named: aString [ 
	^self new initializeFor: aCoverageAnalysis named: aString.
]

{ #category : 'initialization' }
MyMTTestSuiteWrappedForCoverage >> initializeFor: aCoverageAnalysis named: aString [
	self name: aString.
	coverageAnalysis := aCoverageAnalysis.
]

{ #category : 'running' }
MyMTTestSuiteWrappedForCoverage >> run: aResult [ 
	self tests do: [:each |coverageAnalysis currentTest: each.
								self changed: each.
								each run: aResult.
								coverageAnalysis currentTest: nil]
				 displayingProgress: 'Analysing Coverage'.
]
