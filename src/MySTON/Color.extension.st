Extension { #name : 'Color' }

{ #category : '*MySTON' }
Color class >> fromMySton: myStonReader [
	| representation |
	representation := myStonReader parseMapOrListRepresentation.
	^ representation isArray
		ifTrue: [
			self named: representation first ]
		ifFalse: [
			(representation includesKey: #rgb)
				ifTrue: [
					self basicNew setRGB: (representation at: #rgb); setAlpha: 1.0 "backwards compatibility" ]
				ifFalse: [
					self
						r: (representation at: #red)
						g: (representation at: #green)
						b: (representation at: #blue)
						alpha: (representation at: #alpha) ] ]
]

{ #category : '*MySTON' }
Color >> myStonContainSubObjects [
	^ false
]

{ #category : '*MySTON' }
Color >> myStonOn: myStonWriter [
	| name |
	(self isTranslucent or: [ (name := self name) = #unnamed ])
		ifTrue: [
			myStonWriter writeObject: self streamMap: [ :map |
				#(red green blue alpha) do: [ :each |
					map at: each put: (self perform: each) ] ] ]
		ifFalse: [
			myStonWriter writeObject: self listSingleton: name ]
]
