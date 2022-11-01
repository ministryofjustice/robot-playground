# Robot Framework Sikuli and Windows Calc


Simple Robot Framework tasks that interacts with Windows calculator

Due to reliance on AuotIT and Windows Calculator, this is only expected to work on Windows OS. 

## Robot Files
### sikuli_calculator.robot
- opens calculator, adds 10 to 1 and captures the output
 
- Note calculator buttons change colour when pressed. Due to this, the task is unsuccessful at pressing the same button twice in a row because it looks different once pressed.

- The Optical Character Recognition that reads the value from the display fails when there is only a single digit output.

### autoit\_xy\_calc.robot
Uses AutoIt to opens calculator, find its location on the screen, presses buttons based on x/y mouse coordinates.

### autoit\_id\_calc.robot
Uses AutoIt to opens calculator and presses buttons based on identifying information found using inspection tool, `Au3Info.exe`.
 
### read\_ocr\_text\_area.robot
Uses Optical Character Recognition to (OCR) read text from a specified area on the screen. An independent script but used to help get OCR in sikuli_calculator.robot working (or almost working)
