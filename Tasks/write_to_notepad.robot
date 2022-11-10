*** Settings ***
Library     AutoItLibrary


*** Variables ***
${enter}  {ENTER}
${tab}  {TAB}
${alt+s}  !s

*** Test Case ***
Write To Notepad
    Send     \#r
    Win Wait   Run
    Send    notepad.exe ${enter}
    WinWaitActive  Untitled - Notepad
    Send  Hello World, ${enter} this is england ${enter}
    Send  this is now done
    Send  ${enter}
    Send  ^s
    Send  new.txt
    Send  ${enter}
    WinWaitActive  Confirm Save As
    Send  ${tab} ${enter}
    WinWaitActive  Untitled - Notepad
    ProcessClose  notepad.exe












