Extension { #name : 'MTMutantEvaluationResult' }

{ #category : '*MutationTestingForReflection' }
MTMutantEvaluationResult >> callSite [
	^ CallSite new nodeNumber: mutant nodeNumber; method: mutant originalMethod; selector: mutant operator oldSelector
]

{ #category : '*MutationTestingForReflection' }
MTMutantEvaluationResult >> callSiteWithResult [
	^ CallSite new nodeNumber: mutant nodeNumber; method: mutant originalMethod; selector: mutant operator oldSelector; resultFromv1: self.
]
