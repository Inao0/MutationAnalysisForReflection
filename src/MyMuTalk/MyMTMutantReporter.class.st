Class {
	#name : 'MyMTMutantReporter',
	#superclass : 'Object',
	#instVars : [
		'mutantEvaluationResult'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'instance creation' }
MyMTMutantReporter class >> for: aMutantEvaluationResult [ 
	^self new 
		initializeFor: aMutantEvaluationResult;
		yourself 
]

{ #category : 'initialize-release' }
MyMTMutantReporter >> initializeFor: aMutantEvaluationResult [ 

	mutantEvaluationResult := aMutantEvaluationResult 
]

{ #category : 'evaluating' }
MyMTMutantReporter >> value [
	| stream |
	stream := String
		streamContents: [ :str | 
			str
				nextPutAll: '----------------';
				cr.
			str
				nextPutAll: 'Mutant Generated: ';
				nextPutAll: mutantEvaluationResult printString;
				cr.
			str
				nextPutAll: '----------------';
				cr.
			str
				nextPutAll: 'Result --> ';
				nextPutAll: mutantEvaluationResult resultString;
				cr.
			mutantEvaluationResult printDetailedResultOn: str.
			str cr ].
	^ stream contents
]
