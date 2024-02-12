Class {
	#name : 'MyMTAnalysisLoggerTest',
	#superclass : 'TestCase',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'testing' }
MyMTAnalysisLoggerTest >> testExecutingSimpleMutation [

	| analysis logger operator |
	logger := MyMTMockMTAnalysisLogger new.
	operator := MyMTReplacePlusWithMinusMutantOperator new.
	analysis := MyMTAnalysis new
		            testClasses:
			            (Array with: MyMTAuxiliarClassForMTAnalysisTest);
		            classesToMutate:
			            (Array with: MyMTAuxiliarClassForMTAnalysis);
		            operators: (Array with: operator);
		            logger: logger.
	analysis run.
	self assert: logger loggedStartAnalysis.
	self assert: (logger
			 loggedStartBuildingMutationsFor:
			 MyMTAuxiliarClassForMTAnalysis >> #methodWithOnePlusSender
			 using: operator).
	self assert: (logger loggedStartMutantEvaluationForMutationOf:
			 MyMTAuxiliarClassForMTAnalysis >> #methodWithOnePlusSender)
]
