Class {
	#name : 'MyMTTestSelectionStrategy',
	#superclass : 'Object',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'evaluating' }
MyMTTestSelectionStrategy >> testCasesToEvaluate: aMutation for: aMutantEvaluation [
	self subclassResponsibility
]

{ #category : 'evaluating' }
MyMTTestSelectionStrategy >> timeoutForTestsOf: aMutantEvaluation [
	^aMutantEvaluation coverageAnalysisResult timeToRunTests * 3
]
