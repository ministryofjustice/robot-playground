*** Settings ***
Library    AutoItLibrary

*** Variables ***
# A way of creating a dictionary that works (after failing with "Create Dictionary" and "Evaluate" keywords)
# Note & prefix needed in definition here but revert to usual $ when using
&{calc_button_ids} =  1=131  2=132  3=133  4=134  5=135  6=136  plus=93  minus=94  equals=121

*** Tasks ***
AutoIT Calculator
    [Documentation]  Control Windows Calculator using AutoIt via Control details found 
    ...              using the AutoIT Window Info tool (Au3Info.exe)
    ${calc_pid} =  Run  calc
    Win Activate  Calculator
    Wait For Active Window  Calculator
  
    ${buttons_to_press} =  Evaluate  ["1", "plus", "2", "plus", "3", "plus", "4", "equals"]
    Log To Console  \n
    FOR  ${button}  IN  @{buttons_to_press}
        # Below fails if dictionary prefixed with & but OK with $ 
        ${button_id} =  Set Variable   ${calc_button_ids}[${button}]
        # Alternative way of retrieving value from dict
        ##${button_id} =  Get From Dictionary  ${calc_button_ids}  ${button}
        Log To Console    ID: ${button_id} button: ${button}
        Control Click    strTitle=Calculator  strText=${EMPTY}  strControl= ${button_id}
    END

    # Reading the result
    # The below get nothing
    ##${result} =  Control Get Text  strTitle=Calculator  strText=${EMPTY}  strControl=CLASS:#32770
    ##${result} =  Control Get Text  strTitle=Calculator  strText=${EMPTY}  strControl=CLASS:CalcFrame
    
    # This sort of works but when sent to console has a lot of whitespace
    # but oddly the data type of the returned value is int
    # Can avoid the whitespace problem by converting to str first
    ${result} =  Win Get Text    Calculator
    ${rtype} =  Evaluate  type(${result})
    ${sresult} =  Evaluate  str(${result})
    Log To Console  \nResult:${sresult}
