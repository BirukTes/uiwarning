[![View uiwarning on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://uk.mathworks.com/matlabcentral/fileexchange/74372-uiwarning)
# uiwarning
Shows a warning dialog using uitabgroup with parameter to delay user interaction.
#### Parameters
    1. uifigureObj     - uifigure
    2. title           - char/string
    3. message         - char/string
    4. showBackground  - logical
    5. delay           - 0 or int (or whole double) - disables 'OK' until end of delay

For problems or suggestions create issue.

Known issue:
    -> Dialog resizes as uifigure is resized. Correct behaviour should be that it remains unresized but should calculate centreX and centreY like built-in dialogs. Any suggestions would be great.

`1.0`