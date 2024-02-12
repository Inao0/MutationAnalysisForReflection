Class {
	#name : 'MyMTStubbornOnlyMutantSelectionStrategy',
	#superclass : 'MyMTSelectingFromCoverageMutantSelectionStrategy',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'generating' }
MyMTStubbornOnlyMutantSelectionStrategy >> mutationsFor: aMutationTestingAnalysis loggingIn: aLogger [

	| mutations subSuite trivialAnalysis |
	mutations := super mutationsFor: aMutationTestingAnalysis loggingIn: aLogger.
	
	
	1halt.
	subSuite := MyMTCoverageTestSuiteSelector new
		selectTestsFrom: aMutationTestingAnalysis.
	
	"subSuite := (1 to: 15) collect: [ :e | aMutationTestingAnalysis testCases atRandom ]."
	trivialAnalysis := aMutationTestingAnalysis copy.
	trivialAnalysis
		testClasses: subSuite;
		mutations: mutations;
		testSelectionStrategy: MyMTAllTestsMethodsRunningTestSelectionStrategy new.
	trivialAnalysis generateResults.
	1halt.
	
	^ mutations
]
