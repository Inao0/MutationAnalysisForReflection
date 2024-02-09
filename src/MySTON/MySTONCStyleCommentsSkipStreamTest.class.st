Class {
	#name : 'MySTONCStyleCommentsSkipStreamTest',
	#superclass : 'TestCase',
	#category : 'MySTON-Tests',
	#package : 'MySTON',
	#tag : 'Tests'
}

{ #category : 'testing' }
MySTONCStyleCommentsSkipStreamTest >> testBlockReading [
	| input buffer |
	input := MySTONCStyleCommentsSkipStream on: 'abc/*comment*/def' readStream.
	buffer := String new: 6.
	self assert: (input readInto: buffer startingAt: 1 count: 4) equals: 4.
	self assert: (buffer copyFrom: 1 to: 4) equals: 'abcd'.
	self assert: (input readInto: buffer startingAt: 5 count: 4) equals: 2.
	self assert: buffer equals: 'abcdef'.
	input := MySTONCStyleCommentsSkipStream on: 'abc//comment\def' withCRs readStream.
	buffer := String new: 6.
	self assert: (input readInto: buffer startingAt: 1 count: 6) equals: 6.
	self assert: buffer equals: 'abcdef'.
	self assert: input atEnd
]

{ #category : 'testing' }
MySTONCStyleCommentsSkipStreamTest >> testCommentInString [
	self
		assert: (MySTONCStyleCommentsSkipStream on: '''/*comment*/''' readStream) upToEnd
		equals: '''/*comment*/'''.
	self
		assert: (MySTONCStyleCommentsSkipStream on: '{''foo'':''/*comment*/bar''}' readStream) upToEnd
		equals: '{''foo'':''/*comment*/bar''}'.
	self
		assert: (MySTONCStyleCommentsSkipStream on: '{''foo'':''//comment\''bar''}' readStream) upToEnd
		equals: '{''foo'':''//comment\''bar''}'.
	self
		assert: (MySTONCStyleCommentsSkipStream on: '{"foo":"/*comment*/bar"}' readStream) upToEnd
		equals: '{"foo":"/*comment*/bar"}'.
	self
		assert: (MySTONCStyleCommentsSkipStream on: '{"foo":"//comment\"bar"}' readStream) upToEnd
		equals: '{"foo":"//comment\"bar"}'
]

{ #category : 'testing' }
MySTONCStyleCommentsSkipStreamTest >> testMultiLineComment [
	self
		assert: (MySTONCStyleCommentsSkipStream on: 'foo\//comment\bar' withCRs readStream) upToEnd
		equals: 'foo\bar' withCRs.
	self
		assert: (MySTONCStyleCommentsSkipStream on: 'foo\//comment\bar' withCRs readStream) nextLine
		equals: 'foo'.
	self
		assert: ((MySTONCStyleCommentsSkipStream on: 'foo\//comment\bar' withCRs readStream) nextLine; nextLine)
		equals: 'bar'.
	self assert: (MySTONCStyleCommentsSkipStream on: '//comment' readStream) atEnd
]

{ #category : 'testing' }
MySTONCStyleCommentsSkipStreamTest >> testNonComment [
	self assert: (MySTONCStyleCommentsSkipStream on: 'foo' readStream) upToEnd equals: 'foo'.
	self assert: (MySTONCStyleCommentsSkipStream on: 'foo' readStream) nextLine equals: 'foo'.
	self deny: (MySTONCStyleCommentsSkipStream on: 'foo' readStream) atEnd.
	self assert: (MySTONCStyleCommentsSkipStream on: '' readStream) atEnd
]

{ #category : 'testing' }
MySTONCStyleCommentsSkipStreamTest >> testSTON [
	"Comments are processed first and totally removed.
	They are not even whitespace (not that whitespace is relevant in STON)."

	self
		assert: (MySTON fromStream: (MySTONCStyleCommentsSkipStream on: '123/*comment*/456' readStream))
		equals: 123456.
	self
		assert: (MySTON fromStream: (MySTONCStyleCommentsSkipStream on: '/*comment*/''abcd''' readStream))
		equals: 'abcd'.
	self
		assert: (MySTON fromStream: (MySTONCStyleCommentsSkipStream on: '123//456' readStream))
		equals: 123.
	self
		should: [ MySTON fromStream: (MySTONCStyleCommentsSkipStream on: '//456' readStream) ]
		raise: MySTONReaderError
]

{ #category : 'testing' }
MySTONCStyleCommentsSkipStreamTest >> testSingleLineComment [
	self assert: (MySTONCStyleCommentsSkipStream on: 'foo/*comment*/bar' readStream) upToEnd equals: 'foobar'.
	self assert: (MySTONCStyleCommentsSkipStream on: 'foo/*comment*/bar' readStream) nextLine equals: 'foobar'.
	self deny: (MySTONCStyleCommentsSkipStream on: 'foo/*comment*/bar' readStream) atEnd.
	self assert: (MySTONCStyleCommentsSkipStream on: '/*comment*/' readStream) atEnd
]
