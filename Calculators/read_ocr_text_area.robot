*** Settings ***
Library    SikuliLibrary

*** Tasks ***
Read Text From Screen Region
    # Have found OCR silently fails without *both* the below (even though docs say English is default)
    Set Ocr Language    eng
    Set Ocr Text Read    True
    # x, y coords of top-left corner, then  width, height
    ${capture_region} =  Evaluate  [41, 96, 198, 34]
    ${result} =  Read Text From Region  ${capture_region}
    Log To Console  \
    Log To Console  Region: "${capture_region}"
    Log To Console  Result: "${result}"
