*** Settings ***
Library    AutoItLibrary

*** Variables ***

*** Keywords ***
Get Window Location
    [Arguments]  ${window_title}
    ${x} =  Win Get Pos X  ${window_title}
    ${y} =  Win Get Pos Y  ${window_title}
    ${width} =  Win Get Pos Width  ${window_title}
    ${height} =  Win Get Pos Height  ${window_title}
    ${all} =  Create List  ${x}  ${y}  ${width}  ${height}
    [Return]  ${all}

*** Tasks ***
AutoIT Calculator
    [Documentation]  Control Windows Calculator using AutoIt and x/y mouse coordinates
    ${calc_pid} =  Run  calc
    Win Activate  Calculator
    Wait For Active Window  Calculator
    ${location_info} =  Get Window Location  Calculator 
    Log To Console  Found calculator here: "${location_info}" 

    # Have to include "Set Vairable" otherwise get "No keyword with name" error
    # Not clear from info here http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#accessing-list-and-dictionary-items
    ${x} =  Set Variable  ${location_info}[0]   
    ${y} =  Set Variable  ${location_info}[1]

    ${xtype} =    Evaluate     type($x)
    Log To Console    TYPE: ${xtype}
    
    # Below Fails with  "ValueError: invalid literal for int() with base 10: '0 + 244'" Note ${x} and ${y} are definitely ints
    ##Mouse Move  ${x} + 244  ${y} + 28
    
    # Click "1" button in two Auto IT steps
    ${mousex} =  Evaluate  ${x} + 28
    ${mousey} =  Evaluate  ${y} + 260
    Mouse Move  ${mousex}  ${mousey}
    Mouse Click    LEFT

    # Click + button in one Auto IT step
    ${mousex} =  Evaluate  ${x} + 152
    ${mousey} =  Evaluate  ${y} + 292
    # 3rd param - number of clicks (default is 1)
    # 4th param - speed (default is 10, 0 is instant) 
    Mouse Click  LEFT    ${mousex}    ${mousey}    1    0

    # Click "2" button
    ${mousex} =  Evaluate  ${x} + 75
    ${mousey} =  Evaluate  ${y} + 260 
    Mouse Click  LEFT    ${mousex}    ${mousey}    1    0

    # Click "=" button
    ${mousex} =  Evaluate  ${x} + 180
    ${mousey} =  Evaluate  ${y} + 260 
    Mouse Click  LEFT    ${mousex}    ${mousey}    1    0
    