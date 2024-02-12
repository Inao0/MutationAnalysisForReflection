Class {
	#name : 'MyMTAbstractJsonExporter',
	#superclass : 'Object',
	#instVars : [
		'mtResult'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'as yet unclassified' }
MyMTAbstractJsonExporter >> export [

	self subclassResponsibility 
]

{ #category : 'accessing' }
MyMTAbstractJsonExporter >> mtResult [

	^ mtResult
]

{ #category : 'accessing' }
MyMTAbstractJsonExporter >> mtResult: anObject [

	mtResult := anObject
]
