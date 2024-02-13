Class {
	#name : 'MyMTTestCoverageAnalysis',
	#superclass : 'TestCase',
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'testing' }
MyMTTestCoverageAnalysis >> testBugWhenHavingATestResourceSendingToOther [
	"the problem was when sending from a resource a message to another object wich class is going to be considered for coverage"
	| analysis testCases|
	analysis := MyMTCoverageAnalysis
		for: (Array with: MyMTClassForTestingCoverage with:MyMTTestResourceClassForTestingCoverage)
		running: MyMTTestClassForTestingCoverage suite tests.
	analysis run.
	testCases := analysis result testCasesThatCovers: MyMTClassForTestingCoverage class >> #aClassCoveredMethod.
	
	self assert: ((testCases collect: [:each | each selector]) includes:#testCaseThatCoversAClassMethod).


]

{ #category : 'testing' }
MyMTTestCoverageAnalysis >> testCoveredMethods [

	| analysis |
	analysis := MyMTCoverageAnalysis
		            for: (Array with: MyMTClassForTestingCoverage)
		            running: MyMTTestClassForTestingCoverage suite tests.
	analysis run.

	self assert: (analysis result coveredMethods includes:
			 MyMTClassForTestingCoverage >> #aCoveredMethod).
	self deny: (analysis result coveredMethods includes:
			 MyMTClassForTestingCoverage >> #anUncoveredMethod).
	self assert: (analysis result uncoveredMethods includes:
			 MyMTClassForTestingCoverage >> #anUncoveredMethod).
	self deny: (analysis result uncoveredMethods includes:
			 MyMTClassForTestingCoverage >> #aCoveredMethod).
	self deny: (analysis result uncoveredMethods includes:
			 MyMTClassForTestingCoverage >> #anUncoveredMethodSubClassResponsibility)		
]

{ #category : 'testing' }
MyMTTestCoverageAnalysis >> testGettingTheTestCasesThatCoverAClassMethod [
	| analysis testCases|
	analysis := MyMTCoverageAnalysis
		for: (Array with: MyMTClassForTestingCoverage)
		running: MyMTTestClassForTestingCoverage suite tests.
	analysis run.
	testCases := analysis result testCasesThatCovers: MyMTClassForTestingCoverage class >> #aClassCoveredMethod.
	
	self assert: ((testCases collect: [:each | each selector]) includes:#testCaseThatCoversAClassMethod).


]

{ #category : 'testing' }
MyMTTestCoverageAnalysis >> testGettingTheTestCasesThatCoverAMethod [
	| analysis testCases|

	analysis := MyMTCoverageAnalysis 
		for: (Array with: MyMTClassForTestingCoverage)
		running: MyMTTestClassForTestingCoverage suite tests.
	analysis run.
	testCases := analysis result testCasesThatCovers: MyMTClassForTestingCoverage >> #aCoveredMethod.
	self assert: ((testCases collect: [:each | each selector]) includes:#testCase1).
	self deny: ((testCases collect: [:each | each selector]) includes:#testCase3).
]
