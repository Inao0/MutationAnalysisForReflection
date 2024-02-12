Class {
	#name : 'MyMTUtilityAnalysis',
	#superclass : 'Object',
	#instVars : [
		'classes'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'environments' }
MyMTUtilityAnalysis class >> forClasses: aCollectionOfClasses [

	^ self new classes: aCollectionOfClasses
]

{ #category : 'environments' }
MyMTUtilityAnalysis class >> forPackages: aCollectionOfPackages [

	| allClasses |
	allClasses := aCollectionOfPackages
		              inject: OrderedCollection new
		              into: [ :coll :package |
			              coll addAll: package asPackage definedClasses.
			              coll ].
		
	^ self new classes: allClasses
]

{ #category : 'accessing' }
MyMTUtilityAnalysis >> classes [

	^ classes
]

{ #category : 'accessing' }
MyMTUtilityAnalysis >> classes: anObject [

	classes := anObject
]
