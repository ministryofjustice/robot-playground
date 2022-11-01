*** Settings ***
Library    AutoItLibrary
Library    SikuliLibrary

*** Variables ***
${IMAGE_DIR}      ${CURDIR}\\img

*** Tasks ***
Read Calculator
    [Documentation]  Practice reading result from Windows cacluator. Does not launch calc.
    # Sikuli Image Recognition from here
    Add Image Path    ${IMAGE_DIR}
    # Need both the below for image recognition to work (even though docs say eng is default)
    Set Ocr Language    eng 
    Set Ocr Text Read    True

    # Valid directions for below - left, right, above, below
    ${capture_region} =  Get Extended Region From Image    AreaBelowOutputValues.PNG    above    1
    ${result} =  Read Text From Region  ${capture_region}

    Log To Console  \
    Log To Console  Region: "${capture_region}"
    Log To Console  Result: "${result}"
