#Persistent

; In this program, a pop-up window appears and encourages the user to get up and move around, to avoid the health hazard of sitting too much.
; The user can adjust the time interval if desired.
; I put this script in the Startup folder of the Start Menu so it runs whenever the system starts.
; Default values are set below:

; interval sets the time until the first pop-up appears (in milliseconds) 60000 = 1 minute.
interval:=60000

; oldVar sets the default period between pop-ups after the first (in minutes)
oldVar:=30

SetTimer, movement, 1800000
;MsgBox, First Timer Ran
return


movement:
	IfWinExist, GetUpAndMove
		{SetTimer, movement, Off
		return
		}
	Else If (A_TimeIdle<(interval*0.75))
		{MsgBox, 3, GetUpAndMove Timer - %oldVar% minutes, Time to stand up, stretch, and walk around a bit!`nClick Yes to reset timer.`nClick No to change interval.`nClick Cancel to quit.
		IfMsgBox, Cancel
		ExitApp
		IfMsgBox, No
			{InputBox, inVar, Interval, Enter a new time (in minutes):,,,,,,,,%oldVar%
			oldVar:=inVar
			interval:=inVar*60000
			SetTimer, movement, %interval%
			return
			}
		interval:=oldVar*60000
		SetTimer, movement, %interval%
		return
		}
