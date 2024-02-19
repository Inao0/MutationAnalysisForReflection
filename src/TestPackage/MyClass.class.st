Class {
	#name : 'MyClass',
	#superclass : 'OrderedCollection',
	#category : 'TestPackage',
	#package : 'TestPackage'
}

{ #category : 'accessing' }
MyClass >> selectorOf: aParameter [
	^ aParameter selector
]

{ #category : 'accessing' }
MyClass >> sizeOf: aParameter [
	^ aParameter size
]
