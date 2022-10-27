*** Settings ***
Library   AutoItLibrary

*** Test Cases ***
Paint Us A Picture
    ${pid}=  Open
    Draw
    Save
    Close  ${pid}

*** Keywords ***
Open
    ${id}=  Run    mspaint   ${EMPTY}  3
    Win Activate   paint
    Sleep  1

    RETURN  ${id}

Draw
    FOR    ${element}    IN RANGE  1  200  100
        Log    ${element}
        # Top lines
        Mouse Click Drag  strButton=left  nX1=${100+${element}}  nY1=200  nX2=400  nY2=400  nSpeed=1
        # Left lines
        Mouse Click Drag  strButton=left  nX1=100  nY1=${200+${${element}/2}}  nX2=400  nY2=400  nSpeed=1
        # Right lines
        Mouse Click Drag  strButton=left  nX1=800  nY1=${250+${${element}/2}}  nX2=400  nY2=400  nSpeed=1
        # Bottom lines
        Mouse Click Drag  strButton=left  nX1=${100+${element}}  nY1=600  nX2=400  nY2=400  nSpeed=1
    END

Save
    Send   ^s
    Sleep  1
    Send   D:\\Users\\abdul.qureshi\\Pictures\\mypainting{ENTER}y{ENTER}

Close
    [Arguments]  ${pid}

    Process Close  ${pid}
    Process Wait Close  ${pid}
