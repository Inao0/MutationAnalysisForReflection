"
STONDictionaryWriter helps in writing dictionary based STON representations.
"
Class {
	#name : 'MySTONMapWriter',
	#superclass : 'MySTONStreamWriter',
	#category : 'MySTON-Core',
	#package : 'MySTON',
	#tag : 'Core'
}

{ #category : 'accessing' }
MySTONMapWriter >> at: key put: value [
	first ifTrue: [ first := false ] ifFalse: [ writer mapElementSeparator ].
	writer encodeKey: key value: value
]
