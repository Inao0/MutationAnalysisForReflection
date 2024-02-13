Class {
	#name : 'MyMTBudgetTest',
	#superclass : 'TestCase',
	#instVars : [
		'analysis'
	],
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'testing' }
MyMTBudgetTest class >> isAbstract [

	^ self == MyMTBudgetTest
]

{ #category : 'running' }
MyMTBudgetTest >> runAnalysisFor: aBudget [

	^ self
		  runAnalysisWithBudget: aBudget
		  on: { MyMTAuxiliarClassForMTAnalysis }
		  withTests: { MyMTAuxiliarClassForMTAnalysisTest }
]

{ #category : 'running' }
MyMTBudgetTest >> runAnalysisWithBudget: aBudget on: classesToMutate withTests: testCases [

	analysis := MyMTAnalysis new
		            testClasses: testCases;
		            classesToMutate: classesToMutate;
		            budget: aBudget.

	analysis run.
	^ analysis generalResult
]
