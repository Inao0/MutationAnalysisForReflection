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
	#name : 'DynamicReflectionMutationAnalyser',
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

{ #category : 'tests - printing' }
DynamicReflectionMutationAnalyser class >> duplicateReflectiveMethodsWithPrefix [

	| allReflectiveMethods duplicated nonDuplicated prefixedMethod |
	allReflectiveMethods := ((Pragma allNamed: 'reflection:') collect:
		                         #method) reject: #isFromTrait.
	"duplicated  := ((Pragma allNamed: 'prefixedReflectiveMethodProxy') collect:
		                         #method) reject: #isFromTrait."
	" ((Pragma allNamed: 'prefixedReflectiveMethodProxy')
		                            collect: #method) reject: #isFromTrait."
	"nonDuplicated := allReflectiveMethods reject: [:each | (duplicated select: [ :d | d methodClass = each methodClass ] thenCollect: [:d | d selector]) includes: ( self prefix, each selector) ].
	nonDuplicated"
	allReflectiveMethods do: [ :method |
		prefixedMethod := method prefixedProxyMethod.
		prefixedMethod methodClass
			addSelectorSilently: prefixedMethod selector
			withMethod: prefixedMethod ]
]

{ #category : 'tests - printing' }
DynamicReflectionMutationAnalyser class >> prefix [
	^ AddPrefixToSelectorsMutantOperator prefix
]

{ #category : 'accessing' }
DynamicReflectionMutationAnalyser >> aliveMutants [

	^ analysis generalResult aliveMutants
]

{ #category : 'accessing' }
DynamicReflectionMutationAnalyser >> allMutants [

	| allMutants |
	allMutants := self aliveMutants copy.
	allMutants addAll: self killedOrTerminatedMutants.
	^ allMutants
]

{ #category : 'accessing' }
DynamicReflectionMutationAnalyser >> classesToStudy [

	^ classesToStudy
]

{ #category : 'accessing' }
DynamicReflectionMutationAnalyser >> classesToStudy: anObject [

	classesToStudy := anObject
]

{ #category : 'accessing' }
DynamicReflectionMutationAnalyser >> correspondingTests [

	^ correspondingTests
]

{ #category : 'accessing' }
DynamicReflectionMutationAnalyser >> correspondingTests: anObject [

	correspondingTests := anObject
]

{ #category : 'as yet unclassified' }
DynamicReflectionMutationAnalyser >> coverageOfCallSites [

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
DynamicReflectionMutationAnalyser >> exportForUpsetWithSuffix: aSuffix [

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
DynamicReflectionMutationAnalyser >> killedOrTerminatedMutants [

	^ killedOrTerminatedMutants ifNil: [
		  killedOrTerminatedMutants := analysis generalResult
			                               killedOrTerminatedMutants ]
]

{ #category : 'as yet unclassified' }
DynamicReflectionMutationAnalyser >> percentageOfWorkingTestsAsSpiderChart [
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
DynamicReflectionMutationAnalyser >> run [

	| mutations selectorImplementors allReflectiveMethods haltVar |
	alive := Dictionary new.
	killedTerminated := Dictionary new.
	allMutants := Dictionary new.
	haltVar := false.
	self class duplicateReflectiveMethodsWithPrefix.
	1 halt.

	allReflectiveMethods := ((Pragma allNamed: 'reflection:') collect:
		                         #method) reject: #isFromTrait.
	analysis := MutationTestingAnalysis
		            testCasesFrom: correspondingTests
		            mutating: classesToStudy
		            using: {  }
		            with: SelectingFromCoverageMutantEvaluationStrategy new.
	analysis run1InitialTestRunAndCoverage.
	Transcript crShow: '--- START ---'.
	selectorsToMutate do: [ :selector |
		Transcript crShow: selector.
		"self halt."
		analysis operators:
			{ (AddPrefixToSelectorsMutantOperator newWithSelector: selector) }.
		analysis run2GenerateMutations.
			
		selectorImplementors := allReflectiveMethods select: [ :each |
			                        each selector = selector ].
		selectorImplementors do: [ :selectorImplementor |
			| newMethod |
			newMethod := selectorImplementor prefixedFailingMethod.
			newMethod methodClass
				addSelectorSilently: newMethod selector
				withMethod: newMethod.
			Transcript crShow:
				(selectorImplementor methodClass asString , '>>' , selector).
			analysis run3GenerateResults.
			"self haltIf: [ haltVar ]."
			alive at: selectorImplementor put: analysis generalResult aliveMutants copy.
			killedTerminated
				at: selectorImplementor
				put: analysis generalResult killedOrTerminatedMutants copy.
			newMethod := selectorImplementor prefixedProxyMethod.
			newMethod methodClass
				addSelectorSilently: newMethod selector
				withMethod: newMethod ] ].
	"Percentage of call sites covered by the tests for each selectors"

	self coverageOfCallSites.
	self percentageOfWorkingTestsAsSpiderChart
]

{ #category : 'accessing' }
DynamicReflectionMutationAnalyser >> selectorsToMutate [

	^ selectorsToMutate
]

{ #category : 'accessing' }
DynamicReflectionMutationAnalyser >> selectorsToMutate: anObject [

	selectorsToMutate := anObject
]

{ #category : 'as yet unclassified' }
DynamicReflectionMutationAnalyser >> selectorsToMutateAuto [
	
	| reflectiveSelectors usedSelectors |
	reflectiveSelectors := ((((Pragma allNamed: 'reflection:') collect: #method) reject: #isFromTrait) collect: #selector) asSet.
	usedSelectors := classesToStudy flatCollect: [ :eachClass | eachClass methods flatCollect: #messages].
	selectorsToMutate := reflectiveSelectors select: [ :each | usedSelectors includes: each ] 
]
