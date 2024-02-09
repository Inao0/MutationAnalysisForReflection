"
I am STONAlternativeRepresentationTestObject.

My properties are
 - id <Integer>
 - time <DateAndTime> in the local time zone
 - gridReference <Point <Float>@<Float>> in kilometer

My STON representation has the properties
 - id <Integer>
 - time <DateAndTime> in UTC
 - grid_reference <Point <Float>@<Float>> in miles

Note the different key, gridReference vs. grid_reference

Upon serialization, the conversions local time to UTC and kilometer to mile is performed.
Upon materialization, the convertions UTC to local tie and miles to kilometers are performed.
 
"
Class {
	#name : 'MySTONAlternativeRepresentationTestObject',
	#superclass : 'Object',
	#instVars : [
		'id',
		'time',
		'gridReference'
	],
	#classVars : [
		'KnownObjects'
	],
	#category : 'MySTON-Tests',
	#package : 'MySTON',
	#tag : 'Tests'
}

{ #category : 'example' }
MySTONAlternativeRepresentationTestObject class >> example [
	^ self new
		id: 1e9 atRandom;
		time: DateAndTime now;
		gridReference: 150.75@250.25;
		yourself
]

{ #category : 'ston persistence' }
MySTONAlternativeRepresentationTestObject >> fromMySton: myStonReader [
	myStonReader parseMapDo: [ :key :value |
		key = #id ifTrue: [ self id: value ].
		key = #time ifTrue: [ self timeUTC: value ].
		key = #grid_reference ifTrue: [ self gridReferenceImperial: value ] ]
]

{ #category : 'accessing' }
MySTONAlternativeRepresentationTestObject >> gridReference [
	^ gridReference
]

{ #category : 'accessing' }
MySTONAlternativeRepresentationTestObject >> gridReference: value [
	gridReference := value
]

{ #category : 'accessing' }
MySTONAlternativeRepresentationTestObject >> gridReferenceImperial [
	^ gridReference / 1.609344
]

{ #category : 'accessing' }
MySTONAlternativeRepresentationTestObject >> gridReferenceImperial: value [
	gridReference := value * 1.609344
]

{ #category : 'accessing' }
MySTONAlternativeRepresentationTestObject >> id [
	^ id
]

{ #category : 'accessing' }
MySTONAlternativeRepresentationTestObject >> id: anObject [
	id := anObject
]

{ #category : 'ston persistence' }
MySTONAlternativeRepresentationTestObject >> myStonOn: stonWriter [
	stonWriter writeObject: self streamMap: [ :dictionary |
		dictionary
			at: #id put: self id;
			at: #time put: self timeUTC;
			at: #grid_reference put: self gridReferenceImperial ]
]

{ #category : 'accessing' }
MySTONAlternativeRepresentationTestObject >> time [
	^ time
]

{ #category : 'accessing' }
MySTONAlternativeRepresentationTestObject >> time: anObject [
	time := anObject
]

{ #category : 'accessing' }
MySTONAlternativeRepresentationTestObject >> timeUTC [
	^ time asUTC
]

{ #category : 'accessing' }
MySTONAlternativeRepresentationTestObject >> timeUTC: value [
	time := value offset: TimeZone local offset
]
