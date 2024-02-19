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
		'allMutants',
		'callSiteCancellingAlive',
		'callSiteCancellingKilledOrTerminated',
		'dataStructure'
	],
	#category : 'MutationTestingForReflection',
	#package : 'MutationTestingForReflection'
}

{ #category : 'tests - printing' }
DynamicReflectionMutationAnalyser class >> duplicateMethodsWithReflectiveSelectors [

	| reflectiveSelectors duplicated nonDuplicated prefixedMethod allMethodsToDuplicate|

	reflectiveSelectors := ((((Pragma allNamed: 'reflection:') collect:
	                          #method) reject: #isFromTrait) collect:
	                        #selector) asSet.

	allMethodsToDuplicate := (reflectiveSelectors 
		                                flatCollect: #implementors) reject: #isFromTrait.
		
	allMethodsToDuplicate do: [ :method |
		prefixedMethod := method prefixedProxyMethod.
		prefixedMethod methodClass
			addSelectorSilently: prefixedMethod selector
			withMethod: prefixedMethod ]
]

{ #category : 'as yet unclassified' }
DynamicReflectionMutationAnalyser class >> percentageOfPolymorphismWithBaseLevel [

	| reflectiveSelectors baseLevelPoymorphicSelectors dueToRing dueToASTOrRingOrRefactoring percentageOfBaseLevelPolymorphism |
	reflectiveSelectors := ((((Pragma allNamed: 'reflection:') collect:
		                          #method) reject: #isFromTrait) collect:
		                        #selector) asSet.

	baseLevelPoymorphicSelectors := reflectiveSelectors
		                                select: [ :each |
			                                each implementors anySatisfy: [
				                                :imp |
				                                (imp pragmaAt: #reflection:) isNil ] ]
		                                thenCollect: [ :each |
			                                each
			                                ->
				                                (each implementors select: [ :imp |
					                                 (imp pragmaAt: #reflection:)
						                                 isNil ]) ].

	dueToRing := baseLevelPoymorphicSelectors select: [ :each |
		             each value allSatisfy: [ :meth |
			             meth package name includesSubstring: 'Ring' ] ].

	dueToASTOrRingOrRefactoring := baseLevelPoymorphicSelectors select: [
		                               :each |
		                               each value allSatisfy: [ :meth |
			                               (meth package name beginsWith: 'AST')
				                               or: [
					                               (meth package name
						                                includesSubstring: 'Ring') or: [
						                               meth package name
							                               includesSubstring: 'Refactoring' ] ] ] ].

	percentageOfBaseLevelPolymorphism := baseLevelPoymorphicSelectors
		                                     size / reflectiveSelectors size
	                                     * 100 asFloat.
	^ percentageOfBaseLevelPolymorphism
]

{ #category : 'tests - printing' }
DynamicReflectionMutationAnalyser class >> prefix [
	^ AddPrefixToSelectorsMutantOperator prefix
]

{ #category : 'tests - printing' }
DynamicReflectionMutationAnalyser class >> removeDuplicateMethodsWithPrefix [

	| allReflectiveMethods duplicated nonDuplicated prefixedMethod |
	duplicated := ((Pragma allNamed: 'prefixedReflectiveMethodProxy') collect:
		                         #method).
	duplicated do: [ :each | each methodClass removeSelector: each selector].
	
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

{ #category : 'visualization' }
DynamicReflectionMutationAnalyser >> buildDataStructureFromData [

	| callSiteCancellingMutantEvals addingMethodCancellingData  |
	dataStructure ifNotNil: [^dataStructure].  
	dataStructure := Dictionary new.
	callSiteCancellingMutantEvals := {
		                       callSiteCancellingAlive.
		                       callSiteCancellingKilledOrTerminated }
		                       flatCollect: [ :e | e ].
	callSiteCancellingMutantEvals do: [ :mutantEval |
		| callSiteDict |
		callSiteDict := dataStructure
			                at: mutantEval mutant operator oldSelector
			                ifAbsentPut: Dictionary new.
		callSiteDict
			at: mutantEval callSiteWithResult
			ifAbsentPut: IdentityDictionary new ].

	addingMethodCancellingData := [ :failedMethod :mutants |
	         | callSiteDict |
	         mutants ifNotEmpty: [
		         callSiteDict := dataStructure at: failedMethod selector.
		         mutants do: [ :mutant |
			         (callSiteDict at: mutant callSite)
				         at: failedMethod
				         put: mutant ] ] ].
	aliveMutants keysAndValuesDo: addingMethodCancellingData.
	killedOrTerminatedMutants keysAndValuesDo: addingMethodCancellingData.

	self assert: (dataStructure values allSatisfy: [ :each |
			 each keys allSatisfy: [ :e | e resultFromv1 isNotNil ] ]).
	"dataStructure values select: [ :each | each keys allSatisfy: [ :e | e resultFromv1 isNotNil] ]"
	^ dataStructure
]

{ #category : 'visualization' }
DynamicReflectionMutationAnalyser >> callSiteCoverageBySelectorsV1 [

	| chart lb methodNotCovered methodCovered legendDict groupedBySelectors methodNotCoveredBySelectors callSiteNotCoveredBySelectors coveredBySelectors |
	methodNotCovered := callSiteCancellingAlive select: [ :each |
		                    each runCount isZero ].
	methodCovered := callSiteCancellingAlive difference: methodNotCovered.
	legendDict := {
		              (#methodNotCovered -> 'Method not covered').
		              (#callSiteNotCovered -> 'Call-site not covered').
		              (#covered
		               -> 'Call-site Covered') } asDictionary.
	groupedBySelectors := (selectorsToMutate collect: [ :sel |
		                       sel -> {
			                       (#methodNotCovered
			                        -> (methodNotCovered select: [ :each |
					                         each mutant operator oldSelector = sel ])).
			                       (#callSiteNotCovered
			                        -> (methodCovered select: [ :each |
					                         each mutant operator oldSelector = sel ])).
			                       (#covered
			                        ->
				                        (callSiteCancellingKilledOrTerminated select: [ :each |
					                         each mutant operator oldSelector = sel ])) }
			                       asDictionary ]) asOrderedDictionary.
	chart := RSCompositeChart new.
	chart extent: 600 @ 300.
	methodNotCoveredBySelectors := ((groupedBySelectors collect: [ :each |
		                                each at: #methodNotCovered ]) values) collect: #size.
	callSiteNotCoveredBySelectors := ((groupedBySelectors collect: [ :each |
		                                  each at: #callSiteNotCovered ])
		                                 values) collect: #size.
	coveredBySelectors := ((groupedBySelectors collect: [ :each |
		                       each at: #covered ]) values) collect: #size.
	chart add: (RSAbstractChart barHeights: methodNotCoveredBySelectors).
	chart add:
		((RSAbstractChart barHeights: callSiteNotCoveredBySelectors)
			 bottom: methodNotCoveredBySelectors).
	chart add:
		((RSAbstractChart barHeights: coveredBySelectors)
			 bottom: methodNotCoveredBySelectors + callSiteNotCoveredBySelectors).
	chart horizontalTick fromNames: groupedBySelectors keys.
   chart horizontalTick useVerticalLabel.
	chart verticalTick integer.
	chart ylabel: 'Scores'.
	chart title: 'Scores by group of gender'.
	chart build.
	lb := RSLegend new.
	lb layout horizontal.
	#(#methodNotCovered #callSiteNotCovered #covered ) doWithIndex: [ :lbl :index |
		lb text: (legendDict at: lbl) withBoxColor: (chart plots at: index) computeColor ].
	lb container: chart canvas.
	lb build.
	chart canvas inspect.
	^ chart canvas
]

{ #category : 'visualization' }
DynamicReflectionMutationAnalyser >> callSiteCoverageBySelectorsV2 [

	| chart lb legendDict groupedBySelectors methodNotCoveredBySelectors callSiteNotCoveredBySelectors baseBySelectors polymorphicBySelectors reflectiveBySelector palette |
	self buildDataStructureFromData.
	legendDict := {
		              (#methodNotCovered -> 'Method not covered').
		              (#callSiteNotCovered -> 'Call-site not covered').
		              (#baseLevel -> 'Base Level').
						  (#polymorphism -> 'Polymorphic').
						  (#reflective -> 'Reflective level'). } asDictionary.
	
	palette := RSColorPalette sequential reflectivePalette.
	groupedBySelectors := Dictionary new.
	dataStructure keysAndValuesDo: [ :sel :callSites | |methodNotCovered callSiteNotCovered killedV1CallSites baseLevel NonBaseLevel reflective polymorphic|
		methodNotCovered := callSites keys select: [ :e |  e resultFromv1 runCount = 0  ].
	   callSiteNotCovered := callSites keys select: [ :e |  e resultFromv1 runCount > 0 and: [e resultFromv1 survived ]].
		killedV1CallSites := callSites keys select: [ :e |  e resultFromv1 runCount > 0 and: [e resultFromv1 survived not ]].
		baseLevel := killedV1CallSites select: [ :each | ((dataStructure at: each selector) at: each) allSatisfy: [:e | e survived ]].
		NonBaseLevel := killedV1CallSites difference: baseLevel.
		reflective :=  NonBaseLevel select: [ :each | |v1FailedTest|
		v1FailedTest := Dictionary newFrom: (each resultFromv1 result defects collect: [:e | (e asString) -> false]).
		((dataStructure at: each selector) at: each) do: [:e | e result defects do: [ :test |  v1FailedTest at: (test asString) put: true]].
		v1FailedTest values allSatisfy:[:e |e] 		
		].
		polymorphic := killedV1CallSites difference: (baseLevel union: reflective).
		groupedBySelectors at: sel put:
		 {(#methodNotCovered -> methodNotCovered).
			(#callSiteNotCovered -> callSiteNotCovered).
			(#baseLevel ->baseLevel).
			(#polymorphism -> polymorphic).
			(#reflective -> reflective )} asDictionary ]. 

	chart := RSCompositeChart new.
	chart extent: 600 @ 300.
	methodNotCoveredBySelectors := ((groupedBySelectors collect: [ :each |
		                                each at: #methodNotCovered ]) values) collect: #size.
	callSiteNotCoveredBySelectors := ((groupedBySelectors collect: [ :each |
		                                  each at: #callSiteNotCovered ])
		                                 values) collect: #size.
	baseBySelectors := ((groupedBySelectors collect: [ :each |
		                       each at: #baseLevel ]) values) collect: #size.
	polymorphicBySelectors := ((groupedBySelectors collect: [ :each |
		                       each at: #polymorphism ]) values) collect: #size.
	reflectiveBySelector := ((groupedBySelectors collect: [ :each |
		                       each at: #reflective ]) values) collect: #size.
	chart add: ((RSAbstractChart barHeights: methodNotCoveredBySelectors)
			color: (palette scale: #methodNotCovered)).
	chart add:
		((RSAbstractChart barHeights: callSiteNotCoveredBySelectors)
			color: (palette scale: #callSiteNotCovered);
			 bottom: methodNotCoveredBySelectors).
	chart add:
		((RSAbstractChart barHeights: baseBySelectors)
			color: (palette scale: #baseLevel);
			 bottom: callSiteNotCoveredBySelectors + methodNotCoveredBySelectors).
	chart add:
		((RSAbstractChart barHeights: polymorphicBySelectors )
			color: (palette scale: #polymorphism);
			 bottom: callSiteNotCoveredBySelectors + methodNotCoveredBySelectors + baseBySelectors ).
	chart add:
		((RSAbstractChart barHeights: reflectiveBySelector )
			color: (palette scale: #reflective);
			 bottom:  callSiteNotCoveredBySelectors + methodNotCoveredBySelectors + baseBySelectors + polymorphicBySelectors ).
			
	chart horizontalTick fromNames: groupedBySelectors keys.
   chart horizontalTick useVerticalLabel.
	chart verticalTick integer.
	chart ylabel: 'Nb of callsites'.
	chart title: 'Call-site analysis by selector'.
	chart build.
	lb := RSLegend new.
	lb layout horizontal.
	#(#methodNotCovered #callSiteNotCovered #baseLevel #polymorphism #reflective ) doWithIndex: [ :lbl :index |
		lb text: (legendDict at: lbl) withBoxColor: (palette scale: index)  ].
	lb container: chart canvas.
	lb build.
	chart canvas inspect.
	^ chart canvas
]

{ #category : 'visualization' }
DynamicReflectionMutationAnalyser >> callSiteCoveragePieChartV1 [

	| methodNotCovered methodCovered legendDict pie pieLabel pieTitle |
	methodNotCovered := callSiteCancellingAlive select: [ :each |
		                    each runCount isZero ].
	methodCovered := callSiteCancellingAlive difference: methodNotCovered.
	legendDict := {
		              (methodNotCovered -> 'Method not covered').
		              (methodCovered -> 'Call-site not covered').
		              (callSiteCancellingKilledOrTerminated
		               -> 'Call-site Covered') } asDictionary.

	pie := RSPie new
		       objects: {
				       methodNotCovered.
				       methodCovered.
				       callSiteCancellingKilledOrTerminated };
		       slice: #size;
		       yourself.
"	pie sliceColor: RSColorPalette sequential blues3."
	pie build.
	pie canvas zoomToFit.

	pieLabel := RSPieLabeledInteraction new.
	pieLabel labelShape
		fontSize: 10;
		fontName: 'Source Code Pro'.
	pieLabel
		labelColor: Color black;
		labelText: [ :obj | legendDict at: obj ];
		rotated;
		offset: 60.
	pieTitle := RSPieTitleInteraction new.
	pieTitle labelShape
		fontSize: 20;
		color: Color darkGray;
		position: 0 @ (pie canvas extent y / 2) negated.
	pieTitle labelText: 'Call-Sites Analysis'.


	pie shapes @ pieLabel.
	pie canvas @ pieTitle.
	pie canvas zoomToFit.

	pie canvas inspect.
]

{ #category : 'visualization' }
DynamicReflectionMutationAnalyser >> callSiteCoveragePieChartV2 [

	| methodNotCovered callSiteNotCovered killedV1CallSites baseLevel NonBaseLevel polymorphic reflective legendDict pie pieLabel pieTitle |
	self buildDataStructureFromData.
	methodNotCovered := dataStructure flatCollect: [ :each | each keys select: [ :e |  e resultFromv1 runCount = 0  ] ].
	callSiteNotCovered := dataStructure flatCollect: [ :each | each keys select: [ :e |  e resultFromv1 runCount > 0 and: [e resultFromv1 survived ]]].
	killedV1CallSites := dataStructure flatCollect: [ :each | each keys select: [ :e |  e resultFromv1 runCount > 0 and: [e resultFromv1 survived not ]]].
	baseLevel := killedV1CallSites select: [ :each | ((dataStructure at: each selector) at: each) allSatisfy: [:e | e survived ]].
	NonBaseLevel := killedV1CallSites difference: baseLevel.
	reflective :=  NonBaseLevel select: [ :each | |v1FailedTest|
		v1FailedTest := Dictionary newFrom: (each resultFromv1 result defects collect: [:e | (e asString) -> false]).
		((dataStructure at: each selector) at: each) do: [:e | e result defects do: [ :test |  v1FailedTest at: (test asString) put: true]].
		v1FailedTest values allSatisfy:[:e |e] 		
		].
	polymorphic := killedV1CallSites difference: (baseLevel union: reflective).
	legendDict := { methodNotCovered -> 'Method not covered' .
	 	callSiteNotCovered -> 'Callsite not covered' .
	 	baseLevel -> 'Base Level' .
	 	polymorphic -> 'Polymorphic' .
		reflective -> 'Reflective Level'} asDictionary.
	pie := RSPie new
		       objects: {
				       methodNotCovered.
				       callSiteNotCovered.
				       baseLevel.
				       polymorphic.
				       reflective };
		       slice: #size;
		       yourself.
	pie sliceColor: RSColorPalette sequential reflectivePalette.
	pie build.
	pie canvas zoomToFit.

	pieLabel := RSPieLabeledInteraction new.
	pieLabel labelShape
		fontSize: 10;
		fontName: 'Source Code Pro'.
	pieLabel
		labelColor: Color black;
		labelText: [ :obj | legendDict at: obj ];
		rotated;
		offset: 60.
	pieTitle := RSPieTitleInteraction new.
	pieTitle labelShape
		fontSize: 20;
		color: Color darkGray;
		position: 0 @ (pie canvas extent y / 2) negated.
	pieTitle labelText: 'Call-Sites Analysis'.


	pie shapes @ pieLabel.
	pie canvas @ pieTitle.
	pie canvas zoomToFit.
"	pie shapes
		select: [ :s | { baseLevel . polymorphic . reflective }  includes: s model]
		thenDo: [ :s | s emphasizeWith: 20 ]."
	pie canvas inspect.
]

{ #category : 'visualization' }
DynamicReflectionMutationAnalyser >> callSitesStats [

	| v1analyser pie methodNotCovered methodCovered pieLabel pieTitle legendDict |
	"callSiteCancellingKilledOrTerminated := nil. callSiteCancellingAlive:= nil
	"
	callSiteCancellingAlive ifNil: [
		dataStructure := nil.
		v1analyser := ReflectionMutationAnalyser new.
		v1analyser
			classesToStudy: classesToStudy;
			correspondingTests: correspondingTests;
			selectorsToMutate: selectorsToMutate.
		v1analyser run.

		callSiteCancellingAlive := v1analyser aliveMutants.
		callSiteCancellingKilledOrTerminated := v1analyser
			                                        killedOrTerminatedMutants ].
		"self callSiteCoveragePieChartV1.
		self callSiteCoverageBySelectorsV1."
		self callSiteCoveragePieChartV2.
		self callSiteCoverageBySelectorsV2.
	
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

{ #category : 'visualization' }
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

{ #category : 'matrix' }
DynamicReflectionMutationAnalyser >> matrix [

	| tests builder reflectiveMethods array reflectiveCategories |
	tests := (analysis testCases collect: [ :each | each testCase ])
		         groupedBy: [ :each | each class ].
	builder := RSHeatmap new.
	reflectiveMethods := dataStructure flatCollect: [ :each |
		                     each anyOne keys ].
	reflectiveCategories := reflectiveMethods groupedBy: [ :each |
		                        (each pragmaAt: #reflection:) argument ].
	builder objectsY: reflectiveCategories keys.
	builder objectsX: tests keys.
	array := (1 to: reflectiveMethods size) collect: [ :e |
		         Array new: tests size withAll: 0 ].
	reflectiveCategories keys withIndexDo: [ :cat :catIndex |
		| testsResults |
		tests keys withIndexDo: [ :testClass :testClassIndex |
			testsResults := ((tests at: testClass) collect: [ :t |
				                 t printString -> 0 ]) asDictionary.
			(reflectiveCategories at: cat) do: [ :method |
				(dataStructure at: method selector) do: [ :methodDict |
					(methodDict at: method) result defects do: [ :defect |
						testsResults
							at: defect printString
							ifPresent: [ testsResults at: defect printString put: 1 ] ] ] ].
			(array at: catIndex )
				at: testClassIndex
				put:
				((testsResults values sum / testsResults size) asFloat * 100)
					rounded ] ].
	builder dataMatrix: array.
	builder build.
	builder canvas zoomToFit.
	builder canvas inspect
	"	builder canvas exportToPDF"
]

{ #category : 'matrix' }
DynamicReflectionMutationAnalyser >> matrixByTest [
|tests builder reflectiveMethods array| 
	tests := analysis testCases collect: [:each | each testCase].
	builder := RSHeatmap new.
"	builder colorPalette: (NSScale linear
		range: {Color gray. Color purple muchDarker})."
	"builder labelShapeCell labelShape 
		border: (RSBorder new color: Color black; width: 0.3);
		color: Color white."
	reflectiveMethods := (dataStructure flatCollect: [ :each | each anyOne keys ]).
	builder objectsY: (reflectiveMethods collect: #printString).
	builder objectsX: tests. 
	array := (1 to: reflectiveMethods size) collect: [ :e | Array new: (tests size) withAll: 0].
	reflectiveMethods withIndexDo: [ :method :methodIndex| (dataStructure at: method selector) do: [:methodDict |
			tests withIndexCollect: [ :test :testIndex | 
			"	1 haltIf: [(methodDict at: method) killed].	"
				((methodDict at: method) result defects anySatisfy: [ :defect | "1 halt" defect selector = test selector and: [ defect class = test class ] ])
				ifTrue: [ (array at: (methodIndex))at: testIndex put: 1 ] ]]. ].
   builder dataMatrix: array.
	builder build.
	builder canvas zoomToFit.
	builder canvas inspect.
]

{ #category : 'matrix' }
DynamicReflectionMutationAnalyser >> matrixGroupedByTestClass [

	| tests builder reflectiveMethods array |
	tests := (analysis testCases collect: [ :each | each testCase ])
		         groupedBy: [ :each | each class ].
	builder := RSHeatmap new.
	reflectiveMethods := dataStructure flatCollect: [ :each |
		                     each anyOne keys ].
	builder objectsY: (reflectiveMethods collect: #printString).
	builder objectsX: tests keys.
	array := (1 to: reflectiveMethods size) collect: [ :e |
		         Array new: tests size withAll: 0 ].
	reflectiveMethods withIndexDo: [ :method :methodIndex |
		tests keys withIndexDo: [ :testClass :testClassIndex |
			| testsResults |
			testsResults := ((tests at: testClass) collect: [ :t |
				                 t printString -> 0 ]) asDictionary.
			(dataStructure at: method selector) do: [ :methodDict |
				(methodDict at: method) result defects do: [ :defect |
					testsResults
						at: defect printString
						ifPresent: [ testsResults at: defect printString put: 1 ] ] ].
			(array at: methodIndex) at: testClassIndex
				put: ((testsResults values sum / testsResults size) asFloat * 100)	rounded.
			 ] ].
	builder dataMatrix: array.
	builder build.
	builder canvas zoomToFit.
	builder canvas inspect.
	"builder canvas exportToPDF"
]

{ #category : 'accessing' }
DynamicReflectionMutationAnalyser >> numberOfClassesInProject [

	^ classesToStudy size
]

{ #category : 'as yet unclassified' }
DynamicReflectionMutationAnalyser >> numberOfStudiedCallSites [
	^ (dataStructure values flatCollect: #keys) size
]

{ #category : 'accessing' }
DynamicReflectionMutationAnalyser >> numberOfTestsInProject [

	^  correspondingTests asOrderedCollection sum: [ :each | each buildSuite tests size ]
]

{ #category : 'visualization' }
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

	^ self runWithTestResetBlock: [  ]
]

{ #category : 'running' }
DynamicReflectionMutationAnalyser >> runWithTestResetBlock: aBlockToResetTest [

	| mutations selectorImplementors allReflectiveMethods haltVar |
	dataStructure := nil.
	aliveMutants := IdentityDictionary new.
	killedOrTerminatedMutants := IdentityDictionary new.
	allMutants := IdentityDictionary new.
	haltVar := true.
	self class duplicateMethodsWithReflectiveSelectors.

	allReflectiveMethods := ((Pragma allNamed: 'reflection:') collect:
		                         #method) reject: #isFromTrait.
	analysis := MTAnalysis new
		            testClasses: correspondingTests;
		            classesToMutate: classesToStudy;
		            operators: {  };
		            testSelectionStrategy: MTSelectingFromCoverageTestSelectionStrategy new;
		yourself.
	analysis stopOnErrorOrFail: false.
	analysis run1InitialTestRunAndCoverage.
	analysis coverageAnalysisResult haltIfNil.
	Transcript crShow: '--- START ---'.
	selectorsToMutate do: [ :selector |
		Transcript crShow: selector.
		"self halt."
		analysis operators:
			{ (AddPrefixToSelectorsMutantOperator newWithSelector: selector) }.
		analysis run2GenerateMutations.
		"Filtering out mutation on our generated methods"
		analysis mutations: (analysis mutations reject: [:each | each originalMethod hasPragmaNamed: #prefixedReflectiveMethodProxy]).
		" WANavigationBar>>#renderContentOn:"
		"1 haltIf: [ selector = #numArgs ]."
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
			aBlockToResetTest value.
			analysis generateResults .
			"self haltIf: [ analysis generalResult killedOrTerminatedMutants isNotEmpty ]."
			aliveMutants at: selectorImplementor put: analysis generalResult aliveMutants copy.
			killedOrTerminatedMutants
				at: selectorImplementor
				put: analysis generalResult killedOrTerminatedMutants copy.
			newMethod := selectorImplementor prefixedProxyMethod.
			newMethod methodClass
				addSelectorSilently: newMethod selector
				withMethod: newMethod ] ].
	"Percentage of call sites covered by the tests for each selectors"
	self class removeDuplicateMethodsWithPrefix. 	Transcript crShow: '--- END ---'.
"	self callSitesStats.
	self percentageOfWorkingTestsAsSpiderChart"
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
