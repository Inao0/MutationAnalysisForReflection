"
STONReference holds a forward reference to another object during materialization.

"
Class {
	#name : 'MySTONReference',
	#superclass : 'Object',
	#instVars : [
		'index'
	],
	#category : 'MySTON-Core',
	#package : 'MySTON',
	#tag : 'Core'
}

{ #category : 'instance creation' }
MySTONReference class >> index: integer [
	^ self new
		index: integer;
		yourself
]

{ #category : 'comparing' }
MySTONReference >> = anObject [
	^ self class == anObject class and: [ self index = anObject index ]
]

{ #category : 'comparing' }
MySTONReference >> hash [
	^ index hash
]

{ #category : 'accessing' }
MySTONReference >> index [
	^ index
]

{ #category : 'accessing' }
MySTONReference >> index: integer [
	index := integer
]

{ #category : 'printing' }
MySTONReference >> isMyStonReference [ 
	^ true
]

{ #category : 'printing' }
MySTONReference >> printOn: stream [
	super printOn: stream.
	stream nextPut: $(; print: index; nextPut: $)
]
