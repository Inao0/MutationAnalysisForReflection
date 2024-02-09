Extension { #name : 'DateAndTime' }

{ #category : '*MySTON' }
DateAndTime class >> fromMySton: myStonReader [
	^ self readFrom: myStonReader parseListSingleton readStream
]

{ #category : '*MySTON' }
DateAndTime >> myStonContainSubObjects [
	^ false
]

{ #category : '*MySTON' }
DateAndTime >> myStonOn: myStonWriter [
	"Use an ISO representation with all details YYYY-MM-DDTHH:MM:SS.N+TZ (with optional nanoseconds and timezone offset)"

	myStonWriter writeObject: self listSingleton:
		(String streamContents: [ :stream |
			self printOn: stream withLeadingSpace: false ])
]
