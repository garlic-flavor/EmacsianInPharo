# Overview

**!!!Under construction !!!**
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

# Acknowledgements
This is very inspired by these. **THANKS VERY MUCH !**
- Motivation: [https://stackoverflow.com/questions/38788468/how-to-get-emacs-like-keybindings-in-pharo](https://stackoverflow.com/questions/38788468/how-to-get-emacs-like-keybindings-in-pharo)
- Motivation: [https://hkoba.hatenablog.com/entry/2016/12/17/202942](https://hkoba.hatenablog.com/entry/2016/12/17/202942)
- The original of the Coping And Pasting: [https://github.com/tomooda/tekka](https://github.com/tomooda/tekka)
- Bug correction: [https://pharo-dev.pharo.narkive.com/ivE5cz8U/pharo-project-keymapping-questions](https://pharo-dev.pharo.narkive.com/ivE5cz8U/pharo-project-keymapping-questions)


