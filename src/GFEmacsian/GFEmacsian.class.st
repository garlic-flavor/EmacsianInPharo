"
# Overview

This project aims to implement keyboard shortcuts like emacs on Pharo.
Currently, this is for mac only because of its keyboard layout.

# Tested Environment
- macOS 11 + Pharo 9.0

# Install
```
Metacello new
	baseline: 'GFEmacsian';
	repository: 'github://garlic-flavor/EmacsianInPharo:main/repository';
	load.
```

# Features
- Cursor move: Crtl + f, Crtl + b, Ctrl + n, Ctrl + p, Ctrl + a, Ctrl + e.
- Kill yank: Ctrl + k, Ctrl + y (without killing ring. just do cut and paste).
- Other: Crtl + o

# Acknowledgements
This is very inspired by these. **THANKS VERY MUCH !**
- Motivation: [https://stackoverflow.com/questions/38788468/how-to-get-emacs-like-keybindings-in-pharo](https://stackoverflow.com/questions/38788468/how-to-get-emacs-like-keybindings-in-pharo)
- Motivation: [https://hkoba.hatenablog.com/entry/2016/12/17/202942](https://hkoba.hatenablog.com/entry/2016/12/17/202942)
- The original of the Coping And Pasting: [https://github.com/tomooda/tekka](https://github.com/tomooda/tekka)
- Bug correction: [https://pharo-dev.pharo.narkive.com/ivE5cz8U/pharo-project-keymapping-questions](https://pharo-dev.pharo.narkive.com/ivE5cz8U/pharo-project-keymapping-questions)



"
Class {
	#name : #GFEmacsian,
	#superclass : #Object,
	#category : #GFEmacsian
}

{ #category : #protected }
GFEmacsian class >> doReset [
	<script>
	KMPragmaKeymapBuilder uniqueInstance reset.
]

{ #category : #initialization }
GFEmacsian class >> initialize [
	self
		doReset;
		installToFTTableMorph
	
]

{ #category : #protected }
GFEmacsian class >> installToFTTableMorph [

	|original|
	original := (FTTableMorph>>#initializeKeyBindings) sourceCode copyUpToSubstring: '"added by GFEmacsian"'.
	FTTableMorph compile: original, '"added by GFEmacsian".
	self
		bindKeyCombination: $n ctrl command
		toAction: [|parent|
			(parent := self owner) class = ClyQueryViewMorph ifTrue: [|browser nv idx|
				browser := parent browser.
				nv := browser navigationViews.
				idx := nv detectIndex: [ :e | e = parent ].
				idx := idx + 1.
				(nv size < idx ifTrue: [
					browser tabManager tabMorph contentMorph submorphs at: 1
				] ifFalse: [
					(nv at: idx) table
				]) takeKeyboardFocus
			]
		].
	self
		bindKeyCombination: $p ctrl command
		toAction: [|parent|
			(parent := self owner) class = ClyQueryViewMorph ifTrue: [|browser nv idx|
				browser := parent browser.
				nv := browser navigationViews.
				idx := nv detectIndex: [ :e | e = parent ].
				idx := idx - 1.
				(idx < 1 ifTrue: [
					browser tabManager tabMorph contentMorph submorphs at: 1
				] ifFalse: [
					(nv at: idx) table
				]) takeKeyboardFocus
			]
		].
	self 
		bindKeyCombination: $p ctrl
		toAction: [ :target :morph :event | self keyStrokeArrowUp: event ].
	self 
		bindKeyCombination: $n ctrl
		toAction: [ :target :morph :event | self keyStrokeArrowDown: event ].
	self
		bindKeyCombination: $c ctrl command
		toAction: [ :target :morph :event ||parent|
			(parent := self owner) class = ClyQueryViewMorph ifTrue: [|browser actualObjects|
				browser := parent browser.
				actualObjects := browser classSelection actualObjects.
				actualObjects ifNotEmpty: [|first|
					first := actualObjects first.
					browser selectClass: (browser metaLevelScope = ClyInstanceSideScope ifTrue: [
						first classSide
					] ifFalse: [
						first instanceSide
					])
				]
			]
		].
'
]
