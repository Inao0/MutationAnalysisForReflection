Extension { #name : 'MTAnalysis' }

{ #category : '*MutationTestingForReflection' }
MTAnalysis >> run1InitialTestRunAndCoverage [
	"Obtain mutants applying the operators in the classes (or
	methods of
	those classes) and execute all mutants in the set of testClases.
	We obtain a result for each mutant generated"

	^ [
	  self initialTestRun.
	  self generateCoverageAnalysis.
	  true ]
		  on: MTTestsWithErrorsException
		  do: [ :ex |
			  self inform:
				  'Your tests have Errors or Failures. Please correct them.'.
			  ex return: false ]
]

{ #category : '*MutationTestingForReflection' }
MTAnalysis >> run2GenerateMutations [

	mutations := mutantSelectionStrategy
		             mutationsFor: self
		             loggingIn: logger
]
