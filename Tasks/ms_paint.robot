*** Settings ***
Library     AutoItLibrary


*** Variables ***
${enter}  {ENTER}
${tab}  {TAB}
${alt+s}  !s

*** Test Case ***
Paint In MSpaint
    Send     \#r
    Win Wait   Run
    Send    mspaint ${enter}
    WinWaitActive   Untitled - Paint
    Send   ${enter}
    Sleep     2
    MouseClickDrag   LEFT  150  350  150  250
    Sleep     1
    MouseClickDrag   LEFT  150  250  200  200
    Sleep     1
    MouseClickDrag   LEFT  200  200  250  250
    Sleep     1
    MouseClickDrag   LEFT  250  250  150  250
    Sleep     1
    MouseClickDrag   LEFT  150  250  250  350
    Sleep     1
    MouseClickDrag   LEFT  250  350  250  250
    Sleep     1
    MouseClickDrag   LEFT  250  250  150  350
    Sleep     1
    MouseClickDrag   LEFT  150  350  250  350
    Sleep     1
    WinClose    Untitled - Paint
    Send   ${tab} ${enter}