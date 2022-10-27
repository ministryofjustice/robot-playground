*** Settings ***
Library   SikuliLibrary  mode=NEW

*** Test Cases ***
Match on Image
    Start Sikuli Process
    Add Image Path    ${CURDIR}\\Images\\
    Highlight    Tabs.PNG