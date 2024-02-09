"
I am STONZnUrl, I am an implementation artifact to help reading objects with class tag equal to my #stonName.

I am a ZnUrl.
"
Class {
	#name : 'MySTONZnUrl',
	#superclass : 'ZnUrl',
	#category : 'MySTON-Core',
	#package : 'MySTON',
	#tag : 'Core'
}

{ #category : 'instance creation' }
MySTONZnUrl class >> fromMySton: myStonReader [
	^ ZnUrl fromString: myStonReader parseListSingleton
]

{ #category : 'instance creation' }
MySTONZnUrl class >> fromSton: stonReader [
	^ ZnUrl fromString: stonReader parseListSingleton
]

{ #category : 'accessing' }
MySTONZnUrl class >> myStonName [
	^ #URL
]

{ #category : 'accessing' }
MySTONZnUrl class >> stonName [
	^ #URL
]
