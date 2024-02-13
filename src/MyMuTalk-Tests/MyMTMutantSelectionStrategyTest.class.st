Class {
	#name : 'MyMTMutantSelectionStrategyTest',
	#superclass : 'TestCase',
	#instVars : [
		'resource'
	],
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'testing' }
MyMTMutantSelectionStrategyTest >> testSelectingFromCoverageMutantSelectionShouldOnlyMutateCoveredMethods [

	| classes mutationTestingAnalysis operator |
	classes := OrderedCollection with: MyMTAuxiliarClassForTestingStrategies.
	operator := MyMTReplaceIfTrueWithIfFalseMutantOperator new.
	mutationTestingAnalysis := MyMTAnalysis new
		                           testClasses:
			                           { MyMTAuxiliarTestClassForTestingStrategies };
		                           classesToMutate: classes;
		                           operators: (Set with: operator);
		                           mutantSelectionStrategy:
			                           MyMTSelectingFromCoverageMutantSelectionStrategy
				                           new.
	mutationTestingAnalysis run.
	self assert: ((mutationTestingAnalysis mutations collect: [ :each |
			  each originalMethod selector ]) includes: #method1).
	self deny: ((mutationTestingAnalysis mutations collect: [ :each |
			  each originalMethod selector ]) includes: #aNotCoveredMethod)
]
