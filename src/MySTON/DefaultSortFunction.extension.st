Extension { #name : 'DefaultSortFunction' }

{ #category : '*MySTON' }
DefaultSortFunction class >> fromMySton: myStonReader [
	"Overwritten to always return the default"

	self assert: myStonReader parseMap isEmpty.
	^ SortFunction default
]
