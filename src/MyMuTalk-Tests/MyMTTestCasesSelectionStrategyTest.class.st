Class {
	#name : 'MyMTTestCasesSelectionStrategyTest',
	#superclass : 'TestCase',
	#instVars : [
		'resource'
	],
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'as yet unclassified' }
MyMTTestCasesSelectionStrategyTest >> allTestsFromPackage [

	^ ((MyMTTestClassForTestingCoverage class package) classes select: #isTestCase )
	  inject: OrderedCollection new
		  into: [ :tests :testClass |
			  tests addAll: testClass suite tests.
			  tests ]
]

{ #category : 'as yet unclassified' }
MyMTTestCasesSelectionStrategyTest >> allTestsIn: aCollection areIncludedIn: anotherCollection [

	^ ((aCollection collect: [ :testCase | testCase selector ]) 
		   includesAll:
		   (anotherCollection collect: [ :testCase | testCase selector ])) 
		  and: [ 
			  (anotherCollection collect: [ :testCase | testCase selector ]) 
				  includesAll:
				  (aCollection collect: [ :testCase | testCase selector ]) ]
]

{ #category : 'as yet unclassified' }
MyMTTestCasesSelectionStrategyTest >> testClassTestCaseSelectionStrategy [
	| testCase |
	testCase := MyMTTestClassForTestingCoverage selector: #testCase1.
	self
		assert: (self
				allTestsIn: (MyMTClassTestCasesSelectionStrategy new
						testCasesFor: (OrderedCollection with: testCase))
				areIncludedIn: MyMTTestClassForTestingCoverage suite tests)
]

{ #category : 'testing-class' }
MyMTTestCasesSelectionStrategyTest >> testClassTestCaseSelectionStrategyForEmptyTestSet [

	self assert: (MyMTClassTestCasesSelectionStrategy new testCasesFor: OrderedCollection new) isEmpty
]

{ #category : 'as yet unclassified' }
MyMTTestCasesSelectionStrategyTest >> testNoneTestCaseSelectionStrategy [

	| testCase |
	testCase := MyMTTestClassForTestingCoverage selector: #testCase1.
	self
		assert: (MyMTNoneTestCasesSelectionStrategy new testCasesFor:
				 (OrderedCollection with: testCase))
		equals: (OrderedCollection with: testCase)
]

{ #category : 'testing-none' }
MyMTTestCasesSelectionStrategyTest >> testNoneTestCaseSelectionStrategyForEmptyTestSet [

	self assert: (MyMTNoneTestCasesSelectionStrategy new testCasesFor:
			 OrderedCollection new) isEmpty
]

{ #category : 'as yet unclassified' }
MyMTTestCasesSelectionStrategyTest >> testPackageTestCaseSelectionStrategy [

	| testCase |
	testCase := MyMTTestClassForTestingCoverage selector: #testCase1.
	self assert: (self
			 allTestsIn:
				 (MyMTPackageTestCasesSelectionStrategy new testCasesFor:
					  (OrderedCollection with: testCase))
			 areIncludedIn: self allTestsFromPackage)
]

{ #category : 'testing-package' }
MyMTTestCasesSelectionStrategyTest >> testPackageTestCaseSelectionStrategyForEmptyTestSet [

	self assert: (MyMTPackageTestCasesSelectionStrategy new testCasesFor:
			 OrderedCollection new) isEmpty
]
