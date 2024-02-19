Class {
	#name : 'TestCaseWithResetForMuTalk',
	#superclass : 'TestCaseWithResetBlock',
	#category : 'MutationTestingForReflection',
	#package : 'MutationTestingForReflection'
}

{ #category : 'running' }
TestCaseWithResetForMuTalk >> initialize [ 
	super initialize.
	resetBlock := [ Transcript show: '.'.
		 AnalysisScripts resetMyMuTalkTestResources ]
	
]
