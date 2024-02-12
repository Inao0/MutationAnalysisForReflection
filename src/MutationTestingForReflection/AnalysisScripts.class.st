Class {
	#name : 'AnalysisScripts',
	#superclass : 'Object',
	#category : 'MutationTestingForReflection',
	#package : 'MutationTestingForReflection'
}

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

	| analyser dynamiqueAnalyser |
	analyser := ReflectionMutationAnalyser new.
	analyser
		classesToStudy:
			('Seaside' asPackage definedClasses reject: [ :each |
					 each isTestCase ]);
		correspondingTests:
			('Seaside-Tests' asPackage definedClasses select: [ :each |
					 each isTestCase ]);
		selectorsToMutate:
			#( #instVarAt:put: #receiver: #return: #allSubInstances
			   #sender #resume #value:value: #classPool #superclass #isKindOf:
			   #allInstancesDo: #perform:with: #allSubInstancesDo:
			   #value #terminate #receiver #size #bindingOf: #resume: #perform:
			   #at:put: #respondsTo: #at: #subclasses #method #instSize
			   #inheritsFrom: #message #identityHash #instVarAt: #selectors
			   #selector: #isValid #value: #withAllSubclasses
			   #terminateTo: #instVarNamed:put: #selector #isMeta #perform:withArguments:
			   #argumentCount #class #perform:with:with: #allSubclasses
			   #valueWithArguments: #className #numArgs ).

	analyser run.
	analyser coverageOfCallSites.
	analyser percentageOfWorkingTestsAsSpiderChart.
	analyser exportForUpsetWithSuffix: 'Seaside'.


	"DYNAMIQUE ANALYSIS"
	"DynamicReflectionMutationAnalyser duplicateReflectiveMethodsWithPrefix."
	"allReflectiveMethods := ((Pragma allNamed: 'reflection:') collect: #method) reject: #isFromTrait.
allReflectiveMethods do: [ :method | 
	prefixedMethod := method prefixedProxyMethod.
	prefixedMethod methodClass addSelectorSilently: prefixedMethod selector withMethod: prefixedMethod ].
allProxyPrefixedMethods := ((Pragma allNamed: 'prefixedReflectiveMethodProxy') collect: #method) reject: #isFromTrait.
allReflectiveMethods first prefixedFailingMethod.
"
	dynamiqueAnalyser := DynamicReflectionMutationAnalyser new.
	dynamiqueAnalyser
		classesToStudy:
			('Seaside' asPackage definedClasses reject: [ :each |
					 each isTestCase ]);
		correspondingTests:
			('Seaside-Tests' asPackage definedClasses select: [ :each |
					 each isTestCase ]);
		selectorsToMutateAuto.
	"	selectorsToMutate: { 'isKindOf:' .'perform:'.'superclass' . #receiver .'withAllSubclasses'. 'respondsTo:' . #selector. 'allSubclasses' .'method' . #message . 'inheritsFrom:' .'selectors'. 'bindingOf:'. 'className'}."

	dynamiqueAnalyser run.

	"Reset seaside class test. Otherwise fails"
	{
		WATestingMetadataFileLibrary.
		WATestingFiles } do: [ :each |
		each removeSelector: #demoJpeg.
		each removeSelector: #demoTxt ].
	dynamiqueAnalyser callSitesStats.

	dynamiqueAnalyser percentageOfWorkingTestsAsSpiderChart.
	dynamiqueAnalyser exportForUpsetWithSuffix: 'SeasideDyn'
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
