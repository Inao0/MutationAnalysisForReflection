Class {
	#name : 'MyMTMutantEvaluationResultKilled',
	#superclass : 'MyMTMutantEvaluationResult',
	#instVars : [
		'result'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'instance creation' }
MyMTMutantEvaluationResultKilled class >> canHandle: aMutant withResults: aTestResult [

 	^aTestResult notNil and:[aTestResult errorsSize + aTestResult failuresSize > 0]
	
]

{ #category : 'instance creation' }
MyMTMutantEvaluationResultKilled class >> newFor: aMutant results: aTestResult producedBy: aMutantEvaluation [ 
	^ self new
		initializeFor: aMutant
			results: aTestResult
			producedBy: aMutantEvaluation;
		yourself
]

{ #category : 'initialize-release' }
MyMTMutantEvaluationResultKilled >> initializeFor: aMutant results: aTestResult producedBy: aMutantEvaluation [ 
	mutant := aMutant.
	result := aTestResult.
	mutantEvaluation := aMutantEvaluation
]

{ #category : 'testing' }
MyMTMutantEvaluationResultKilled >> killed [
	
	^true
]

{ #category : 'accessing' }
MyMTMutantEvaluationResultKilled >> killingSuggestions [ 
	
	^'MUTANT KILLED'
]

{ #category : 'browsing' }
MyMTMutantEvaluationResultKilled >> mutantResults [
	
	^result tests
]

{ #category : 'printing' }
MyMTMutantEvaluationResultKilled >> printDetailedResultOn: aStream [ 

		aStream cr; nextPutAll: 'PASSED'; cr.
		result passed do:
		[:test | aStream nextPutAll: test printString; cr.].
		aStream cr; nextPutAll: 'FAILURES'; cr.
		result failures do:
		[:test | aStream nextPutAll: test printString; cr.].
		aStream cr; nextPutAll: 'ERRORS'; cr.
		result errors do:
		[:test | aStream nextPutAll: test printString; cr.].
		aStream cr.
]

{ #category : 'accessing' }
MyMTMutantEvaluationResultKilled >> result [
	^result
]

{ #category : 'browsing' }
MyMTMutantEvaluationResultKilled >> resultClass [
	
	^result tests first class
]

{ #category : 'testing' }
MyMTMutantEvaluationResultKilled >> resultString [
	
	^result printString 
]

{ #category : 'testing' }
MyMTMutantEvaluationResultKilled >> runCount [

	^result runCount
]

{ #category : 'testing' }
MyMTMutantEvaluationResultKilled >> survived [
	
	^false
]

{ #category : 'testing' }
MyMTMutantEvaluationResultKilled >> terminated [

	^false
]
