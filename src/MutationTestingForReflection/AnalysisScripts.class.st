Class {
	#name : 'AnalysisScripts',
	#superclass : 'Object',
	#classInstVars : [
		'resetMuTalkDict'
	],
	#category : 'MutationTestingForReflection',
	#package : 'MutationTestingForReflection'
}

{ #category : 'as yet unclassified' }
AnalysisScripts class >> resetMyMuTalkTestResources [

	"resetMuTalkDict := nil"

	resetMuTalkDict ifNil: [
		resetMuTalkDict := Dictionary new.
		resetMuTalkDict 
			at: ( MyMTAuxiliarClassForMTAnalysis -> #anotherMethodWithOneIfFalseSender)
			put: (OpalCompiler new parse: 'anotherMethodWithOneIfFalseSender
	false ifFalse: [ ^ 1 ].
	^ 2') generateMethod.
		resetMuTalkDict 
			at: ( MyMTAuxiliarClassForMTAnalysis -> #methodWithOneIfFalseSender)
			put: (OpalCompiler new parse: 'methodWithOneIfFalseSender
	true ifFalse: [ ^ 1 ].
	^ 2') generateMethod.
		resetMuTalkDict 
			at: ( MyMTAuxiliarClassForMTAnalysis -> #methodWithOneIfTrueSender)
			put: (OpalCompiler new parse: 'methodWithOneIfTrueSender
	true ifTrue: [ ^ 1 ].
	^ 2') generateMethod.
		resetMuTalkDict 
			at: ( MyMTAuxiliarClassForMTAnalysis -> #methodWithOnePlusSender)
			put: (OpalCompiler new parse: 'methodWithOnePlusSender
	^ 1 + 2') generateMethod.
		resetMuTalkDict 
			at: (MyMTAuxiliarClassForMTAnalysis -> #methodWithTwoMinusSenders)
			put: (OpalCompiler new parse: 'methodWithTwoMinusSenders
	^ 1 - 2 - 3') generateMethod.
		resetMuTalkDict 
			at: (MyMTAuxiliarClassForTimeTestFilter -> #simpleMethod)
			put: (OpalCompiler new parse: 'simpleMethod
	^ 1 + 1 ') generateMethod.
		resetMuTalkDict 
			at: (MyMTFakeInfiniteLoopForTest -> #iterativeFactorial:)
			put: (OpalCompiler new parse: 'iterativeFactorial: anInt

	| factorial i |
	^ anInt = 1
		  ifTrue: [ 1 ]
		  ifFalse: [ 
			  factorial := 1.
			  i := 2.
			  "Use a whileTrue: so a mutation can introduce an infinite loop here"
			  [ i <= anInt ] whileTrue: [ 
				  factorial := factorial * i.
				  i := i + 1 ].
			  factorial ]') generateMethod.
		resetMuTalkDict 
			at: (MyMTFakeInfiniteLoopForTest -> #recursiveFactorial:)
			put: (OpalCompiler new parse: 'recursiveFactorial: anInt

	"If a mutation replaces this cut condition to false, this will loop"
	anInt = 1 ifTrue: [ ^ 1 ].

	^ anInt * (self recursiveFactorial: anInt - 1)') generateMethod.
		resetMuTalkDict 
			at: (MyMTAuxiliarClassForMatrix -> #reset)
			put: (OpalCompiler new
					 class: MyMTAuxiliarClassForMatrix;
					 parse: 'reset
| count |
	count := counter.
	counter := 0.
	^ count') generateMethod.
		resetMuTalkDict 
			at: (MyMTAuxiliarClassForTestingStrategies -> #method1)
			put: (OpalCompiler new parse: 'method1
true ifTrue: [ ^ 1 ]') generateMethod.
		resetMuTalkDict 
			at: (MyMTAuxiliarClassForMTAnalysis class -> #classMethodThatSendsSelect)
			put: (OpalCompiler new
					 class: MyMTAuxiliarClassForMTAnalysis class;
					 parse: 'classMethodThatSendsSelect
	| collection |
	collection := OrderedCollection with: 1.
	^ collection select: [ :item | item = 1 ]') generateMethod.
		resetMuTalkDict 
			at: (MyMTCIHelper->#myRandom)
			put: (OpalCompiler new
					 class: MyMTCIHelper;
					 parse: 'myRandom

	^ myRandom') generateMethod.
		resetMuTalkDict 
			at: (MyMTCIHelper->#myObject)
			put: (OpalCompiler new
					 class: MyMTCIHelper;
					 parse: 'myObject

	^ myObject') generateMethod.
		resetMuTalkDict 
			at: (MyMTCIHelper->#myLiteral)
			put: (OpalCompiler new
					 class: MyMTCIHelper;
					 parse: 'myLiteral

	^ myLiteral') generateMethod ].

	MyMTAuxiliarTestClassForContinuingTestsExecutionAfterFirstFail reset.
	resetMuTalkDict keysAndValuesDo: [ :association :meth |
		association key addSelectorSilently: meth selector withMethod: meth ]
]

{ #category : 'as yet unclassified' }

AnalysisScripts class >> resetSeasideTestResources [

		{WATestingMetadataFileLibrary.
		WATestingFiles } do: [ :each |
		each removeSelector: #demoJpeg.
		each removeSelector: #demoTxt ].
]

{ #category : 'as yet unclassified' }

AnalysisScripts >> analysisScriptMicrodown [
 
| dynamiqueAnalyser |
Metacello new
	baseline: 'Microdown';
	repository: 'github://pillar-markup/Microdown:dev/src';
	onConflict: [ :ex | ex useIncoming ];
	onUpgrade: [ :ex | ex useIncoming ];
	load.
	
(PackageOrganizer default packages select: [ :e |
		 (e name beginsWith: 'Microdown-') and: [
			 (e name includesSubstring: 'Tests') not ] ]) do:
		#demoteToTagInPackage.

	(PackageOrganizer default packages select: [ :e |
		 (e name beginsWith: 'Microdown-') and: [
			 (e name includesSubstring: 'Tests') and: [(e name includesSubstring: 'Microdown-Tests') not]] ]) do: #demoteToTagInPackage.
	
	
dynamiqueAnalyser := DynamicReflectionMutationAnalyser new.
dynamiqueAnalyser
	classesToStudy:
		('Microdown' asPackage definedClasses reject: [ :each |
				 each isTestCase ]);
	correspondingTests:
		('Microdown-Tests' asPackage definedClasses select: [ :each |
				 each isTestCase ]);
	selectorsToMutateAuto.

dynamiqueAnalyser run.
dynamiqueAnalyser callSitesStats.
"self zoomToFit.
self pdfExporter exportToFile:  ('Microdown-CallSitesBySelectors.pdf' asFileReference )"

"self zoomToFit.
self pdfExporter exportToFile:  ('Microdown-CallSites.pdf' asFileReference )"
]

{ #category : 'as yet unclassified' }
AnalysisScripts >> analysisScriptMuTalk [
    | oldDynamiqueAnalyser dynamiqueAnalyser |
oldDynamiqueAnalyser := dynamiqueAnalyser. 
	dynamiqueAnalyser := DynamicReflectionMutationAnalyser new.
	dynamiqueAnalyser
		classesToStudy:
			('MyMuTalk' asPackage definedClasses reject: [ :each |
					 each isTestCase ]);
		correspondingTests:
			('MyMuTalk-Tests' asPackage definedClasses select: [ :each |
					 each isTestCase ]);
		selectorsToMutateAuto.
	
	'MyMuTalk-Tests' asPackage definedClasses 
	    select: [ :each | each superclass = TestCase ] 
	    thenDo: [:each | each superclass: TestCaseWithResetForMuTalk ].
	AnalysisScripts resetMyMuTalkTestResources.
	dynamiqueAnalyser runWithTestResetBlock: [].
		'MyMuTalk-Tests' asPackage definedClasses 
	    select: [ :each | each superclass = TestCase ] 
	    thenDo: [:each | each superclass: TestCaseWithResetForMuTalk ].
	
	'MyMuTalk-Tests' asPackage definedClasses 
	    select: [ :each | each superclass = TestCase ] 
	    thenDo: [:each | each superclass: TestCaseWithResetForMuTalk ].
	 dynamiqueAnalyser callSitesStats.
	'MyMuTalk-Tests' asPackage definedClasses 
	    select: [ :each | each superclass = TestCaseWithResetForMuTalk ] 
	    thenDo: [:each | each superclass: TestCase].

	AnalysisScripts resetMyMuTalkTestResources .
	dynamiqueAnalyser matrix.
	dynamiqueAnalyser matrixByTest.
	dynamiqueAnalyser matrixGroupedByTestClass.
]

{ #category : 'as yet unclassified' }
AnalysisScripts >> analysisScriptSTON [
	| dynamiqueAnalyser |
	dynamiqueAnalyser := DynamicReflectionMutationAnalyser new.
	dynamiqueAnalyser
		classesToStudy:
			('MySTON' asPackage definedClasses reject: [ :each |
					 each isTestCase ]);
		correspondingTests:
			('MySTON-Tests' asPackage definedClasses select: [ :each |
					 each isTestCase ]);
		selectorsToMutateAuto.

	dynamiqueAnalyser run.
	dynamiqueAnalyser callSitesStats.
"self zoomToFit.
self pdfExporter exportToFile:  ('STON-CallSitesBySelectors.pdf' asFileReference )"

"self zoomToFit.
self pdfExporter exportToFile:  ('STON-CallSites.pdf' asFileReference )"
]

{ #category : 'as yet unclassified' }
AnalysisScripts >> analysisScriptSeaside [
	| oldDynamiqueAnalyser dynamiqueAnalyser |
	oldDynamiqueAnalyser := dynamiqueAnalyser.
	dynamiqueAnalyser := DynamicReflectionMutationAnalyser new.
	dynamiqueAnalyser
		classesToStudy:
			('Seaside' asPackage definedClasses reject: [ :each |
					 each isTestCase ]);
		correspondingTests:
			('Seaside-Tests' asPackage definedClasses select: [ :each |
					 each isTestCase ]);
		selectorsToMutateAuto.
"removed value size at:put: "
	'Seaside-Tests' asPackage definedClasses 
	    select: [ :each | each superclass = TestCase ] 
	    thenDo: [:each | each superclass: TestCaseWithResetForSeaside ].
	AnalysisScripts resetSeasideTestResources.
	dynamiqueAnalyser runWithTestResetBlock: [].
	dynamiqueAnalyser callSitesStats.
	'Seaside-Tests' asPackage definedClasses 
	    select: [ :each | each superclass = TestCaseWithResetForSeaside ] 
	    thenDo: [:each | each superclass: TestCase].
	AnalysisScripts resetSeasideTestResources .
  dynamiqueAnalyser numberOfClassesInProject."547"
	dynamiqueAnalyser numberOfTestsInProject."1004"
	dynamiqueAnalyser numberOfStudiedCallSites. "1314"
	dynamiqueAnalyser matrix.
	dynamiqueAnalyser matrixByTest.
	dynamiqueAnalyser matrixGroupedByTestClass.

]
	
{ #category : 'as yet unclassified' }
AnalysisScripts >> analysisScriptTestPackage [	
	| dynamiqueAnalyser |
	dynamiqueAnalyser := DynamicReflectionMutationAnalyser new.
	dynamiqueAnalyser
		classesToStudy:
			('TestPackage' asPackage definedClasses reject: [ :each |
					 each isTestCase ]);
		correspondingTests:
			('TestPackage-Tests' asPackage definedClasses select: [ :each |
					 each isTestCase ]);		selectorsToMutateAuto.

	dynamiqueAnalyser run.
	dynamiqueAnalyser callSitesStats.
]

{ #category : 'as yet unclassified' }
AnalysisScripts >> settingUpSeaside [

	Metacello new
		baseline: 'Seaside3';
		repository: 'github://SeasideSt/Seaside:master/repository';
		load.

	(PackageOrganizer default packages select: [ :e |
		 (e name beginsWith: 'Seaside-') and: [
			 (e name includesSubstring: 'Tests') not ] ]) do:
		#demoteToTagInPackage.

	(PackageOrganizer default packages select: [ :e |
		 (e name beginsWith: 'Seaside-') and: [
			 e name includesSubstring: 'Tests' ] ]) do: #demoteToTagInPackage
]

{ #category : 'as yet unclassified' }
AnalysisScripts >> testToSkipForSeaside [
"	<modifiedTest>
	self skip."
 ^ 	{WAContinuationTest>>#testBlockVars .
	WAContinuationTest>>#testBlockEscape .
	WAContinuationTest>>#testBlockTemps. 
	WAContinuationTest>>#testMethodTemps . 
	WAContinuationTest>>#testReentrant . 
	WAContinuationTest>>#testSimpleCallCC .
	WAContinuationTest>>#testSimpleCallCCWithPossibleArgument .
	WAContinuationTest>>#testSimplestCallCC .
	WAErrorHandlerTest>>#testWarning .
	WAErrorHandlerTest>>#testError .
	WAExceptionHandlerTest>>#testHandlerInstanceValidExceptionSelector.
 	WARenderLoopContinuationTest>>#testExceptionHandlerNesting
	}
]
