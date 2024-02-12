Class {
	#name : 'MyMTAllMutantSelectionStrategy',
	#superclass : 'MyMTMutantSelectionStrategy',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'generating' }
MyMTAllMutantSelectionStrategy >> classesAndMetaclassesFrom: modelClasses [ 
	^ modelClasses
		inject: OrderedCollection new
		into: [:classes :aClass | 
			classes add: aClass;
				 add: aClass class.
			classes]
]

{ #category : 'generating' }
MyMTAllMutantSelectionStrategy >> methodsToMutateFrom: aMutationTestingAnalysis [ 
	^ (self classesAndMetaclassesFrom: aMutationTestingAnalysis modelClasses)
		inject: OrderedCollection new
		into: [:methods :aClass | 
			methods addAll: aClass methods.
			methods]
]
