*** Settings ***
Library    AutoItLibrary

*** Variables ***
${expected_window_title} =  Untitled - Paint
${toolbar_offset} =  160

*** Keywords ***
Get Window Edges
    [Documentation]  Return coordinates of window border left and top
    ${left_edge} =  Win Get Pos X  ${expected_window_title}
    ${top_edge} =  Win Get Pos Y  ${expected_window_title}
    [Return]  ${left_edge}  ${top_edge}
    
Draw Points
    [Arguments]  ${points}
    ${left_edge}  ${top_edge}  Get Window Edges
    # Move mouse to starting point without drawing
    ${x} =  Evaluate    ${left_edge} + ${points}[0][0]
    ${y} =  Evaluate    ${top_edge} + ${toolbar_offset} + ${points}[0][1]
    Log To Console  \nStart Point: ${x},${y}
    Mouse Move  ${x}  ${y}

    # Draw remaining points with mouse down
    Mouse Down  LEFT
    FOR  ${point}  IN  @{points}[1:]
        ${x} =  Evaluate  ${left_edge} + ${point}[0]
        ${y} =  Evaluate  ${top_edge} + ${toolbar_offset} + ${point}[1] 
        Log To Console    Point: ${x},${y}
        Mouse Move  ${x}  ${y}
    END
    Mouse Up  LEFT

Click Pen Icon
    ${left_edge}  ${top_edge}  Get Window Edges
    ${x} =  Evaluate    ${left_edge} + 245
    ${y} =  Evaluate    ${top_edge} + 80
    Log To Console   Pen Icon: ${x} : ${y}
    Mouse Click  LEFT  ${x}  ${y}  1  0

Pick Colour
    [Documentation]  Colour values 0 to 10 (just calculate coordinates for top row of colour picker)
    [Arguments]  ${cid}=0
    ${left_edge}  ${top_edge}  Get Window Edges
    ${x} =  Evaluate    ${left_edge} + 760 + ${cid}*20
    ${y} =  Evaluate    ${top_edge} + 70
    Log To Console  \nColour: ${x}, ${y}
    Mouse Click  LEFT  ${x}  ${y}  1  0

Start MS Paint
    Send     \#r
    Win Wait   Run
    Send    mspaint.exe {ENTER}
    WinWaitActive  ${expected_window_title}


*** Tasks ***
Make Art
    Start MS Paint
    
    # Pick pen *before* picking colour
    Click Pen Icon

    Pick Colour  1
    ${coordinates} =  Evaluate  [(100, 100), (100, 400), (400, 400), (400, 100), (100, 100)]
    Draw Points  ${coordinates}

    ${roof} =  Evaluate  [(100, 100), (250, 10), (400, 100)]
    Pick Colour  4
    Draw Points  ${roof}

    Pick Colour  7
    ${door} =  Evaluate  [(150, 400), (150, 300), (200, 300), (200, 400)]
    Draw Points  ${door}

    Pick Colour  9
    ${path} =  Evaluate  [(150, 400), (220, 600), (340, 600), (200, 400)]
    Draw Points  ${path}
