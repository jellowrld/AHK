; Variables
Toggle := False

; Create the GUI
Gui, Add, Button, x10 y10 w80 h30 gStartLoop, Start
Gui, Add, Button, x100 y10 w80 h30 gStopLoop, Stop
Gui, Show, w200 h60, F Key Presser

; Toggle with F1
F1::
    Toggle := !Toggle
    if (Toggle)
    {
        SetTimer, PressF, 0
        GuiControl,, StartLoop, Stop
    }
    else
    {
        SetTimer, PressF, Off
        GuiControl,, StartLoop, Start
    }
return

; Start loop from GUI
StartLoop:
    if (!Toggle)
    {
        Toggle := True
        SetTimer, PressF, 0
        GuiControl,, StartLoop, Stop
    }
return

; Stop loop from GUI
StopLoop:
    if (Toggle)
    {
        Toggle := False
        SetTimer, PressF, Off
        GuiControl,, StartLoop, Start
    }
return

PressF:
    Send, {F} ; Press F
    Sleep, 8000 ; Wait 8 seconds
return

GuiClose:
    ExitApp
