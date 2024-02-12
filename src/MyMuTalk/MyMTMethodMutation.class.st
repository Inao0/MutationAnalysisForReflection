Class {
	#name : 'MyMTMethodMutation',
	#superclass : 'Object',
	#instVars : [
		'nodeNumber',
		'originalMethod',
		'operator',
		'originalClass',
		'testCaseReferences',
		'originalProtocol'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'instance creation' }
MyMTMethodMutation class >> for: aMethod using: anOperatorApplied nodeNumber: aNodeNumber ofClass: aClass [
	^ self new
		initializeFor: aMethod
		using: anOperatorApplied
		nodeNumber: aNodeNumber
		ofClass: aClass;
		 yourself
]

{ #category : 'comparing' }
MyMTMethodMutation >> = anObject [
	"Two method mutations are equals if they have the same operator,if they mutate the same method from the same class, and if they have the same node number"

	self == anObject ifTrue: [ ^ true ].
	anObject species = self class ifFalse: [ ^ false ].
	self operator species = anObject operator species ifFalse: [ ^ false ].
	self originalMethod = anObject originalMethod ifFalse: [ ^ false ].
	self originalClass = anObject originalClass ifFalse: [ ^ false ].
	self nodeNumber = anObject nodeNumber ifFalse: [ ^ false ].
	^ true
]

{ #category : 'comparing' }
MyMTMethodMutation >> hash [

	^ self operator species hash + self originalMethod hash
	  + self originalClass hash + self nodeNumber hash
]

{ #category : 'initialize-release' }
MyMTMethodMutation >> initializeFor: aMethod using: anOperatorApplied nodeNumber: aNodeNumber ofClass: aClass [
	originalMethod := aMethod.
	originalProtocol := aMethod protocol.
	operator := anOperatorApplied.
	nodeNumber := aNodeNumber.
	originalClass := aClass
]

{ #category : 'installing' }
MyMTMethodMutation >> install [
	"Install the mutant compiling the modified source into the class."

	MyMTMethodInstaller new
		installFromSourceSilently: self modifiedSource
		in: originalClass
]

{ #category : 'accessing' }
MyMTMethodMutation >> modifiedSource [

	^ operator modifiedSourceFor: originalMethod number: nodeNumber
]

{ #category : 'accessing' }
MyMTMethodMutation >> mutatedNode [

	^ operator applyTo: self nodeToMutate
]

{ #category : 'accessing' }
MyMTMethodMutation >> nodeNumber [

	^ nodeNumber
]

{ #category : 'accessing' }
MyMTMethodMutation >> nodeNumber: anInteger [ 
	nodeNumber := anInteger
]

{ #category : 'accessing' }
MyMTMethodMutation >> nodeToMutate [

	| n searcher |
	n := 1.
	searcher := RBParseTreeSearcher new
		            matches: operator expressionToReplace
		            do: [ :node :answer | 
			            n = nodeNumber ifTrue: [ ^ node ].
			            n := n + 1 ];
		            yourself.
	searcher executeTree: originalMethod ast.
	self error: 'Not found'
]

{ #category : 'accessing' }
MyMTMethodMutation >> operator [
	^operator
]

{ #category : 'accessing' }
MyMTMethodMutation >> originalClass [
	^ originalClass
]

{ #category : 'accessing' }
MyMTMethodMutation >> originalMethod [
	^originalMethod.
]

{ #category : 'accessing' }
MyMTMethodMutation >> originalSource [
	^ originalMethod sourceCode asString
]

{ #category : 'printing' }
MyMTMethodMutation >> printOn: aStream [ 
	aStream nextPutAll: operator description;
		 nextPutAll: ' in ';
		 nextPutAll: originalClass printString;
		nextPutAll: '>>';
		nextPutAll: originalMethod  selector printString.
]

{ #category : 'running' }
MyMTMethodMutation >> runMutantStoppingOnError: aBoolean [

	| testResults |
	EpMonitor disableDuring: [
		[ self install.
		testResults :=  self runTestsStoppingOnError: aBoolean
  		] ensure: [ self uninstall ] ].
	^ testResults
]

{ #category : 'private' }
MyMTMethodMutation >> runTestsStoppingOnError: aBoolean [

	| testSuite |
	testSuite := TestSuite named: 'Tests cases for: ' , self printString.
	testSuite addTests: testCaseReferences.
	^ aBoolean
		  ifTrue: [ testSuite runStoppingOnFirstFailOrError ]
		  ifFalse: [ testSuite run ]
]

{ #category : 'private' }
MyMTMethodMutation >> testCaseReferences [
	^ testCaseReferences
]

{ #category : 'private' }
MyMTMethodMutation >> testCaseReferences: aCollectionOfTestCaseReferences [
	testCaseReferences := aCollectionOfTestCaseReferences
]

{ #category : 'installing' }
MyMTMethodMutation >> uninstall [
	"UnInstall the mutant recompiling the original method into the class."

	MyMTMethodInstaller new
		install: originalMethod
		for: originalMethod selector
		in: originalClass
		withProtocol: originalProtocol
]
