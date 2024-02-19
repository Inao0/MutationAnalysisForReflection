Class {
	#name : 'TestCaseWithResetForSeaside',
	#superclass : 'TestCaseWithResetBlock',
	#category : 'MutationTestingForReflection',
	#package : 'MutationTestingForReflection'
}

{ #category : 'running' }
TestCaseWithResetForSeaside >> initialize [ 
	super initialize.
	resetBlock := [ Transcript show: '.'.
		 AnalysisScripts resetSeasideTestResources ]
	
]
