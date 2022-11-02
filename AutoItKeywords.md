AutoIt Keywords
======

| Keyword |	Params |	Returns |	Description |	Examples |
|--------|---------|--------|------|-----|
| Mouse Click |	Button to click = LEFT, RIGHT, MIDDLE,   Optional parameters x coordinate y coordinate number of clicks (default 1) Movement speed from 0 to 100.  0 is instant, 100 is slowest. |	1 for success 0 for failure |	Click the specified mouse button   Optionally move the mouse to a new  location first.     Also can optionally specify multiple clicks and movement speed.	# Left click once at current position Mouse Click  LEFT |   # Two left clicks at specified position and instant move speed Mouse Click  LEFT  300  200  2  0   # One right click at specified position and relatively slow movement speed  Mouse Click  RIGHT  400  100  1  80  |
| Mouse Down |	Button to press LEFT  RIGHT	||	Press the specified mouse button and keep it held down. | Cancel by using Mouse Up keywrod |	Mouse Down  LEFT |
|Mouse Up |	Mouse button to release LEFT RIGHT	||	Release mouse button. Used to End Mouse Down action. Note it's necessary to specify the button in question |	Mouse Up  LEFT |
| Mouse Move|	x coordinate, y coordinate	| n/a |	Move mouse pointer to the specified coordinates |	Mouse Move  600  200 Mouse Move  ${x}  ${y}|
|Win Get Title |	strTitle=, strText= |	The Window title |	Returns the title of the specified window which sounds a bit Catch 22 but this can return the title based on the hWind Class (if you know its value, possibly from an inspection tool?).    |  Usefully, can use [Active] as parameter to get the active window without need for any ID value. |	${title} =  Win Get Title  [Active] |
| Win Activate |	strTitle=, strText=	||	Switches focus to the particular window	 ||
|Win Close |	strTitle=, strText=	 ||	Close the window	||
|Win Exists	| strTitle=, strText= |	1 for true or 0 for false |	Check if window exits |	${exists}=  Win Exists   Command Prompt |
| Send | keys= | NA | Send keyboard input | Send  Legal Aid Agency. |
