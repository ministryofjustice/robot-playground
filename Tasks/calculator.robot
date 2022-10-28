*** Settings ***
Library     AutoItLibrary
Library    String


*** Variables ***
${enter}  {ENTER}
${tab}  {TAB}
${alt+s}  !s

*** Test Case ***
Calculator using AutoIT
    Send     \#r
    Win Wait   Run
    Send    calc ${enter}
    WinWaitActive   Calculator
    Send   ${enter}
    Sleep  2
    AutoItSetOption   SendKeyDelay   400
    Send  2*4*8*16=
    Sleep  2
    ${value}=  Win Get Text  Calculator
    ${total}=  Strip String  ${value}
    Log To Console    ${value}
    Log To Console    ${total}

    IF    "${total}" == "1024"
        Set Test Message    Calculated value is correct
    ELSE
        Set Test Message    Calculated value is In-correct
    END
    ProcessClose   win32calc.exe
