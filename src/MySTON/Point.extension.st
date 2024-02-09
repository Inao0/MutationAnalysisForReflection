Extension { #name : 'Point' }

{ #category : '*MySTON' }
Point >> fromMySton: myStonReader [
	myStonReader parseListDo: [ :each :index |
		index = 1 ifTrue: [ x := each ].
		index = 2 ifTrue: [ y := each ] ]
]

{ #category : '*MySTON' }
Point >> myStonOn: myStonWriter [
	myStonWriter writeObject: self streamShortList: [ :array |
		array add: x; add: y ]
]
