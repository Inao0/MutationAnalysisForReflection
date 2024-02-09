Extension { #name : 'FileReference' }

{ #category : '*MySTON' }
FileReference >> myStonOn: myStonWriter [
	self fileSystem isDiskFileSystem
		ifTrue: [ | diskFilePath |
			"in order to get $/ as delimiter and $. as working directory on all platforms"
			diskFilePath := path isWorkingDirectory
				ifTrue: [ '.' ]
				ifFalse: [ path pathString ].
			myStonWriter
				writeObject: self
				named: MySTONFileReference myStonName
				listSingleton: diskFilePath ]
		ifFalse: [
			super myStonOn: myStonWriter ]
]
