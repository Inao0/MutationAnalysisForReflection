Extension { #name : 'MutantEvaluationResult' }

{ #category : '*MutationTestingForReflection' }
MutantEvaluationResult >> callSite [
	^ CallSite new nodeNumber: mutant nodeNumber; method: mutant originalMethod; selector: mutant operator oldSelector
]

{ #category : '*MutationTestingForReflection' }
MutantEvaluationResult >> callSiteWithResult [
	^ CallSite new nodeNumber: mutant nodeNumber; method: mutant originalMethod; selector: mutant operator oldSelector; resultFromv1: self.
]
