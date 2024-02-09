Extension { #name : 'Time' }

{ #category : '*MySTON' }
Time class >> fromMySton: myStonReader [
	^ self readFrom: myStonReader parseListSingleton readStream
]

{ #category : '*MySTON' }
Time >> myStonContainSubObjects [
	^ false
]

{ #category : '*MySTON' }
Time >> myStonOn: myStonWriter [
	"Use an ISO style HH:MM:SS.N representation (with optional nanoseconds)"

	myStonWriter writeObject: self listSingleton:
		(String streamContents: [ :stream |
			self print24: true showSeconds: true on: stream ])
]
