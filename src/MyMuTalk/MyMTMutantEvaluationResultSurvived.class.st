Class {
	#name : 'MyMTMutantEvaluationResultSurvived',
	#superclass : 'MyMTMutantEvaluationResult',
	#instVars : [
		'result'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'instance creation' }
MyMTMutantEvaluationResultSurvived class >> canHandle: aMutant withResults: aTestResult [ 
	^ aTestResult notNil
		and: [aTestResult errorsSize + aTestResult failuresSize = 0]
]

{ #category : 'instance creation' }
MyMTMutantEvaluationResultSurvived class >> newFor: aMutant results: aTestResult producedBy: aMutantEvaluation [ 
	^ self new
		initializeFor: aMutant
			results: aTestResult
			producedBy: aMutantEvaluation;
		yourself
]

{ #category : 'initialize-release' }
MyMTMutantEvaluationResultSurvived >> initializeFor: aMutant results: aTestResult producedBy: aMutantEvaluation [ 
	mutant := aMutant.
	result := aTestResult.
	mutantEvaluation := aMutantEvaluation
]

{ #category : 'testing' }
MyMTMutantEvaluationResultSurvived >> killed [
	^false
]

{ #category : 'accessing' }
MyMTMutantEvaluationResultSurvived >> killingSuggestions [

	^ MyMTMutantKillingSuggestionGenerator new suggestionFor: mutant
]

{ #category : 'testing' }
MyMTMutantEvaluationResultSurvived >> mutantResults [
	^result tests
]

{ #category : 'printing' }
MyMTMutantEvaluationResultSurvived >> printDetailedResultOn: aStream [ 

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
MyMTMutantEvaluationResultSurvived >> result [
	^result
]

{ #category : 'browsing' }
MyMTMutantEvaluationResultSurvived >> resultClass [
	
	^result tests isEmpty 
		ifTrue: [mutant originalClass] 
		ifFalse: [result tests first class] 
]

{ #category : 'testing' }
MyMTMutantEvaluationResultSurvived >> resultString [
	
	^result printString
]

{ #category : 'testing' }
MyMTMutantEvaluationResultSurvived >> runCount [

	^result runCount
]

{ #category : 'testing' }
MyMTMutantEvaluationResultSurvived >> survived [
	^true
]

{ #category : 'testing' }
MyMTMutantEvaluationResultSurvived >> terminated [

	^false
]
