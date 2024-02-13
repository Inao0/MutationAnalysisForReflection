Class {
	#name : 'MyMTSelectingFromCoverageTestSelectionStrategyTest',
	#superclass : 'MyMTTestSelectionStrategyTest',
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'testing' }
MyMTSelectingFromCoverageTestSelectionStrategyTest class >> isAbstract [
	^ false
]

{ #category : 'asserting' }
MyMTSelectingFromCoverageTestSelectionStrategyTest >> assertMutantInCoverageOfTestCase [
	self assert: ((testCases collect: [ :each | each selector ]) includes: #testMethodThatCoverMethod1)
]

{ #category : 'asserting' }
MyMTSelectingFromCoverageTestSelectionStrategyTest >> assertMutantNotInCoverage [
	self assert: testCases isEmpty
]

{ #category : 'asserting' }
MyMTSelectingFromCoverageTestSelectionStrategyTest >> assertMutantNotInCoverageOfTest [
	self deny: ((testCases collect: [ :each | each selector ]) includes: #testMethodThatCoverMethod2)
]

{ #category : 'configuring' }
MyMTSelectingFromCoverageTestSelectionStrategyTest >> selectionStrategy [
	^ MyMTSelectingFromCoverageTestSelectionStrategy
]
