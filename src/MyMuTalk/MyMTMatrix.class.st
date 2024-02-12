Class {
	#name : 'MyMTMatrix',
	#superclass : 'Dictionary',
	#instVars : [
		'mutations',
		'testCases',
		'analysis',
		'classesToMutate',
		'testClasses'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'instance creation' }
MyMTMatrix class >> forClasses: aCollectionOfClasses [

	^ self
		  forClasses: aCollectionOfClasses
		  andTests: (aCollectionOfClasses collect: [ :class |
				   class name , 'Test' asClassInEnvironment:
					   self class environment ])
]

{ #category : 'instance creation' }
MyMTMatrix class >> forClasses: aCollectionOfClasses andTests: aCollectionOfTests [

	^ self new
		  classesToMutate: aCollectionOfClasses;
		  testClasses: aCollectionOfTests
]

{ #category : 'instance creation' }
MyMTMatrix class >> forPackages: aCollectionOfPackages [

	^ self
		  forPackages: aCollectionOfPackages
		  andTestPackages:
		  (aCollectionOfPackages collect: [ :package | package , '-Tests' ])
]

{ #category : 'instance creation' }
MyMTMatrix class >> forPackages: aCollectionOfPackages andTestPackages: aCollectionOfTestPackages [

	^ self new
		  classesToMutate: (aCollectionOfPackages
				   inject: OrderedCollection new
				   into: [ :coll :package |
					   coll addAll: package asPackage definedClasses.
					   coll ]);
		  testClasses: (aCollectionOfTestPackages
				   inject: OrderedCollection new
				   into: [ :testColl :testPackage |
					   testColl addAll:
							   (testPackage asPackage definedClasses select: #isTestCase) ])
]

{ #category : 'adding' }
MyMTMatrix >> addMutantSetsIn: aCollection using: aSymbol [

	mutations do: [ :mutant1 |
		| mutantSet |
		mutantSet := Set with: mutant1.
		mutations do: [ :mutant2 |
			(self mutantOperation: aSymbol with: mutant1 and: mutant2) ifTrue: [
				mutantSet add: mutant2 ] ].
		mutantSet size > 1 ifTrue: [
			aCollection species = Dictionary
				ifTrue: [ aCollection at: mutant1 put: mutantSet ]
				ifFalse: [ aCollection add: mutantSet ] ] ]
]

{ #category : 'accessing' }
MyMTMatrix >> analysis [

	^ analysis
]

{ #category : 'comparing' }
MyMTMatrix >> booleanCollection1: collection1 equalsBooleanCollection2: collection2 [

	collection1 size = collection2 size ifFalse: [ ^ false ].
	1 to: collection1 size do: [ :i |
		((collection1 at: i) eqv: (collection2 at: i)) ifFalse: [ ^ false ] ].
	^ true
]

{ #category : 'comparing' }
MyMTMatrix >> booleanCollection1: collection1 includesBooleanCollection2: collection2 [

	collection1 size = collection2 size ifFalse: [ ^ false ].
	(collection2 select: [ :bool | bool ]) isEmpty ifTrue: [ ^ false ].
	1 to: collection1 size do: [ :i |
		((collection1 at: i) and: [ (collection2 at: i) not ]) ifFalse: [
			((collection1 at: i) eqv: (collection2 at: i)) ifFalse: [ ^ false ] ] ].
	^ true
]

{ #category : 'building' }
MyMTMatrix >> build [

	self runAnalysis.
	mutations do: [ :mut |
		self
			at: mut
			put:
			(testCases collect: [ :test |
				 (self failuresFor: mut) includes: test ]) ]
]

{ #category : 'accessing' }
MyMTMatrix >> classesToMutate [

	^ classesToMutate
]

{ #category : 'accessing' }
MyMTMatrix >> classesToMutate: aClass [

	classesToMutate := aClass
]

{ #category : 'accessing' }
MyMTMatrix >> equivalentMutants [

	| equivalentMutants |
	equivalentMutants := Set new.

	self addMutantSetsIn: equivalentMutants using: #equals.

	^ equivalentMutants
]

{ #category : 'computing' }
MyMTMatrix >> evaluationResultFor: aMutant [

	^ (analysis mutantResults detect: [ :evaluationResult |
		   evaluationResult mutant = aMutant ]) result
]

{ #category : 'rendering' }
MyMTMatrix >> failingTestsFor: aMutation [

	| indicies testResults |
	indicies := OrderedCollection new.
	testResults := self at: aMutation.
	1 to: testResults size do: [ :i |
	(testResults at: i) ifTrue: [ indicies add: i ] ].

	^ testCases select: [ :test |
		  indicies includes: (testCases indexOf: test) ]
]

{ #category : 'computing' }
MyMTMatrix >> failuresFor: aMutant [

	^ (self evaluationResultFor: aMutant) defects asOrderedCollection collect: [ :each |
		  MyMTTestCaseReference for: each selector in: each class ]
]

{ #category : 'rendering' }
MyMTMatrix >> generateMatrix [

	| matrix |
	matrix := RSDSM new.
	matrix objectsX: testCases.
	matrix objectsY: mutations.
	matrix setShouldFeedY.
	matrix dependency: [ :mutation | self failingTestsFor: mutation ].
	matrix open
]

{ #category : 'accessing' }
MyMTMatrix >> includedMutants [

	| includedMutants |
	includedMutants := Dictionary new.

	self addMutantSetsIn: includedMutants using: #includes.

	^ includedMutants
]

{ #category : 'comparing' }
MyMTMatrix >> mutant1: mutant1 equalsMutant2: mutant2 [

	^ self
		  booleanCollection1: (self at: mutant1)
		  equalsBooleanCollection2: (self at: mutant2)
]

{ #category : 'comparing' }
MyMTMatrix >> mutant1: mutant1 includesMutant2: mutant2 [

	^ self
		  booleanCollection1: (self at: mutant1)
		  includesBooleanCollection2: (self at: mutant2)
]

{ #category : 'computing' }
MyMTMatrix >> mutantOperation: aSymbol with: mutant1 and: mutant2 [

	aSymbol = #equals ifTrue: [
		^ self mutant1: mutant1 equalsMutant2: mutant2 ].
	aSymbol = #includes ifTrue: [
		^ self mutant1: mutant1 includesMutant2: mutant2 ]
]

{ #category : 'accessing' }
MyMTMatrix >> mutations [

	^ mutations
]

{ #category : 'accessing' }
MyMTMatrix >> mutations: anObject [

	mutations := anObject
]

{ #category : 'running' }
MyMTMatrix >> runAnalysis [

	analysis := MyMTAnalysis new
		            classesToMutate: classesToMutate;
		            testClasses: testClasses;
		            doNotStopOnErrorOrFail.
	analysis run.
	testCases := analysis testCases.
	mutations := analysis mutations
]

{ #category : 'accessing' }
MyMTMatrix >> testCases [

	^ testCases
]

{ #category : 'accessing' }
MyMTMatrix >> testClasses [

	^ testClasses
]

{ #category : 'accessing' }
MyMTMatrix >> testClasses: aTestClass [

	testClasses := aTestClass
]

{ #category : 'accessing' }
MyMTMatrix >> trivialMutants [

	^ self keys select: [ :mutant |
		  (self at: mutant) fold: [ :bool1 :bool2 | bool1 and: bool2 ] ]
]
