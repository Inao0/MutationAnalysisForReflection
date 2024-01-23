Extension { #name : 'MethodMutation' }

{ #category : '*MutationTestingForReflection' }
MethodMutation >> runTests [
	self flag: #Modified.
	^ (TestSuite named: 'Tests cases for: ' , self printString)
		  addTests: testCaseReferences;
		  run
]
