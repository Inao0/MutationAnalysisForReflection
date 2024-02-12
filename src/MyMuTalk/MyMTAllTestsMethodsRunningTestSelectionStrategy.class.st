Class {
	#name : 'MyMTAllTestsMethodsRunningTestSelectionStrategy',
	#superclass : 'MyMTTestSelectionStrategy',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'private' }
MyMTAllTestsMethodsRunningTestSelectionStrategy >> testCasesToEvaluate: aMutation for: aMutantEvaluation [
	^aMutantEvaluation testCases.
	
]
