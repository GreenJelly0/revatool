;���̾��� �����°ž� ������
;�̰� ������ �� �ִ� �߿��Ѱ��̶� ���̴�
#include ReadURL.ahk             
URL := "https://raw.githubusercontent.com/IYO1585/revatool/master/README.md"                        
Result := ReadURL(URL)
Version := 2.3
RegExMatch(Result,"\W���� �ֽŹ����� (.*?)�Դϴ�.\W",Latest)      
if (Latest1 > Version)
{
	MsgBox, 4164, ,���� �ֽŹ����� %Latest1%�Դϴ�.`n���� ������Ʈ �Ͻðڽ��ϱ�?
	IfMsgBox, Yes
	{
		Run, "https://github.com/IYO1585/revatool"
	}
}

Gui, Add, Tab2, x2 y-1 w400 h160 +, ����|�α�(W.I.P)
Gui, Tab, ����
Gui, Add, Text, x102 y29 w200 h20 + +Center, ���忡�� F2�� ������ ������ �˴ϴ�
Gui, Add, Text, x32 y49 w350 h20 +Center, ����/��Ÿ�����ۿ��� F3�� ������ �׾Ƹ��� �ڵ����� ���ݴϴ�
Gui, Add, Button, x302 y129 w90 h20 +Center gũ����, ũ����
Gui, Add, Text, x67 y69 w270 h20 , F3 ��� ���߿� �׸��ϰ�ʹٸ� F4�� �����ּ���
Gui, Add, Text, x13 y135 w150 h20, �������: %Version%
Gui, Tab, �α�
Gui, Add, ListView, x12 y29 w180 h120 vLog, �̸�|����|�ð�
Gui, Tab, �α�
Gui, Add, Button, x282 y89 w110 h20 g����, �α� ��ü ����
Gui, Tab, �α�
Gui, Add, Button, x282 y119 w110 h20 g����, ���� �α� ����
; Generated using SmartGUI Creator for SciTE
Gui, Show, w408 h166, ������Beta

return

GuiClose:
ExitApp

escape := false

ũ����:
MsgBox, 0, ��¥ ������ ũ����, Made by. IYO
return

����:
gui,submit,nohide
LV_Delete()
return

����:
MsgBox, 4, ����, ���� �α׸� ���� �Ͻðڽ��ϱ�?
ifmsgbox, yes
{
	IfExist, %A_ScriptDir%\log.txt
	{
		MsgBox, 4, ����, �αװ� �̹� �����մϴ�. �����ϰ� �����ص� �����ƿ�..?
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

if inside <>   ;������ ������츸 ����
{
	CB = %CB%%inside%   %inside2%��   %inside3%`n
}

if RowNumber = 100 ;�ִ� 100�������� ����
break
}


FileAppend, %CB%, %A_ScriptDir%\log.txt
	/*
	LV_GetText(listlog, "%logcount%")
	FileAppend, %Log%, %A_ScriptDir%log.txt
	*/
	MsgBox, 0, �����...?!, ����Ϸ�!
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
	;F4��ȣ�ۿ�
	MouseClick, left, 499, 117, 1, 0
	sleep, 5500
	
	;��� Ȯ��
	Imagesearch, vx, vy, 1, 1, A_ScreenWidth, A_ScreenHeight, *40 images\NoGold.png
	If (Errorlevel = 0)
	{
		MsgBox, 0, ������, ��尡 �����մϴ� ��������
		gui,submit,nohide
		LV_Add("","NoGold","Unknown",hm)
		break
		return
	}
	;������ ���� �˻�
	Imagesearch, vx, vy, 1, 1, A_ScreenWidth, A_ScreenHeight, *40 images\mk.png
	If (Errorlevel = 0)
	{
		item := "���� ť�� ����"
		goto, much
	}
	If (Errorlevel = 1)
	{
		Imagesearch, vx, vy, 1, 1, A_ScreenWidth, A_ScreenHeight, *40 images\pm.png
		If (Errorlevel = 0)
		{
			item := "�ĸ��� ����"
			goto, much
		}
		If (Errorlevel = 1)
		{
			Imagesearch, vx, vy, 1, 1, A_ScreenWidth, A_ScreenHeight, *40 images\fire.png
			If (Errorlevel = 0)
			{
				gui,submit,nohide
				LV_Add("",���̾� ���� �������,1,hm)
				goto, break
			}
			If (Errorlevel = 1)
			{
				Imagesearch, vx, vy, 1, 1, A_ScreenWidth, A_ScreenHeight, *40 images\hat.png
				If (Errorlevel = 0)
				{
					gui,submit,nohide
					LV_Add("",�׾Ƹ� ����,1,hm)
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
	;���� �˻�
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
	FormatTime, hm, ,MM��dd�� tt hh��mm��ss��
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