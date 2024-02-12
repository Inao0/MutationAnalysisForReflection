Class {
	#name : 'MyMTMutantEvaluationResult',
	#superclass : 'Object',
	#instVars : [
		'mutant',
		'mutantEvaluation'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'instance creation' }
MyMTMutantEvaluationResult class >> canHandle: aMutant withResults: aTestResult [

	self subclassResponsibility 
]

{ #category : 'instance creation' }
MyMTMutantEvaluationResult class >> for: aMutant results: aTestResult [ 
	"This method is use for running tests. That's the reason why it sends nil as argument"
	^ self 
		for: aMutant
		results: aTestResult
		producedBy: nil
]

{ #category : 'instance creation' }
MyMTMutantEvaluationResult class >> for: aMutant results: aTestResult producedBy: aMutantEvaluation [ 
	| handler |
	handler := self subclasses 
		detect: 
			[ :class | 
			class 
				canHandle: aMutant
				withResults: aTestResult ]
		ifNone: [ self error: 'There are missing classes' ].
	^ handler 
		newFor: aMutant
		results: aTestResult
		producedBy: aMutantEvaluation
]

{ #category : 'instance creation' }
MyMTMutantEvaluationResult class >> newFor: aMutant results: aTestResult producedBy: aMutantEvaluation [ 
	self subclassResponsibility
]

{ #category : 'testing' }
MyMTMutantEvaluationResult >> killed [
	self subclassResponsibility
]

{ #category : 'accessing' }
MyMTMutantEvaluationResult >> killingSuggestions [ 
	
	self subclassResponsibility 
]

{ #category : 'accessing' }
MyMTMutantEvaluationResult >> mutant [
	^ mutant
]

{ #category : 'accessing' }
MyMTMutantEvaluationResult >> mutantEvaluation [ 
	^mutantEvaluation
]

{ #category : 'accessing' }
MyMTMutantEvaluationResult >> mutantResults [ 
	
	self subclassResponsibility 
]

{ #category : 'printing' }
MyMTMutantEvaluationResult >> printDetailedResultOn: aStream [ 
	self subclassResponsibility 
]

{ #category : 'printing' }
MyMTMutantEvaluationResult >> printOn: aStream [ 
	aStream nextPutAll: self mutant printString
]

{ #category : 'browsing' }
MyMTMutantEvaluationResult >> resultClass [
	self subclassResponsibility
]

{ #category : 'accessing' }
MyMTMutantEvaluationResult >> resultString [ 
	self subclassResponsibility 
]

{ #category : 'testing' }
MyMTMutantEvaluationResult >> runCount [
	self subclassResponsibility
]

{ #category : 'testing' }
MyMTMutantEvaluationResult >> survived [
	self subclassResponsibility
]

{ #category : 'testing' }
MyMTMutantEvaluationResult >> terminated [
	self subclassResponsibility
]
