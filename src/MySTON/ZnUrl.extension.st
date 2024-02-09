Extension { #name : 'ZnUrl' }

{ #category : '*MySTON' }
ZnUrl >> myStonContainSubObjects [
	^ false
]

{ #category : '*MySTON' }
ZnUrl >> myStonOn: myStonWriter [
	myStonWriter
		writeObject: self
		named: MySTONZnUrl myStonName
		listSingleton: self asString
]
