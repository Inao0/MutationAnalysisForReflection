Class {
	#name : 'MyMTMutantEvaluationResultTerminated',
	#superclass : 'MyMTMutantEvaluationResult',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'instance creation' }
MyMTMutantEvaluationResultTerminated class >> canHandle: aMutant withResults: aTestResult [

	^aTestResult isNil
]

{ #category : 'instance creation' }
MyMTMutantEvaluationResultTerminated class >> newFor: aMutant results: aTestResult producedBy: aMutantEvaluation [ 
	^ self new
		initializeFor: aMutant
			producedBy: aMutantEvaluation;
		yourself
]

{ #category : 'initialize-release' }
MyMTMutantEvaluationResultTerminated >> initializeFor: aMutation producedBy: aMutantEvaluation [ 
	mutant := aMutation.
	mutantEvaluation := aMutantEvaluation
]

{ #category : 'testing' }
MyMTMutantEvaluationResultTerminated >> killed [
	^false
]

{ #category : 'accessing' }
MyMTMutantEvaluationResultTerminated >> killingSuggestions [ 
	
	^'MUTANT KILLED'
]

{ #category : 'testing' }
MyMTMutantEvaluationResultTerminated >> mutantResults [
	
	^OrderedCollection new
]

{ #category : 'printing' }
MyMTMutantEvaluationResultTerminated >> printDetailedResultOn: aStream [

		aStream cr; nextPutAll: 'TEST EXECUTION TERMINATED'; cr.
]

{ #category : 'accessing' }
MyMTMutantEvaluationResultTerminated >> result [
	^nil
]

{ #category : 'browsing' }
MyMTMutantEvaluationResultTerminated >> resultClass [
	
	^mutant originalClass
]

{ #category : 'testing' }
MyMTMutantEvaluationResultTerminated >> resultString [
	^'Mutation TERMINATED'
]

{ #category : 'testing' }
MyMTMutantEvaluationResultTerminated >> runCount [

	^0
]

{ #category : 'testing' }
MyMTMutantEvaluationResultTerminated >> survived [
	^false
]

{ #category : 'testing' }
MyMTMutantEvaluationResultTerminated >> terminated [

	^true
]
