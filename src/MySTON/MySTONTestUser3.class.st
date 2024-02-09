"
STONTestUser3 extends STONTestUser but wants nil instance variables to be written
"
Class {
	#name : 'MySTONTestUser3',
	#superclass : 'MySTONTestUser',
	#category : 'MySTON-Tests',
	#package : 'MySTON',
	#tag : 'Tests'
}

{ #category : 'ston-core' }
MySTONTestUser3 class >> myStonAllInstVarNames [
	^ #(username password enabled)
]

{ #category : 'ston-core' }
MySTONTestUser3 class >> myStonName [
	^ #TestUser3
]

{ #category : 'ston-core' }
MySTONTestUser3 class >> stonAllInstVarNames [
	^ #(username password enabled)
]

{ #category : 'ston-core' }
MySTONTestUser3 class >> stonName [
	^ #TestUser3
]

{ #category : 'ston-core' }
MySTONTestUser3 >> myStonShouldWriteNilInstVars [
	^ true
]

{ #category : 'ston-core' }
MySTONTestUser3 >> stonShouldWriteNilInstVars [
	^ true
]
