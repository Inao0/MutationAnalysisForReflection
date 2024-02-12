Class {
	#name : 'MyMTMatrixTest',
	#superclass : 'TestCase',
	#instVars : [
		'matrix',
		'trivialMutant',
		'equivalentMutants',
		'includedMutants'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'running' }
MyMTMatrixTest >> setUp [

	super setUp.
	matrix := MyMTMatrix forClasses: { MyMTAuxiliarClassForMatrix }.
	matrix build.
	self setUpVariablesForTest
]

{ #category : 'initialization' }
MyMTMatrixTest >> setUpVariablesForTest [

	| mutations minusMutants plusMutants |
	mutations := matrix analysis mutations.
	minusMutants := Set withAll: (mutations select: [ :mut |
			                 mut originalMethod
			                 = (MyMTAuxiliarClassForMatrix >> #minus:) ]).
	plusMutants := Set withAll: (mutations select: [ :mut |
			                mut originalMethod
			                = (MyMTAuxiliarClassForMatrix >> #plus:) ]).
	trivialMutant := Array with:
		                 (matrix analysis mutations detect: [ :mut |
			                  mut originalMethod
			                  = (MyMTAuxiliarClassForMatrix >> #reset) ]).
	equivalentMutants := Set with: minusMutants with: plusMutants.
	includedMutants := Dictionary new.
	mutations do: [ :mutant |
		mutant originalMethod = (MyMTAuxiliarClassForMatrix >> #minus:)
			ifTrue: [ includedMutants at: mutant put: minusMutants ].
		mutant originalMethod = (MyMTAuxiliarClassForMatrix >> #plus:)
			ifTrue: [ includedMutants at: mutant put: plusMutants ].
		mutant originalMethod = (MyMTAuxiliarClassForMatrix >> #reset)
			ifTrue: [ includedMutants at: mutant put: mutations asSet ] ]
]

{ #category : 'tests' }
MyMTMatrixTest >> testEqualBooleanCollections [

	| a1 a2 a3 a4 |
	a1 := #( false false true true true false ).
	a2 := #( false false true true true false ).
	a3 := #( false false true true false false ).
	a4 := #( false true true false ).

	self assert:
		(matrix booleanCollection1: a1 equalsBooleanCollection2: a2).
	self deny:
		(matrix booleanCollection1: a1 equalsBooleanCollection2: a3).
	self deny:
		(matrix booleanCollection1: a1 equalsBooleanCollection2: a4)
]

{ #category : 'tests' }
MyMTMatrixTest >> testEquivalentMutants [

	self assert: matrix equivalentMutants equals: equivalentMutants
]

{ #category : 'tests' }
MyMTMatrixTest >> testIncludeBooleanCollections [

	| a1 a2 a3 a4 a5 |
	a1 := #( false false true true true false ).
	a2 := #( false false true true true false ).
	a3 := #( false false true false false false ).
	a4 := #( true false true true false false ).
	a5 := #( false true true false ).

	self assert:
		(matrix booleanCollection1: a1 includesBooleanCollection2: a2).
	self assert:
		(matrix booleanCollection1: a1 includesBooleanCollection2: a3).
	self deny:
		(matrix booleanCollection1: a1 includesBooleanCollection2: a4).
	self deny:
		(matrix booleanCollection1: a1 includesBooleanCollection2: a5).
	self deny:
		(matrix booleanCollection1: a3 includesBooleanCollection2: a1)
]

{ #category : 'tests' }
MyMTMatrixTest >> testIncludedMutants [

	self assert: matrix includedMutants equals: includedMutants
]

{ #category : 'tests' }
MyMTMatrixTest >> testTrivialMutants [

	self assert: matrix trivialMutants equals: trivialMutant
]
