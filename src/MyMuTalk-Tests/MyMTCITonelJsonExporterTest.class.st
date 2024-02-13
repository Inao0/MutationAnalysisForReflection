"
A MutalkCITonelJsonExporterTest is a test class for testing the behavior of MutalkCITonelJsonExporter
"
Class {
	#name : 'MyMTCITonelJsonExporterTest',
	#superclass : 'TestCase',
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'tests' }
MyMTCITonelJsonExporterTest >> testWorking [
	"requires https://github.com/mabdi/smalltalk-SmallBank"

	| analysis json moreInfo |
	self skip.

	analysis := MyMTAnalysis new
		            testClasses: { SmallBankTest };
		            classesToMutate: { SmallBank }.
	analysis run.
	moreInfo := MyMTCoveragePropagationPreparation new
		            mtResult: analysis;
		            prepare.
	json := MyMTCITonelJsonExporter new
		        mtResult: analysis;
		        coverageInfo: moreInfo;
		        cloneLocation: FileLocator localDirectory fullName
			        , '/iceberg/mabdi/smalltalk-smallbank';
		        root: 'src';
		        export.
	self assert: json class equals: '' class
]
