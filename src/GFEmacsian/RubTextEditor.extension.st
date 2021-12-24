Extension { #name : #RubTextEditor }

{ #category : #'*GFEmacsian' }
RubTextEditor class >> buildGFEmacsianShortcut: aBuilder [
	<keymap>
	|key|
	key := KeyboardEvent new "this is a dummy."
		setType: #keystroke
		buttons: 0
		position: 0@0
		keyValue: 0
		charCode: 0
		hand: nil
		stamp: 0.
	(aBuilder shortcut: #gfemacsianForward)
		category: #RubTextEditor
		default: $f ctrl
		do: [ :target | target editor cursorRight: key ]
		description: 'GFEmacsian: Move cursor forward.'.
    (aBuilder shortcut: #gfemacsianBackward)
		category: #RubTextEditor
		default: $b ctrl
		do: [ :target | target editor cursorLeft: key ]
		description: 'GFEmacsian: Move cursor backward'.
	(aBuilder shortcut: #gfemacsianDown)
		category: #RubTextEditor
		default: $n ctrl 
		do: [ :target | target editor cursorDown: key ]
		description: 'GFEmacsian: Move cursor to next line.'.
	(aBuilder shortcut: #gfemacsianUp)
		category: #RubTextEditor
		default: $p ctrl
		do: [ :target | target editor cursorUp: key ]
		description: 'GFEmacsian: Move cursor to previous line.'.
	(aBuilder shortcut: #gfemacsianDelete)
		category: #RubTextEditor
		default: $d ctrl
		do: [ :target | target editor forwardDelete: key ]
		description: 'GFEmacsian: Delete a forward character'.
	(aBuilder shortcut: #gfemacsianHome)
		category: #RubTextEditor
		default: $a ctrl
		do: [ :target | target editor cursorHome: key ]
		description: 'GFEmacsian: Move cursor to top of the line.'.
	(aBuilder shortcut: #gfemacsianEnd)
		category: #RubTextEditor
		default: $e ctrl
		do: [ :target | target editor cursorEnd: key ]
		description: 'GFEmacsian: Move cursor to the end of the line.'.
	(aBuilder shortcut: #gfemacsianKill)
		category: #RubTextEditor
		default: $k ctrl 
		do: [ :target | |editor c start end|
			editor := target editor.
			c := editor string at: editor caret ifAbsent: [Character cr].
			c = Character cr ifTrue: [
				editor forwardDelete: key
			] ifFalse: [
				start := editor caret.
				editor cursorEnd: key.
				end := editor caret.
				editor selectFrom: start to: (end - 1).
				editor copySelection.
				editor replaceSelectionWith: ''.
			]
		]
		description: 'GFEmacsian: Cut from cursor position to the end of the line.'.
	(aBuilder shortcut: #gfemacsianYank)
		category: #RubTextEditor
		default: $y ctrl 
		do: [ :target | target editor paste ]
		description: 'GFEmacsian: Do paste.'.

	(aBuilder shortcut: #gfemacsianInsertCursorToFront)
		category: #RubTextEditor
		default: $o ctrl 
		do: [ :target |
			(target editor)
				crWithIndent: key;
				cursorUp: key;
				cursorEnd: key.
		]
		description: 'GFEmacsian: Insert CR to front of the caret.'.

	(aBuilder shortcut: #gfemacsianMoveToPackageSelector)
		category: #RubTextEditor
		default: $n ctrl command
		do: [ :target ||fullbrowser|
			target class = RubEditingArea ifTrue: [
				(fullbrowser := target browser) ifNotNil: [
					fullbrowser packageView takeKeyboardFocus
				]
			]
		]
		description: 'GFEmacsian: In System Browser, select package view.'.

	(aBuilder shortcut: #gfemacsianMoveToMethodSelector)
		category: #RubTextEditor
		default: $p ctrl command
		do: [ :target ||fullbrowser|
			target class = RubEditingArea ifTrue: [
				(fullbrowser := target browser) ifNotNil: [
					fullbrowser methodView takeKeyboardFocus
				]
			]
		]
		description: 'GFEmacsian: In System Browser, select method view.'.

]
