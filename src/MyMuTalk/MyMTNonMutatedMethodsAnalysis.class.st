Class {
	#name : 'MyMTNonMutatedMethodsAnalysis',
	#superclass : 'MyMTUtilityAnalysis',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'computing' }
MyMTNonMutatedMethodsAnalysis >> allMethods [

	^ classes inject: OrderedCollection new into: [ :coll :class |
		  coll addAll: (class methods reject: #isExtension).
		  coll ]
]

{ #category : 'computing' }
MyMTNonMutatedMethodsAnalysis >> methodsWithoutMutation [

	| allMethods allMutatedMethods |
	allMethods := self allMethods.
	allMutatedMethods := self mutatedMethods.

	^ allMethods reject: [ :method | allMutatedMethods includes: method ]
]

{ #category : 'computing' }
MyMTNonMutatedMethodsAnalysis >> mutatedMethods [

	| analysis mutatedMethods |
	analysis := MyMTAnalysis new
		            classesToMutate: classes;
		            testClasses: {  };
		            operators: MyMTMutantOperator contentsAll.

	mutatedMethods := Set withAll:
		                  (analysis generateMutations collect:
			                   #originalMethod).
	^ mutatedMethods
]
