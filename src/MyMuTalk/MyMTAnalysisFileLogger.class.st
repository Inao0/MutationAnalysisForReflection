Class {
	#name : 'MyMTAnalysisFileLogger',
	#superclass : 'MyMTAnalysisLogger',
	#instVars : [
		'fileStream'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'instance creation' }
MyMTAnalysisFileLogger class >> toFileNamed: aString [
	^self new initializeToFileNamed: aString.
]

{ #category : 'initialize-release' }
MyMTAnalysisFileLogger >> initializeToFileNamed: aString [
	fileStream := FileStream forceNewFileNamed: aString.
]

{ #category : 'logging' }
MyMTAnalysisFileLogger >> logAnalysisStartFor: aMutationTestingAnalysis [ 
	self writeLineToFile: 'The analysis is starting...'.
]

{ #category : 'logging' }
MyMTAnalysisFileLogger >> logStartBuildingMutantionsFor: aCompiledMethod using: aMutantOperator [ 
	self writeLineToFile: 'Generating mutations for '
			, (self methodNameOf: aCompiledMethod) , '  With operator:' , aMutantOperator description
]

{ #category : 'logging' }
MyMTAnalysisFileLogger >> logStartEvaluating: aMethodMutation [
	| logStream |
	logStream := WriteStream on: String new.
	logStream
		nextPutAll: 'Evaluating mutant of method ';
		nextPutAll: (self methodNameOf: aMethodMutation originalMethod);
		nextPutAll: '  With source:'.
	logStream cr.
	logStream nextPutAll: aMethodMutation modifiedSource.
	self writeLineToFile: logStream contents
]

{ #category : 'private' }
MyMTAnalysisFileLogger >> methodNameOf: aCompiledMethod [ 
	^aCompiledMethod methodClass name asString , '>>' , aCompiledMethod selector printString 
]

{ #category : 'private' }
MyMTAnalysisFileLogger >> writeLineToFile: aString [ 
	[fileStream closed
		ifTrue: [fileStream open].
	fileStream setToEnd; nextPutAll: aString; cr]
		ensure: [fileStream close]
]
