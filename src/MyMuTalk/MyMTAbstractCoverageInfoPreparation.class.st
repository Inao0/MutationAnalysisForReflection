Class {
	#name : 'MyMTAbstractCoverageInfoPreparation',
	#superclass : 'Object',
	#instVars : [
		'mtResult'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTAbstractCoverageInfoPreparation >> mtResult [

	^ mtResult
]

{ #category : 'accessing' }
MyMTAbstractCoverageInfoPreparation >> mtResult: anObject [

	mtResult := anObject
]

{ #category : 'decoration' }
MyMTAbstractCoverageInfoPreparation >> prepare [
	self subclassResponsibility 
]
