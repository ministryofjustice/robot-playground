*** Settings ***
Library    AutoItLibrary
Library    SikuliLibrary

*** Variables ***
${IMAGE_DIR}      ${CURDIR}\\img

*** Tasks ***
Ten Plus One
    # AutoIT used to Open Application
    # Full path is C:\\Windows\\System32\\calc.exe
    Run  calc
    
    # Sikuli used from here
    Add Image Path    ${IMAGE_DIR}
    
    # Keyword below ends "Contain" with no s
    Wait Until Screen Contain    CalculatorDisplayIsZero.PNG    5
    Click    Button1.PNG
    Click    Button0.PNG
    Click    ButtonPlus.PNG
    Click    Button1.PNG
    Click    ButtonEquals.PNG

    # Trying to read text from calculator
    # Need both settings below for image recognition to work (even though docs say eng is default)
    Set Ocr Language    eng 
    Set Ocr Text Read    True

    # Valid direction values - left, right, above, below?
    ${capture_region} =  Get Extended Region From Image    AreaBelowOutputValues.PNG    above    1
    ${result} =  Read Text From Region  ${capture_region}

    Log To Console  \
    Log To Console  Calculator Display Region: "${capture_region}"
    Log To Console  Result: "${result}"
