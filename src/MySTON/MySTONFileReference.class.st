"
I am STONFileReference, I am an implementation artifact to help reading objects with class tag equal to my #stonName.

I am a FileReference.
"
Class {
	#name : 'MySTONFileReference',
	#superclass : 'FileReference',
	#category : 'MySTON-Core',
	#package : 'MySTON',
	#tag : 'Core'
}

{ #category : 'ston' }
MySTONFileReference class >> fromMySton: myStonReader [
	^ myStonReader parseListSingleton asFileReference
]

{ #category : 'ston' }
MySTONFileReference class >> fromSton: stonReader [
	^ stonReader parseListSingleton asFileReference
]

{ #category : 'ston' }
MySTONFileReference class >> myStonName [
	^ #FILE
]

{ #category : 'ston' }
MySTONFileReference class >> stonName [
	^ #FILE
]
