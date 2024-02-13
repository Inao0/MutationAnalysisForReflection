"
A CoveragePropagationPreparationTest is a test class for testing the behavior of CoveragePropagationPreparation
"
Class {
	#name : 'MyMTCoveragePropagationPreparationTest',
	#superclass : 'TestCase',
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'tests' }
MyMTCoveragePropagationPreparationTest >> testWorking [

	| analysis moreInfo mutant |
	analysis := MyMTAnalysis new
		            testClasses: { MyMTCIHelperTest };
		            classesToMutate: { MyMTCIHelper }.
	analysis run.

	moreInfo := MyMTCoveragePropagationPreparation new
		            mtResult: analysis;
		            prepare.
	self assert: moreInfo class equals: OrderedCollection.
	mutant := moreInfo detect: [ :item |
		          (item at: #mutationEvaluation) mutant operator class
		          = MyMTReplacePlusWithMinusMutantOperator ].
	self assert: (mutant at: #coveredBy) isNotEmpty.
	self assert: (mutant at: #testStateChangedIn) isNotEmpty
]
