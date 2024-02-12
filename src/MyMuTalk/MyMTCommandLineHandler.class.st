Class {
	#name : 'MyMTCommandLineHandler',
	#superclass : 'CommandLineHandler',
	#instVars : [
		'result',
		'project',
		'commit',
		'diff'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTCommandLineHandler class >> commandName [ 
	^ 'mutalk'

]

{ #category : 'accessing' }
MyMTCommandLineHandler class >> description [

	^ 'Runs mutation testing'
]

{ #category : 'activation' }
MyMTCommandLineHandler >> activate [

	| noquit saveit |
	self activateHelp ifTrue: [ ^ self ].
	project := self hasArgument: 'project'.
	diff := self hasArgument: 'diff'.
	commit := self hasArgument: 'commit'.
	project ifNotNil: [ 
		diff ifNotNil: [ self icebergProjectDiff ] ifNil: [ 
			commit
				ifNotNil: [ self icebergProjectCommit ]
				ifNil: [ self icebergProject ] ] ].
	noquit := self commandLine hasOption: 'noquit'.
	saveit := self commandLine hasOption: 'save'.
	Smalltalk snapshot: saveit andQuit: noquit not
]

{ #category : 'initialization' }
MyMTCommandLineHandler >> hasArgument: command [

	| cmd |
	(self hasOption: command) ifFalse: [ ^ nil ].
	cmd := '--' , command , '='.
	self arguments
		detect: [ :arg | arg beginsWith: cmd ]
		ifFound: [ :arg | ^ arg allButFirst: cmd size ]
]

{ #category : 'private' }
MyMTCommandLineHandler >> icebergProject [

	MyMTCI new
		project: project;
		mutateAll
]

{ #category : 'private' }
MyMTCommandLineHandler >> icebergProjectCommit [

	MyMTCI new
		project: project;
		commit: commit;
		mutateDiff
]

{ #category : 'private' }
MyMTCommandLineHandler >> icebergProjectDiff [

	MyMTCI new
		project: project;
		recentCommit;
		mutateDiff
]
