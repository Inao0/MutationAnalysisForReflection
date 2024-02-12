Class {
	#name : 'MyMTTestClassForTestingCoverage',
	#superclass : 'TestCase',
	#category : 'MyMuTalk-TestResources',
	#package : 'MyMuTalk-TestResources'
}

{ #category : 'as yet unclassified' }
MyMTTestClassForTestingCoverage class >> resources [

	^ Array with: MyMTTestResourceClassForTestingCoverage
]

{ #category : 'testing' }
MyMTTestClassForTestingCoverage >> testCase1 [
	self assert: MyMTClassForTestingCoverage new aCoveredMethod.
]

{ #category : 'testing' }
MyMTTestClassForTestingCoverage >> testCase2 [
	self assert: MyMTClassForTestingCoverage new aCoveredMethod.
]

{ #category : 'testing' }
MyMTTestClassForTestingCoverage >> testCase3 [
	self assert: true.
]

{ #category : 'testing' }
MyMTTestClassForTestingCoverage >> testCaseThatCoversAClassMethod [
	self assert: MyMTClassForTestingCoverage aClassCoveredMethod.
]
