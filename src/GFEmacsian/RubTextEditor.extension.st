Extension { #name : #RubTextEditor }

{ #category : #'*GFEmacsian' }
RubTextEditor class >> buildGFEmacsianShortcut: aBuilder [
	<keymap>
	|key|
	key := KeyboardEvent new
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
		description: 'GFEmacsian.'.
    (aBuilder shortcut: #gfemacsianBackward)
		category: #RubTextEditor
		default: $b ctrl
		do: [ :target | target editor cursorLeft: key ]
		description: 'GFEmacsian.'.
	(aBuilder shortcut: #gfemacsianDown)
		category: #RubTextEditor
		default: $n ctrl 
		do: [ :target | target editor cursorDown: key ]
		description: 'GFEmacsian.'.
	(aBuilder shortcut: #gfemacsianUp)
		category: #RubTextEditor
		default: $p ctrl
		do: [ :target | target editor cursorUp: key ]
		description: 'GFEmacsian.'.
	(aBuilder shortcut: #gfemacsianDelete)
		category: #RubTextEditor
		default: $d ctrl
		do: [ :target | target editor forwardDelete: key ]
		description: 'GFEmacsian.'.
	(aBuilder shortcut: #gfemacsianHome)
		category: #RubTextEditor
		default: $a ctrl
		do: [ :target | target editor cursorHome: key ]
		description: 'GFEmacsian.'.
	(aBuilder shortcut: #gfemacsianEnd)
		category: #RubTextEditor
		default: $e ctrl
		do: [ :target | target editor cursorEnd: key ]
		description: 'GFEmacsian.'.
]
