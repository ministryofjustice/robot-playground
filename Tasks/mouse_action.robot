*** Settings ***
Library     AutoItLibrary

*** Variables ***
${enter}  {ENTER}
${alt+s}  !s


*** Test Case ***
Mouse Action
    Run  control.exe main.cpl
    WinWaitActive  Mouse Properties
    Sleep    2
    Send  ${alt+s}
    Send  ${enter}





