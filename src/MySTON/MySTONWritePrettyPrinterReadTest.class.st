"
STONWritePrettyPrinterReadTests tests pretty printed serialization followed by materialization.
"
Class {
	#name : 'MySTONWritePrettyPrinterReadTest',
	#superclass : 'MySTONWriteReadTest',
	#category : 'MySTON-Tests',
	#package : 'MySTON',
	#tag : 'Tests'
}

{ #category : 'private' }
MySTONWritePrettyPrinterReadTest >> serialize: anObject [
	^ String streamContents: [ :stream |
		MySTON writer
			on: stream;
			prettyPrint: true;
			nextPut: anObject ]
]

{ #category : 'private' }
MySTONWritePrettyPrinterReadTest >> serializeJson: anObject [
	^ String streamContents: [ :stream |
		MySTON jsonWriter
			on: stream;
			prettyPrint: true;
			nextPut: anObject ]
]
