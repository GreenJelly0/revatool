;어이어이 뭘보는거야 저리가
;이건 나만볼 수 있는 중요한것이란 말이다
#include ReadURL.ahk             
URL := "https://raw.githubusercontent.com/IYO1585/revatool/master/README.md"                        
Result := ReadURL(URL)
Version := 2.3
RegExMatch(Result,"\W현재 최신버전은 (.*?)입니다.\W",Latest)      
if (Latest1 > Version)
{
	MsgBox, 4164, ,현재 최신버전은 %Latest1%입니다.`n지금 업데이트 하시겠습니까?
	IfMsgBox, Yes
	{
		Run, "https://github.com/IYO1585/revatool"
	}
}

Gui, Add, Tab2, x2 y-1 w400 h160 +, 정보|로그(W.I.P)
Gui, Tab, 정보
Gui, Add, Text, x102 y29 w200 h20 + +Center, 전장에서 F2를 누르면 리겜이 됩니다
Gui, Add, Text, x32 y49 w350 h20 +Center, 상점/기타아이템에서 F3를 누르면 항아리를 자동으로 깨줍니다
Gui, Add, Button, x302 y129 w90 h20 +Center g크레딧, 크레딧
Gui, Add, Text, x67 y69 w270 h20 , F3 사용 도중에 그만하고싶다면 F4를 눌러주세요
Gui, Add, Text, x13 y135 w150 h20, 현재버전: %Version%
Gui, Tab, 로그
Gui, Add, ListView, x12 y29 w180 h120 vLog, 이름|갯수|시간
Gui, Tab, 로그
Gui, Add, Button, x282 y89 w110 h20 g삭제, 로그 전체 삭제
Gui, Tab, 로그
Gui, Add, Button, x282 y119 w110 h20 g저장, 현재 로그 저장
; Generated using SmartGUI Creator for SciTE
Gui, Show, w408 h166, 레바툴Beta

return

GuiClose:
ExitApp

escape := false

크레딧:
MsgBox, 0, 진짜 간단한 크레딧, Made by. IYO
return

삭제:
gui,submit,nohide
LV_Delete()
return

저장:
MsgBox, 4, 주의, 정말 로그를 저장 하시겠습니까?
ifmsgbox, yes
{
	IfExist, %A_ScriptDir%\log.txt
	{
		MsgBox, 4, 주의, 로그가 이미 존재합니다. 삭제하고 진행해도 괜찮아요..?
		ifmsgbox, yes
		{
			FileDelete, %A_ScriptDir%\log.txt
		}
		ifmsgbox, no
		{
			return
		}
	}
CB:=""

RowNumber = 0
Loop
{
RowNumber += 1
inside =
inside2 =
inside3 =

LV_GetText(inside, RowNumber,1)
LV_GetText(inside2, RowNumber,2)
LV_GetText(inside3, RowNumber,3)

if inside <>   ;내역이 있을경우만 저장
{
	CB = %CB%%inside%   %inside2%개   %inside3%`n
}

if RowNumber = 100 ;최대 100개까지만 저장
break
}


FileAppend, %CB%, %A_ScriptDir%\log.txt
	/*
	LV_GetText(listlog, "%logcount%")
	FileAppend, %Log%, %A_ScriptDir%log.txt
	*/
	MsgBox, 0, 결과는...?!, 저장완료!
	return
}
ifmsgbox, No
{
	return
}
return

F2::
Blockinput, MouseMove
Blockinput, Send
sleep 10
loop 3
{
send, {ctrl down}
send, r
sleep, 40
send, {ctrl up}
}
send, {enter}
loop 5
{
send, {ctrl down}
send, r
sleep, 40
send, {ctrl up}
}
send, {enter}
loop 5
{
send, {ctrl down}
send, r
sleep, 40
send, {ctrl up}
}
send, {enter}
Blockinput, MousemoveOff
Blockinput, default
return


F3::
escape := false
item := unknown
much := unknown
CoordMode, Mouse, Client
CoordMode, Pixel, Client
loop
{
	if(escape = true)
		{
			break
			return
		}
	;F4상호작용
	MouseClick, left, 499, 117, 1, 0
	sleep, 5500
	
	;골드 확인
	Imagesearch, vx, vy, 1, 1, A_ScreenWidth, A_ScreenHeight, *40 images\NoGold.png
	If (Errorlevel = 0)
	{
		MsgBox, 0, 그지됨, 골드가 부족합니다 돈버세오
		gui,submit,nohide
		LV_Add("","NoGold","Unknown",hm)
		break
		return
	}
	;아이템 종류 검색
	Imagesearch, vx, vy, 1, 1, A_ScreenWidth, A_ScreenHeight, *40 images\mk.png
	If (Errorlevel = 0)
	{
		item := "무색 큐브 조각"
		goto, much
	}
	If (Errorlevel = 1)
	{
		Imagesearch, vx, vy, 1, 1, A_ScreenWidth, A_ScreenHeight, *40 images\pm.png
		If (Errorlevel = 0)
		{
			item := "파멸의 마석"
			goto, much
		}
		If (Errorlevel = 1)
		{
			Imagesearch, vx, vy, 1, 1, A_ScreenWidth, A_ScreenHeight, *40 images\fire.png
			If (Errorlevel = 0)
			{
				gui,submit,nohide
				LV_Add("",파이어 폭스 레볼루션,1,hm)
				goto, break
			}
			If (Errorlevel = 1)
			{
				Imagesearch, vx, vy, 1, 1, A_ScreenWidth, A_ScreenHeight, *40 images\hat.png
				If (Errorlevel = 0)
				{
					gui,submit,nohide
					LV_Add("",항아리 모자,1,hm)
					goto, break
				}
				If (Errorlevel = 1)
				{
					/*
					gui,submit,nohide
					LV_Add("","Unknown",much,hm)
					*/
					item := "Unknown"
				}
			}
		}
	}
	;수량 검색
	much:
	Imagesearch, vx, vy, 1, 1, A_ScreenWidth, A_ScreenHeight, *40 images\1.png
	If (Errorlevel = 0)
		{
			much := 1
			goto, mix
		}
	If (Errorlevel = 1)
	{
		Imagesearch, vx, vy, 1, 1, A_ScreenWidth, A_ScreenHeight, *40 images\2.png
		If (Errorlevel = 0)
		{
			much := 2
			goto, mix
		}
		If (Errorlevel = 1)
		{
			Imagesearch, vx, vy, 1, 1, A_ScreenWidth, A_ScreenHeight, *40 images\10.png
			If (Errorlevel = 0)
			{
				much := 10
				goto, mix
			}
			If (Errorlevel = 1)
			{
				Imagesearch, vx, vy, 1, 1, A_ScreenWidth, A_ScreenHeight, *40 images\50.png
				If (Errorlevel = 0)
				{
					much := 50
					goto, mix
				}
				If (Errorlevel = 1)
				{
					Imagesearch, vx, vy, 1, 1, A_ScreenWidth, A_ScreenHeight, *40 images\100.png
					If (Errorlevel = 0)
					{
						much := 100
						goto, mix
					}
					If (Errorlevel = 1)
					{
						Imagesearch, vx, vy, 1, 1, A_ScreenWidth, A_ScreenHeight, *40 images\5.png
						If (Errorlevel = 0)
						{
							much := 5
							goto, mix
						}
						If (Errorlevel = 1)
						{
							Imagesearch, vx, vy, 1, 1, A_ScreenWidth, A_ScreenHeight, *40 images\1000.png
							If (Errorlevel = 0)
							{
								much := 1000
								goto, mix
							}
							If (Errorlevel = 1)
							{
								much := 500
							}
						}
					}
				}
			}
		}
	}
	mix:
	FormatTime, hm, ,MM월dd일 tt hh시mm분ss초
	gui,submit,nohide
	LV_Add("",item,much,hm)
	
	break:
	if(escape = true)
	{
		break
		return
	}
	MouseClick, left, 289, 305, 1, 0
}
return


F4::
escape := true
return