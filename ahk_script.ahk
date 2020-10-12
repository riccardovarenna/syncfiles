#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

//ctrl:^; alt:!; windows:#; shift:+

^+a::send, ggVG

;^j::Send {Down}
;^k::Send {Up}
;^l::Send {Right}
;^h::Send {Left}

RAlt & j::Send {Down}
RAlt & k::Send {Up}
RAlt & l::Send {Right}
RAlt & h::Send {Left}

^!t::Run C:\Program Files\Git\git-bash.exe --cd-to-home
;^!t::Run C:\Program Files\Git\git-bash.exe, C:\ClashOfStreamers
; wt for windows terminal
