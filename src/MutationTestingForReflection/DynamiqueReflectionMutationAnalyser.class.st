"
Script exemple :
```
analyser := ReflectionMutationAnalyser new.
analyser 
	classesToStudy:('MySTON' asPackage definedClasses reject: [ :each | each isTestCase ]);
	correspondingTests: ('MySTON' asPackage definedClasses select: [ :each | each isTestCase ]);
	selectorsToMutate: {#lookupClass: . #isMeta .#allSubclasses . #instVarNamed: . #instVarNamed:put: }.

analyser run.
analyser exportForUpsetWithSuffix: 'STON'.
```

"
Class {
	#name : 'DynamiqueReflectionMutationAnalyser',
	#superclass : 'Object',
	#instVars : [
		'selectorsToMutate',
		'classesToStudy',
		'correspondingTests',
		'analysis',
		'aliveMutants',
		'killedOrTerminatedMutants',
		'alive',
		'killedTerminated',
		'allMutants'
	],
	#category : 'MutationTestingForReflection',
	#package : 'MutationTestingForReflection'
}

{ #category : 'accessing' }
DynamiqueReflectionMutationAnalyser >> aliveMutants [

	^ aliveMutants ifNil: [
		  aliveMutants := analysis generalResult aliveMutants ]
]

{ #category : 'accessing' }
DynamiqueReflectionMutationAnalyser >> allMutants [

	| allMutants |
	allMutants := self aliveMutants copy.
	allMutants addAll: self killedOrTerminatedMutants.
	^ allMutants
]

{ #category : 'accessing' }
DynamiqueReflectionMutationAnalyser >> classesToStudy [

	^ classesToStudy
]

{ #category : 'accessing' }
DynamiqueReflectionMutationAnalyser >> classesToStudy: anObject [

	classesToStudy := anObject
]

{ #category : 'accessing' }
DynamiqueReflectionMutationAnalyser >> correspondingTests [

	^ correspondingTests
]

{ #category : 'accessing' }
DynamiqueReflectionMutationAnalyser >> correspondingTests: anObject [

	correspondingTests := anObject
]

{ #category : 'as yet unclassified' }
DynamiqueReflectionMutationAnalyser >> coverageOfCallSites [

	| coverage spiderChartCoveredSites |
	coverage := (self allMutants groupedBy: [ :each |
		             each mutant operator oldSelector ]) collect: [ :each |
		            (each count: [ :mutantEval |
			             mutantEval result runCount > 0 ]) / each size ].
	spiderChartCoveredSites := RSKiviat new.
	spiderChartCoveredSites
		minValue: 0;
		maxValue: 1.
	spiderChartCoveredSites addRow: coverage values.
	spiderChartCoveredSites axisNames: coverage keys.
	spiderChartCoveredSites build openWithTitle: 'Percentage of covered call sites per selector'.

]

{ #category : 'export' }
DynamiqueReflectionMutationAnalyser >> exportForUpsetWithSuffix: aSuffix [

	| setOfFailingTests testCases tests mutations coveredMutation mutationNames fileRef |
	coveredMutation := (self allMutants select: [ :each |
		                    each result runCount > 0 ]) groupedBy: [ :each |
		                   each mutant operator oldSelector ].
	setOfFailingTests := (self killedOrTerminatedMutants flatCollect: [
		                      :each |
		                      | testsThatDoNotPass |
		                      testsThatDoNotPass := each result errors copy.
		                      testsThatDoNotPass addAll:
			                      each result failures.
		                      testsThatDoNotPass ]) asSet.

	testCases := analysis testCases collect: #testCase.
	tests := testCases select: [ :test |
		         self killedOrTerminatedMutants anySatisfy: [ :mutant |
			         (mutant result errors anySatisfy: [ :e |
				          e class = test class and: [ e selector = test selector ] ])
				         or: [
					         mutant result failures anySatisfy: [ :e |
						         e class = test class and: [ e selector = test selector ] ] ] ] ].

	mutations := coveredMutation values asOrderedCollection flatCollect: [
		             :each | each ].
	mutationNames := mutations collect: [ :mutantEval |
		                 mutantEval mutant operator oldSelector asString
		                 , ' in '
		                 , mutantEval mutant originalClass printString
		                 , '>>'
		                 ,
		                 mutantEval mutant originalMethod selector
			                 printString ].
	mutationNames addFirst: nil.
	fileRef := ('MutationAnalysisResult-' , aSuffix , '.csv')
		           asFileReference.
	fileRef writeStreamDo: [ :stream |
		| writer |
		writer := NeoCSVWriter on: stream.
		writer separator: $;.
		writer writeHeader: mutationNames.
		tests do: [ :test |
			writer writeField: test.
			mutations do: [ :mutation |
				writer writeSeparator.
				((mutation result errors union: mutation result failures)
					 anySatisfy: [ :e |
					 e class = test class and: [ e selector = test selector ] ])
					ifTrue: [ writer writeRawField: 1 ]
					ifFalse: [ writer writeRawField: 0 ] ].
			writer writeEndOfLine ] ].
	^ fileRef
]

{ #category : 'accessing' }
DynamiqueReflectionMutationAnalyser >> killedOrTerminatedMutants [

	^ killedOrTerminatedMutants ifNil: [
		  killedOrTerminatedMutants := analysis generalResult
			                               killedOrTerminatedMutants ]
]

{ #category : 'as yet unclassified' }
DynamiqueReflectionMutationAnalyser >> percentageOfWorkingTestsAsSpiderChart [
	"Covered mutations grouped by selector compared to the whole list of tests. We want to be able to get a better of how each selector is impacting the WHOLE project and not only the tests it is part of."

	| coveredMutation spiderChartWorkingTests |
	coveredMutation := (self allMutants select: [ :each |
		                    each result runCount > 0 ]) groupedBy: [ :each |
		                   each mutant operator oldSelector ].

	spiderChartWorkingTests := RSKiviat new.
	spiderChartWorkingTests
		minValue: 0;
		maxValue: 1.
	spiderChartWorkingTests addRow: (coveredMutation collect: [ :col |
			 1 - ((col sum: [ :each |
				   each result errorCount + each result failureCount ])
			  / (analysis testCases size * col size)) ]) values.
	spiderChartWorkingTests axisNames:
		(coveredMutation keys collect: [ :each | 'Without ' , each ]).
	spiderChartWorkingTests build openWithTitle: 'Percentage of working tests per selector'.
]

{ #category : 'running' }
DynamiqueReflectionMutationAnalyser >> run [

	| mutations selectorImplementors allReflectiveMethods haltVar |
	alive := Dictionary new.
	killedTerminated := Dictionary new.
	allMutants := Dictionary new.
	haltVar := false.

	allReflectiveMethods := ((Pragma allNamed: 'reflection:') collect:
		                         #method) reject: #isFromTrait.
	selectorsToMutate do: [ :selector |
		mutations := AddPrefixToSelectorsMutantOperator newWithSelector:
			             selector.
		analysis := MutationTestingAnalysis
			            testCasesFrom: correspondingTests
			            mutating: classesToStudy
			            using: {mutations}
			            with: SelectingFromCoverageMutantEvaluationStrategy new.

		selectorImplementors := allReflectiveMethods select: [ :each |
			                        each selector = selector ].
		selectorImplementors do: [ :selectorImplementor |
			| newMethod |
			newMethod := selectorImplementor prefixedFailingMethod.
			newMethod methodClass
				addSelectorSilently: newMethod selector
				withMethod: newMethod.
			Transcript crShow: (selectorImplementor methodClass asString ,'>>', selector).
			"self haltIf: [ haltVar ]."
			analysis run.
			alive at: selectorImplementor put: self aliveMutants.
			killedTerminated
				at: selectorImplementor
				put: self killedOrTerminatedMutants.
			allMutants at: selectorImplementor put: self allMutants.
			newMethod := selectorImplementor prefixedProxyMethod.
			newMethod methodClass
				addSelectorSilently: newMethod selector
				withMethod: newMethod ] ].
	"Percentage of call sites covered by the tests for each selectors"

	self coverageOfCallSites.
	self percentageOfWorkingTestsAsSpiderChart
]

{ #category : 'accessing' }
DynamiqueReflectionMutationAnalyser >> selectorsToMutate [

	^ selectorsToMutate
]

{ #category : 'accessing' }
DynamiqueReflectionMutationAnalyser >> selectorsToMutate: anObject [

	selectorsToMutate := anObject
]
