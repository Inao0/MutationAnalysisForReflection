Class {
	#name : 'MyMTAllTestsMethodsRunningTestSelectionStrategyTest',
	#superclass : 'MyMTTestSelectionStrategyTest',
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'testing' }
MyMTAllTestsMethodsRunningTestSelectionStrategyTest class >> isAbstract [
	^ false
]

{ #category : 'asserting' }
MyMTAllTestsMethodsRunningTestSelectionStrategyTest >> assertForAllMutants [
	self assert: testCases size equals: testCasesUsed size
]

{ #category : 'asserting' }
MyMTAllTestsMethodsRunningTestSelectionStrategyTest >> assertMutantInCoverageOfTestCase [
	self assertForAllMutants
]

{ #category : 'asserting' }
MyMTAllTestsMethodsRunningTestSelectionStrategyTest >> assertMutantNotInCoverage [
	self assertForAllMutants
]

{ #category : 'asserting' }
MyMTAllTestsMethodsRunningTestSelectionStrategyTest >> assertMutantNotInCoverageOfTest [
	self assertForAllMutants
]

{ #category : 'configuring' }
MyMTAllTestsMethodsRunningTestSelectionStrategyTest >> selectionStrategy [
	^ MyMTAllTestsMethodsRunningTestSelectionStrategy
]
