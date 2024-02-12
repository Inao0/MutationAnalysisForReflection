Class {
	#name : 'MyMTTestFilterTest',
	#superclass : 'TestCase',
	#instVars : [
		'analysis'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'testing' }
MyMTTestFilterTest class >> isAbstract [

	^ self == MyMTTestFilterTest
]

{ #category : 'running' }
MyMTTestFilterTest >> runAnalysisWithFilter: aTestFilter on: classesToMutate withTests: testCases [

	analysis := MyMTAnalysis new
		            testClasses: testCases;
		            classesToMutate: classesToMutate;
		            testFilter: aTestFilter.

	analysis run
]
