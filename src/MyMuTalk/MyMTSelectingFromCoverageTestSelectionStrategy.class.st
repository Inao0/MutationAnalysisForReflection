Class {
	#name : 'MyMTSelectingFromCoverageTestSelectionStrategy',
	#superclass : 'MyMTTestSelectionStrategy',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'private' }
MyMTSelectingFromCoverageTestSelectionStrategy >> testCasesToEvaluate: aMutation for: aMutantEvaluation [  
	^ aMutantEvaluation coverageAnalysisResult testCasesThatCovers: aMutation originalMethod
]
