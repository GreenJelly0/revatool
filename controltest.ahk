#include Gdip.ahk
#include Gdip_ImageSearch.ahk
#include Search_img.ahk

Gui, Add, Radio, x12 y9 w180 h30 vA1, 정식버전
Gui, Add, Radio, x12 y49 w180 h30 vA2, 개조버전
Gui, Show, w200 h92, Untitled GUI
return

GuiClose:
ExitApp

F3::
RV := 0
Gui, Submit, Nohide
if (A1 = 1)
{
	ControlClick, X509 Y166,레바의 모험 FINAL
	sleep, 5500
	WinGet,RV,ID,레바의 모험 FINAL
	if(Search_img("images\mk.png",RV,vx,vy))
	{
		MSgBox, finded! x=%vx% y=%vy%
	}
	return
}
if (A2 = 1)
{
	ControlClick,X509 Y166,Flash Player
	sleep, 5500
	WinGet,RV,ID,Flash Player
	if(Search_img("images\mk.png",RV,vx,vy))
	{
		MSgBox, finded! x=%vx% y=%vy%
	}
	return
}
return
	
		