Class {
	#name : 'MyMTSelectingFromCoverageMutantSelectionStrategy',
	#superclass : 'MyMTMutantSelectionStrategy',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'generating' }
MyMTSelectingFromCoverageMutantSelectionStrategy >> methodsToMutateFrom: aMutationTestingAnalysis [
	^aMutationTestingAnalysis coverageAnalysisResult coveredMethods.
]
