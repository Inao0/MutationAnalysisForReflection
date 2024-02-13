"
STONTestUser2 extends STONTestUser with explicit implementations of #fromSton: and #stonOn:
"
Class {
	#name : 'MySTONTestUser2',
	#superclass : 'MySTONTestUser',
	#category : 'MySTON-Tests',
	#package : 'MySTON-Tests'
}

{ #category : 'ston-core' }
MySTONTestUser2 class >> myStonName [
	^ #TestUser2
]

{ #category : 'ston-core' }
MySTONTestUser2 class >> stonName [
	^ #TestUser2
]

{ #category : 'ston-core' }
MySTONTestUser2 >> fromMySton: myStonReader [
	myStonReader parseMapDo: [ :key :value |
		key = #username ifTrue: [ username := value ].
		key = #password ifTrue: [ password := value ].
		key = #enabled ifTrue: [ enabled := value ] ]
]

{ #category : 'ston-core' }
MySTONTestUser2 >> fromSton: stonReader [
	stonReader parseMapDo: [ :key :value |
		key = #username ifTrue: [ username := value ].
		key = #password ifTrue: [ password := value ].
		key = #enabled ifTrue: [ enabled := value ] ]
]

{ #category : 'ston-core' }
MySTONTestUser2 >> myStonOn: myStonWriter [
	myStonWriter writeObject: self streamMap: [ :dictionary |
		dictionary
			at: #username put: username;
			at: #password put: password;
			at: #enabled put: enabled ]
]

{ #category : 'ston-core' }
MySTONTestUser2 >> stonOn: stonWriter [
	stonWriter writeObject: self streamMap: [ :dictionary |
		dictionary
			at: #username put: username;
			at: #password put: password;
			at: #enabled put: enabled ]
]
