Class {
	#name : 'MyMTClassForTestingCoverage',
	#superclass : 'Object',
	#category : 'MyMuTalk-TestResources',
	#package : 'MyMuTalk-TestResources'
}

{ #category : 'as yet unclassified' }
MyMTClassForTestingCoverage class >> aClassCoveredMethod [
	^true.
]

{ #category : 'instance creation' }
MyMTClassForTestingCoverage class >> new: aSize [
	" from UUID class>> #new:"
	(aSize == 16) ifFalse: [ self error: 'Wrong UUID size' ].
	
	^ super new: aSize
]

{ #category : 'as yet unclassified' }
MyMTClassForTestingCoverage >> aCoveredMethod [

	^ true
]

{ #category : 'as yet unclassified' }
MyMTClassForTestingCoverage >> anUncoveredMethod [
	^ true
]

{ #category : 'as yet unclassified' }
MyMTClassForTestingCoverage >> anUncoveredMethodSubClassResponsibility [

	self subclassResponsibility 
]
