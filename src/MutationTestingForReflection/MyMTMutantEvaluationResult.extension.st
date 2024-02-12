Extension { #name : 'MyMTMutantEvaluationResult' }

{ #category : '*MutationTestingForReflection' }
MyMTMutantEvaluationResult >> callSite [
	^ CallSite new nodeNumber: mutant nodeNumber; method: mutant originalMethod; selector: mutant operator oldSelector
]

{ #category : '*MutationTestingForReflection' }
MyMTMutantEvaluationResult >> callSiteWithResult [
	^ CallSite new nodeNumber: mutant nodeNumber; method: mutant originalMethod; selector: mutant operator oldSelector; resultFromv1: self.
]
