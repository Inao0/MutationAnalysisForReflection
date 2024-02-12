Class {
	#name : 'MyMTTestCasesSelectionStrategy',
	#superclass : 'Object',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'printing' }
MyMTTestCasesSelectionStrategy >> description [
	self subclassResponsibility
]

{ #category : 'selecting' }
MyMTTestCasesSelectionStrategy >> testCasesFor: aTestCollection [ 
	self subclassResponsibility
]

{ #category : 'selecting' }
MyMTTestCasesSelectionStrategy >> testCasesFromReferencies: aTestReferenceCollection [
	"Applies the testCase Selection from a collection of TestCaseReferences and return a collection of TestCaseRefereces."

	| testCases selectedTestCases |
	testCases := aTestReferenceCollection collect: [ :testReference |
		             testReference testCase ].
	selectedTestCases := self testCasesFor: testCases.
	^ selectedTestCases collect: [ :testCase |
		  MyMTTestCaseReference forTestCase: testCase ]
]
