"
This strategy uses a fixed list of mutations pre-computed by the user
"
Class {
	#name : 'MyMTManualMutationSelectionStrategy',
	#superclass : 'MyMTMutantSelectionStrategy',
	#instVars : [
		'mutations'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'instance creation' }
MyMTManualMutationSelectionStrategy class >> with: aCollection [

	^ self new
		mutations: aCollection;
		yourself
]

{ #category : 'accessing' }
MyMTManualMutationSelectionStrategy >> mutations: anInfiniteReadStream [ 
	mutations := anInfiniteReadStream
]

{ #category : 'accessing' }
MyMTManualMutationSelectionStrategy >> mutationsFor: aMutationTestingAnalysis loggingIn: aLogger [

	"Do not compute a list of mutations, just use the explicit one"
	^ mutations
]
