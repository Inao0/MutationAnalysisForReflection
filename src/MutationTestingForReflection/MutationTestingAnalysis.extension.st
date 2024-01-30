Extension { #name : 'MutationTestingAnalysis' }

{ #category : '*MutationTestingForReflection' }
MutationTestingAnalysis >> operators: aCollectionOfOperators [
	operators := aCollectionOfOperators 
]

{ #category : '*MutationTestingForReflection' }
MutationTestingAnalysis >> run1InitialTestRunAndCoverage [
	"Obtain mutants applying the operators in the classes (or
	methods of
	those classes) and execute all mutants in the set of testClases.
	We obtain a result for each mutant generated"

	^ [
	  self initialTestRun.
	  self generateCoverageAnalysis.
	  true ]
		  on: TestsWithErrorsException
		  do: [ :ex |
			  self inform:
				  'Your tests have Errors or Failures. Please correct them.'.
			  self halt.
			  ex return: false ]
]

{ #category : '*MutationTestingForReflection' }
MutationTestingAnalysis >> run2GenerateMutations [
	"Obtain mutants applying the operators in the classes (or
	methods of
	those classes) and execute all mutants in the set of testClases.
	We obtain a result for each mutant generated"

	self generateMutations
]

{ #category : '*MutationTestingForReflection' }
MutationTestingAnalysis >> run3GenerateResults [
	"Obtain mutants applying the operators in the classes (or
	methods of
	those classes) and execute all mutants in the set of testClases.
	We obtain a result for each mutant generated"
	^ self generateResults.
]
