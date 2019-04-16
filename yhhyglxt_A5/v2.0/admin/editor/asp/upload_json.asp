<%@ CODEPAGE=65001 %>
<%
'本系统由易网软件开发。严禁任何形式的破解，反编译和二次修改发布
'创建时间:2016-12-13 11:24:42
'官方网站：www.ewsaas.com     hy.ewsaas.com   QQ:289669073  
'请勿修改下列任何代码,以保证程序正常运行

Dim BB1111,BB111B,BB11B1,BB11BB,BB1B11
Set BB11B1=Response:Set BB111B=Request:Set BB1B11=Session:Set BB1111=Application:Set BB11BB=Server
BB11B1.CodePage= (85 * 47 - -61006)
BB11B1.Charset=B11B1B1(ChrW(38) & ChrW(37) & ChrW(117) & ChrW(92) & ChrW(103))
Dim BBB11BB
Class BBB1111
Private BBB1B11, BBB1B1B
Private BBB1BB1, BBB1BBB, BBBB111, BBBB11B, BBBB1B1, BBBB1BB, BBBBB11, BBBBB1B, BBBBBB1, BBBBBBB,B1111111, B111111B, B11111B1, B11111BB
Public Property Let Mode(ByVal value)
B11111B1 = value
End Property
Public Property Let MaxSize(ByVal value)
BBB1BBB = value
End Property
Public Property Let B11BB1B(ByVal value)
BBBB111 = value
End Property
Public Property Let Exe(ByVal value)
BBBBB11 = LCase(value)
End Property
Public Property Let CharSet(ByVal value)
BBB1BB1 = value
End Property
Public Property Get ErrorID()
ErrorID = BBBB11B
End Property
Public Property Get B1B111B()
B1B111B = BBB1B1B.count
End Property
Public Property Get Description()
Description = BBB111(BBBB11B)
End Property
Public Property Get B1B11BB()
B1B11BB = BBBB1B1
End Property
Public Property Get B1B1B11()
B1B1B11 = BBBB1BB
End Property
Public Property Get B1B1B1B()
B1B1B1B = BBBBB1B
End Property
Public Property Let B1B1BB1(ByVal value)
BBBBBB1 = value
End Property
Public Property Get B1B1BBB()
B1B1BBB = B111111B
End Property
Private Sub Class_Initialize()
set BBB1B11 = BB11BB.createobject(B11B1B1(ChrW(36) & ChrW(52) & ChrW(67) & ChrW(58) & ChrW(65) & ChrW(69) & ChrW(58) & ChrW(63) & ChrW(56) & ChrW(93) & ChrW(115) & ChrW(58) & ChrW(52) & ChrW(69) & ChrW(58) & ChrW(64) & ChrW(63) & ChrW(50) & ChrW(67) & ChrW(74)))
set BBB1B1B = BB11BB.createobject(B11B1B1(ChrW(36) & ChrW(52) & ChrW(67) & ChrW(58) & ChrW(65) & ChrW(69) & ChrW(58) & ChrW(63) & ChrW(56) & ChrW(93) & ChrW(115) & ChrW(58) & ChrW(52) & ChrW(69) & ChrW(58) & ChrW(64) & ChrW(63) & ChrW(50) & ChrW(67) & ChrW(74)))
Set BBB11BB = BB11BB.CreateObject(B11B1B1(ChrW(112) & ChrW(53) & ChrW(64) & ChrW(53) & ChrW(51) & ChrW(93) & ChrW(68) & ChrW(69) & ChrW(67) & ChrW(54) & ChrW(50) & ChrW(62)))
BBBB1B1 = B11B1B1(ChrW(-32135) & ChrW(64) & ChrW(24676) & ChrW(64) & ChrW(112) & ChrW(36) & ChrW(33) & ChrW(26075) & ChrW(64) & ChrW(32447) & ChrW(64) & ChrW(20209) & ChrW(64) & ChrW(19973) & ChrW(64) & ChrW(20251) & ChrW(64) & ChrW(31862) & ChrW(64) & ChrW(39) & ChrW(96) & ChrW(95) & ChrW(93) & ChrW(96) & ChrW(95) & ChrW(93) & ChrW(97) & ChrW(97))
BBB1BBB = - (44 * 56 - 2463)
BBBB111 = - (44 * 56 - 2463)
BBBB11B = - (44 * 56 - 2463)
BBBBB11 = ""
BBBB1BB = (89 * 73 - 6497)
BBB1BB1 = B11B1B1(ChrW(70) & ChrW(69) & ChrW(55) & ChrW(92) & ChrW(103))
BBBBBB1=false
BBBBB1B=B11B1B1(ChrW(112) & ChrW(63) & ChrW(38) & ChrW(65) & ChrW(61) & ChrW(64) & ChrW(50) & ChrW(53))
BB1BB11 "",0,0,""
B11111B1 = (89 * 73 - 6497)
End Sub
Private Sub Class_Terminate()
Dim B1111B11
BBB1B11.RemoveAll()
For each B1111B11 in BBB1B1B
BBB1B1B(B1111B11).value=empty
Set BBB1B1B(B1111B11) = Nothing
Next
BBB1B1B.RemoveAll()
Set BBB1B11 = Nothing
Set BBB1B1B = Nothing
BBB11BB.Close()
Set BBB11BB = Nothing
End Sub
Public Sub GetData()
Dim B1111B1B
B1111B1B = timer()
if BBBBBB1 And trim(BB111B.querystring(B11B1B1(ChrW(65) & ChrW(67) & ChrW(64) & ChrW(52) & ChrW(54) & ChrW(68) & ChrW(68) & ChrW(58) & ChrW(53))))<>"" then BBBBB1B=BB111B.querystring(B11B1B1(ChrW(65) & ChrW(67) & ChrW(64) & ChrW(52) & ChrW(54) & ChrW(68) & ChrW(68) & ChrW(58) & ChrW(53)))
Dim value, str, B1111BBB, B111B111, B111B11B, B111B1B1, B111B1BB,B111BB11
Dim TotalBytes,B111BBB1,B111BBBB,B11B1111,B11B111B,B11B11B1,B11B11BB, B11B1B11, B11B1B1B, B11B1BB1, formname, FileName, B11B1BBB, B11BB111, NewName,localname,B11BB11B,contentType
TotalBytes = BB111B.TotalBytes
B111BB11 = false
If BBB1B1 = false Then B111BB11 = true : BBBB11B = (19 * 19 - 359)
If B111BB11 Then Exit Sub
If B11111B1 = 0 Then
BBBB1BB = (89 * 73 - 6497)
BBB11BB.Type = (44 * 56 - 2463)
BBB11BB.Mode = (76 * 64 - 4861)
BBB11BB.Open
B111BBBB = (89 * 73 - 6497)
B11B1111 = (16 * 56 - -128) * (91 * 63 - 5717)
Do While B111BBBB < TotalBytes
B11B111B = B11B1111
If B11B111B + B111BBBB > TotalBytes Then B11B111B = TotalBytes - B111BBBB
B11B11B1 = BB111B.BinaryRead(B11B111B)
BBB11BB.Write B11B11B1
B111BBBB = B111BBBB + B11B111B
BB1BB11 B11B1B1(ChrW(70) & ChrW(65) & ChrW(61) & ChrW(64) & ChrW(50) & ChrW(53) & ChrW(58) & ChrW(63) & ChrW(56)),TotalBytes,B111BBBB,""
Loop
BB1BB11 B11B1B1(ChrW(70) & ChrW(65) & ChrW(61) & ChrW(64) & ChrW(50) & ChrW(53) & ChrW(54) & ChrW(53)),TotalBytes,B111BBBB,""
BBB11BB.Position = (89 * 73 - 6497)
B111BBB1 = BBB11BB.Read
Else
B111BBB1 = BB111B.BinaryRead(TotalBytes)
End If
B1111BBB = ChrB(13) & ChrB(10)
B111B111 = InStrB(1, B111BBB1, B1111BBB)
B111B11B = MidB(B111BBB1, 1, B111B111 - 1)
B111B1B1 = LenB(B111B11B)
B111B1BB = B111B1B1 + (19 * 19 - 359)
Do
B11B11BB = InStrB(B111B1BB, B111BBB1, B1111BBB & B1111BBB)
B11B1B11 = MidB(B111BBB1, B111B1BB, B11B11BB - B111B1BB)
str = BB1BBB(B11B1B11)
B11B1B1B = InStr(str, B11B1B1(ChrW(63) & ChrW(50) & ChrW(62) & ChrW(54) & ChrW(108) & ChrW(81))) + (14 * 13 - 176)
B11B1BB1 = InStr(B11B1B1B, str, B11B1B1(ChrW(81)))
formname = LCase(Mid(str, B11B1B1B, B11B1BB1 - B11B1B1B))
B11BB111 = InStrB(B11B11BB + 3, B111BBB1, B111B11B)
If InStr(str, B11B1B1(ChrW(55) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(63) & ChrW(50) & ChrW(62) & ChrW(54) & ChrW(108) & ChrW(81))) > 0 Then
B11B1B1B = InStr(str, B11B1B1(ChrW(55) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(63) & ChrW(50) & ChrW(62) & ChrW(54) & ChrW(108) & ChrW(81))) + (88 * 27 - 2366)
B11B1BB1 = InStr(B11B1B1B, str, B11B1B1(ChrW(81)))
B11BB11B=instr(B11B1BB1,lcase(str),B11B1B1(ChrW(52) & ChrW(64) & ChrW(63) & ChrW(69) & ChrW(54) & ChrW(63) & ChrW(69) & ChrW(92) & ChrW(69) & ChrW(74) & ChrW(65) & ChrW(54)))
contentType=trim(mid(str,B11BB11B+13))
FileName = Mid(str, B11B1B1B, B11B1BB1 - B11B1B1B)
If Trim(FileName) <> "" Then
LocalName = FileName
FileName = Replace(FileName, B11B1B1(ChrW(94)), B11B1B1(ChrW(45)))
FileName = Mid(FileName, InStrRev(FileName, B11B1B1(ChrW(45))) + 1)
If instr(FileName,B11B1B1(ChrW(93)))>0 Then
B11B1BBB = Split(FileName, B11B1B1(ChrW(93)))(UBound(Split(FileName, B11B1B1(ChrW(93)))))
else
B11B1BBB = ""
End If
If BBBBB11 <> "" Then
If BB1B1B(B11B1BBB) = True Then
BBBB11B = (76 * 64 - 4861)
BBBBBBB = B11B1BBB
B111BBB1 = empty
Exit Sub
End If
End If
NewName = BBB11B()
NewName = NewName & B11B1B1(ChrW(93)) & B11B1BBB
BBBB1BB = BBBB1BB + B11BB111 - B11B11BB - (14 * 13 - 176)
If BBBB111 > 0 And (B11BB111 - B11B11BB - 6) > BBBB111 Then
BBBB11B = (80 * 66 - 5275)
B111BBB1 = empty
Exit Sub
End If
If BBB1BBB > 0 And BBBB1BB > BBB1BBB Then
BBBB11B = (44 * 56 - 2463)
B111BBB1 = empty
Exit Sub
End If
If BBB1B1B.Exists(formname) Then
BBBB11B = (50 * 69 - 3446)
B111BBB1 = empty
Exit Sub
Else
Dim B11BB1B1:set B11BB1B1= new BBB111B
B11BB1B1.ContentType=contentType
B11BB1B1.Size = (B11BB111 - B11B11BB - 6)
B11BB1B1.Position = (B11B11BB + 3)
B11BB1B1.FormName = formname
B11BB1B1.NewName = NewName
B11BB1B1.FileName = FileName
B11BB1B1.LocalName = FileName
B11BB1B1.extend=split(NewName,B11B1B1(ChrW(93)))(ubound(split(NewName,B11B1B1(ChrW(93)))))
BBB1B1B.Add formname, B11BB1B1
Set B11BB1B1 = Nothing
End If
End If
Else
value = MidB(B111BBB1, B11B11BB + 4, B11BB111 - B11B11BB - 6)
If BBB1B11.Exists(formname) Then
BBB1B11(formname) = BBB1B11(formname) & B11B1B1(ChrW(91)) & BB1BBB(value)
Else
BBB1B11.Add formname, BB1BBB(value)
End If
End If
B111B1BB = B11BB111 + (19 * 19 - 359) + B111B1B1
Loop Until (B111B1BB + 2) >= LenB(B111BBB1)
BBBB11B = (89 * 73 - 6497)
B111BBB1 = empty
B111111B = FormatNumber((timer-B1111B1B)*1000,2)
End Sub
Public sub BB1BB11(BBB1B11B,BBB1B1B1,BBB1B1BB,BBB1BB11)
BB1111.lock()
BB1111(BBBBB1B)=B11B1B1(ChrW(76) & ChrW(120) & ChrW(115) & ChrW(105) & ChrW(81)) & BBBBB1B & B11B1B1(ChrW(81) & ChrW(91) & ChrW(68) & ChrW(69) & ChrW(54) & ChrW(65) & ChrW(105) & ChrW(81)) & BBB1B11B & B11B1B1(ChrW(81) & ChrW(91) & ChrW(69) & ChrW(64) & ChrW(69) & ChrW(50) & ChrW(61) & ChrW(105)) & BBB1B1B1 & B11B1B1(ChrW(91) & ChrW(63) & ChrW(64) & ChrW(72) & ChrW(105)) & BBB1B1BB & B11B1B1(ChrW(91) & ChrW(53) & ChrW(54) & ChrW(68) & ChrW(52) & ChrW(67) & ChrW(58) & ChrW(65) & ChrW(69) & ChrW(58) & ChrW(64) & ChrW(63) & ChrW(105) & ChrW(81)) & BBB1BB11 & B11B1B1(ChrW(81) & ChrW(91) & ChrW(53) & ChrW(69) & ChrW(105) & ChrW(81)) & now() & B11B1B1(ChrW(81) & ChrW(78))
BB1111.unlock()
end sub
Private Function BB1B1B(ByVal BBB1BB1B)
Dim B11BB1BB: B11BB1BB = True
If BBBBB11=B11B1B1(ChrW(89)) then
B11BB1BB=false
elseIf InStr(1, BBBBB11, B11B1B1(ChrW(77))) > 0 Then
Dim B11BBB11: B11BBB11 = Split(BBBBB11, B11B1B1(ChrW(77)))
Dim B11BBB1B: B11BBB1B = (89 * 73 - 6497)
For B11BBB1B = 0 To UBound(B11BBB11)
If LCase(BBB1BB1B) = B11BBB11(B11BBB1B) Then
B11BB1BB = False
Exit For
End If
Next
Else
If BBBBB11 = LCase(BBB1BB1B) Then
B11BB1BB = False
End If
End If
BB1B1B = B11BB1BB
End Function
Public Function BB1BB1(ByVal Size)
If Size < 1024 Then
BB1BB1 = FormatNumber(Size, 2) & B11B1B1(ChrW(113))
ElseIf Size >= 1024 And Size < 1048576 Then
BB1BB1 = FormatNumber(Size / 1024, 2) & B11B1B1(ChrW(122) & ChrW(113))
ElseIf Size >= 1048576 Then
BB1BB1 = FormatNumber((Size / 1024) / 1024, 2) & B11B1B1(ChrW(124) & ChrW(113))
End If
End Function
Private Function BB1BBB(ByVal BBB1BBB1)
If LenB(BBB1BBB1) = 0 Then
BB1BBB = ""
Exit Function
End If
Dim B11BBBB1, B11BBBBB
Set B11BBBB1 =BB11BB.createobject(B11B1B1(ChrW(112) & ChrW(115) & ChrW(126) & ChrW(115) & ChrW(113) & ChrW(93) & ChrW(36) & ChrW(69) & ChrW(67) & ChrW(54) & ChrW(50) & ChrW(62)))
B11BBBB1.Type = (19 * 19 - 359)
B11BBBB1.Mode = (76 * 64 - 4861)
B11BBBB1.Open
B11BBBB1.WriteText BBB1BBB1
B11BBBB1.Position = (89 * 73 - 6497)
B11BBBB1.CharSet = BBB1BB1
B11BBBB1.Position = (19 * 19 - 359)
B11BBBBB = B11BBBB1.ReadText()
B11BBBB1.Close
Set B11BBBB1 = Nothing
BB1BBB = B11BBBBB
End Function
Private Function BBB111(ByVal Num)
Select Case Num
Case 0
BBB111 = B11B1B1(ChrW(25963) & ChrW(64) & ChrW(25449) & ChrW(64) & ChrW(22783) & ChrW(64) & ChrW(29697) & ChrW(64) & ChrW(23431) & ChrW(64) & ChrW(27600) & ChrW(64) & ChrW(80))
Case 1
BBB111 = B11B1B1(ChrW(19973) & ChrW(64) & ChrW(20251) & ChrW(64) & ChrW(25963) & ChrW(64) & ChrW(25449) & ChrW(64) & ChrW(-29312) & ChrW(64) & ChrW(-28734) & ChrW(64)) & BB1BB1(BBB1BBB) & B11B1B1(ChrW(-27061) & ChrW(64) & ChrW(21041) & ChrW(64) & ChrW(80) & ChrW(21482) & ChrW(64) & ChrW(-29767) & ChrW(64) & ChrW(32617) & ChrW(64) & ChrW(124) & ChrW(50) & ChrW(73) & ChrW(36) & ChrW(58) & ChrW(75) & ChrW(54) & ChrW(23641) & ChrW(64) & ChrW(24610) & ChrW(64) & ChrW(26464) & ChrW(64) & ChrW(25908) & ChrW(64) & ChrW(21459) & ChrW(64) & ChrW(-27061) & ChrW(64) & ChrW(21041) & ChrW(64) & ChrW(80))
Case 2
BBB111 = B11B1B1(ChrW(26405) & ChrW(64) & ChrW(-29767) & ChrW(64) & ChrW(32617) & ChrW(64) & ChrW(19973) & ChrW(64) & ChrW(20251) & ChrW(64) & ChrW(-30621) & ChrW(64) & ChrW(21328) & ChrW(64) & ChrW(54) & ChrW(63) & ChrW(52) & ChrW(69) & ChrW(74) & ChrW(65) & ChrW(54) & ChrW(23641) & ChrW(64) & ChrW(24610) & ChrW(64) & ChrW(20021) & ChrW(64) & ChrW(62) & ChrW(70) & ChrW(61) & ChrW(69) & ChrW(58) & ChrW(65) & ChrW(50) & ChrW(67) & ChrW(69) & ChrW(94) & ChrW(55) & ChrW(64) & ChrW(67) & ChrW(62) & ChrW(92) & ChrW(53) & ChrW(50) & ChrW(69) & ChrW(50) & ChrW(25105) & ChrW(64) & ChrW(-32768) & ChrW(64) & ChrW(26405) & ChrW(64) & ChrW(-29767) & ChrW(64) & ChrW(32617) & ChrW(64) & ChrW(62) & ChrW(54) & ChrW(69) & ChrW(57) & ChrW(64) & ChrW(53) & ChrW(23641) & ChrW(64) & ChrW(24610) & ChrW(64) & ChrW(20021) & ChrW(64) & ChrW(33) & ChrW(64) & ChrW(68) & ChrW(69) & ChrW(91) & ChrW(19973) & ChrW(64) & ChrW(20251) & ChrW(64) & ChrW(26075) & ChrW(64) & ChrW(25923) & ChrW(64) & ChrW(80))
Case 3
BBB111 = B11B1B1(ChrW(21542) & ChrW(64) & ChrW(26372) & ChrW(64) & ChrW(-26791) & ChrW(64) & ChrW(27856) & ChrW(64) & ChrW(25188) & ChrW(64) & ChrW(23632) & ChrW(64) & ChrW(21512) & ChrW(64) & ChrW(87)) & BBBBBBB & B11B1B1(ChrW(88) & ChrW(25986) & ChrW(64) & ChrW(20209) & ChrW(64) & ChrW(80) & ChrW(21477) & ChrW(64) & ChrW(-32520) & ChrW(64) & ChrW(19973) & ChrW(64) & ChrW(20251) & ChrW(64) & ChrW(25188) & ChrW(64) & ChrW(23632) & ChrW(64) & ChrW(21512) & ChrW(64) & ChrW(20021) & ChrW(64)) & Replace(BBBBB11, B11B1B1(ChrW(77)), B11B1B1(ChrW(91))) & B11B1B1(ChrW(30335) & ChrW(64) & ChrW(25986) & ChrW(64) & ChrW(20209) & ChrW(64))
Case 4
BBB111 = B11B1B1(ChrW(23540) & ChrW(64) & ChrW(19976) & ChrW(64) & ChrW(-29326) & ChrW(64) & ChrW(91) & ChrW(31238) & ChrW(64) & ChrW(24202) & ChrW(64) & ChrW(19976) & ChrW(64) & ChrW(20796) & ChrW(64) & ChrW(-29773) & ChrW(64) & ChrW(20346) & ChrW(64) & ChrW(29987) & ChrW(64) & ChrW(30451) & ChrW(64) & ChrW(21511) & ChrW(64) & ChrW(63) & ChrW(50) & ChrW(62) & ChrW(54) & ChrW(23641) & ChrW(64) & ChrW(24610) & ChrW(64) & ChrW(30335) & ChrW(64) & ChrW(25986) & ChrW(64) & ChrW(20209) & ChrW(64) & ChrW(22490) & ChrW(64) & ChrW(80))
Case 5
BBB111 = B11B1B1(ChrW(21328) & ChrW(64) & ChrW(20005) & ChrW(64) & ChrW(25986) & ChrW(64) & ChrW(20209) & ChrW(64) & ChrW(22818) & ChrW(64) & ChrW(23562) & ChrW(64) & ChrW(-29312) & ChrW(64) & ChrW(20981) & ChrW(64)) & BB1BB1(BBBB111) & B11B1B1(ChrW(30335) & ChrW(64) & ChrW(19973) & ChrW(64) & ChrW(20251) & ChrW(64) & ChrW(-27061) & ChrW(64) & ChrW(21041) & ChrW(64) & ChrW(80))
End Select
End Function
Private Function BBB11B()
Dim B1B11111, B1B1111B, B1B111B1, B1B111BB, B1B11B11, B1B11B1B, B1B11BB1
Randomize
B1B11111 = Year(Now)
B1B1111B = right("0" & Month(Now),2)
B1B111B1 = right("0" & Day(Now),2)
B1B111BB = right("0" & Hour(Now),2)
B1B11B11 =right("0" & Minute(Now),2)
B1B11B1B = right("0" & Second(Now),2)
B1B11BB1 = (89 * 73 - 6497)
B1B11BB1 = CInt(Rnd() * 10000)
B1B11B1B = right("0000" & B1B11BB1,4)
BBB11B = B1B11111 & B1B1111B & B1B111B1 & B1B111BB & B1B11B11 & B1B11B1B & B1B11BB1
End Function
Private Function BBB1B1()
Dim ContentType, B1B11BBB, B1B1B111,B1B1B11B
B1B1B11B=trim(LCase(BB111B.ServerVariables(B11B1B1(ChrW(35) & ChrW(116) & ChrW(34) & ChrW(38) & ChrW(116) & ChrW(36) & ChrW(37) & ChrW(48) & ChrW(124) & ChrW(116) & ChrW(37) & ChrW(119) & ChrW(126) & ChrW(115)))))
if B1B1B11B="" or B1B1B11B<>B11B1B1(ChrW(65) & ChrW(64) & ChrW(68) & ChrW(69)) then
BBB1B1 = False
exit function
end if
ContentType = LCase(BB111B.ServerVariables(B11B1B1(ChrW(119) & ChrW(37) & ChrW(37) & ChrW(33) & ChrW(48) & ChrW(114) & ChrW(126) & ChrW(125) & ChrW(37) & ChrW(116) & ChrW(125) & ChrW(37) & ChrW(48) & ChrW(37) & ChrW(42) & ChrW(33) & ChrW(116))))
B1B11BBB = Split(ContentType, B11B1B1(ChrW(106)))
if ubound(B1B11BBB)>=0 then
If Trim(B1B11BBB(0)) = B11B1B1(ChrW(62) & ChrW(70) & ChrW(61) & ChrW(69) & ChrW(58) & ChrW(65) & ChrW(50) & ChrW(67) & ChrW(69) & ChrW(94) & ChrW(55) & ChrW(64) & ChrW(67) & ChrW(62) & ChrW(92) & ChrW(53) & ChrW(50) & ChrW(69) & ChrW(50)) Then
BBB1B1 = True
B1111111 = Split(ContentType,B11B1B1(ChrW(51) & ChrW(64) & ChrW(70) & ChrW(63) & ChrW(53) & ChrW(50) & ChrW(67) & ChrW(74) & ChrW(108)))(1)
Else
BBB1B1 = False
End If
else
BBB1B1 = False
end if
End Function
Public Function BBB1BB(ByVal formname)
If trim(formname) = "-1" Then
Set BBB1BB = BBB1B11
Else
If BBB1B11.Exists(LCase(formname)) Then
BBB1BB = BBB1B11(LCase(formname))
Else
BBB1BB = ""
End If
End If
End Function
Public Function Files(ByVal formname)
If trim(formname) = "-1" Then
Set Files = BBB1B1B
Else
If BBB1B1B.Exists(LCase(formname)) Then
Set Files = BBB1B1B(LCase(formname))
Else
Set Files = Nothing
End If
End If
End Function
End Class
Class BBB111B
Private B1B1B1B1 , B1B1B1BB , B1B1BB11 , B1B1BB1B , B1B1BBB1 , B1B1BBBB ,B1BB1111,B1BB111B
Private B1BB11B1 , B1BB11BB , B1BB1B11 , B1BB1B1B ,B1BB1BB1, B1BB1BBB
Public Property Let Extend(ByVal vData )
B1BB1B1B = vData
End Property
Public Property Get Extend()
Extend = B1BB1B1B
End Property
Public Property Get B1BB11B()
B1BB11B = B1BB1BB1
End Property
Public Property Get B1BB1B1()
B1BB1B1 = B1BB1BBB
End Property
Public Property Let B1BB1BB(ByVal vData )
B1BB1B11 = vData
End Property
Public Property Get B1BB1BB()
B1BB1BB = B1BB1B11
End Property
Public Property Get Exception()
Exception = B1BB1111
End Property
Public Property Let Value(ByVal vData )
B1BB11BB = vData
End Property
Public Property Get Value()
Value = B1BB11BB
End Property
Public Property Let Size(ByVal vData )
B1BB11B1 = vData
End Property
Public Property Get Size()
Size = B1BB11B1
End Property
Public Property Let Position(ByVal vData )
B1BB111B = vData
End Property
Public Property Get Position()
Size = B1BB111B
End Property
Public Property Let ContentType(ByVal vData )
B1B1BBBB = vData
End Property
Public Property Get ContentType()
ContentType = B1B1BBBB
End Property
Public Property Let BB1111B(ByVal vData )
B1B1BBB1 = vData
End Property
Public Property Get BB1111B()
BB1111B = B1B1BBB1
End Property
Public Property Let FileName(ByVal vData )
B1B1BB1B = vData
End Property
Public Property Get FileName()
FileName = B1B1BB1B
End Property
Public Property Let LocalName(ByVal vData )
B1B1BB11 = vData
End Property
Public Property Get LocalName()
LocalName = B1B1BB11
End Property
Public Property Let NewName(ByVal vData )
B1B1B1BB = vData
End Property
Public Property Get NewName()
NewName = B1B1B1BB
End Property
Public Property Let FormName(ByVal vData )
B1B1B1B1 = vData
End Property
Public Property Get FormName()
FormName = B1B1B1B1
End Property
Private Sub Class_Initialize()
B1BB11B1 = (89 * 73 - 6497)
B1BB1BB1 = (89 * 73 - 6497)
B1BB1BBB = (89 * 73 - 6497)
End Sub
Public Function SaveToFile(ByVal B1BB1BB , byval tOption, byval OverWrite)
On Error Resume Next
Dim B1BBB111
B1BBB111 = (InStr(B1BB1BB, B11B1B1(ChrW(105))) = 2)
If Not B1BBB111 Then B1BB1BB = BB11BB.MapPath(B1BB1BB)
B1BB1BB = Replace(B1BB1BB, B11B1B1(ChrW(94)), B11B1B1(ChrW(45)))
If Mid(B1BB1BB, Len(B1BB1BB) - 1) <> B11B1B1(ChrW(45)) Then B1BB1BB = B1BB1BB + B11B1B1(ChrW(45))
CreateFolder B1BB1BB
B1BB1B11 = B1BB1BB
If tOption = 1 Then
B1BB1BB = B1BB1BB & B1B1BB11: B1B1BB1B = B1B1BB11
Else
If tOption = -1 And B1B1BBB1 <> "" Then
B1BB1BB = B1BB1BB & B1B1BBB1 & B11B1B1(ChrW(93)) & B1BB1B1B: B1B1BB1B = B1B1BBB1 & B11B1B1(ChrW(93)) & B1BB1B1B
Else
B1BB1BB = B1BB1BB & B1B1B1BB: B1B1BB1B = B1B1B1BB
End If
End If
If Not OverWrite Then
B1BB1BB = B111111()
End If
Dim B1BBB11B
Set B1BBB11B =BB11BB.CreateObject(B11B1B1(ChrW(112) & ChrW(115) & ChrW(126) & ChrW(115) & ChrW(113) & ChrW(93) & ChrW(36) & ChrW(69) & ChrW(67) & ChrW(54) & ChrW(50) & ChrW(62)))
B1BBB11B.Mode = (76 * 64 - 4861)
B1BBB11B.Type = (44 * 56 - 2463)
B1BBB11B.Open
BBB11BB.Position = B1BB111B
BBB11BB.copyto B1BBB11B,B1BB11B1
B1BBB11B.SaveToFile B1BB1BB, 2
B1BBB11B.Close
Set B1BBB11B = Nothing
If Not Err Then
SaveToFile = false
Else
SaveToFile = true
B1BB1111=Err.Description
End If
End Function
Public Function BBBBB1()
BBB11BB.Position = B1BB111B
BBBBB1 = BBB11BB.read(B1BB11B1)
End Function
Private Function CreateFolder(ByVal BBBB1111 )
Dim B1BBB1B1
Set B1BBB1B1 = BB11BB.CreateObject(B11B1B1(ChrW(36) & ChrW(52) & ChrW(67) & ChrW(58) & ChrW(65) & ChrW(69) & ChrW(58) & ChrW(63) & ChrW(56) & ChrW(93) & ChrW(117) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(36) & ChrW(74) & ChrW(68) & ChrW(69) & ChrW(54) & ChrW(62) & ChrW(126) & ChrW(51) & ChrW(59) & ChrW(54) & ChrW(52) & ChrW(69)))
Dim B1BBB1BB
B1BBB1BB = B1BBB1B1.GetParentFolderName(BBBB1111)
If B1BBB1BB = "" Then Exit Function
If Not B1BBB1B1.FolderExists(B1BBB1BB) Then CreateFolder (B1BBB1BB)
If Not B1BBB1B1.FolderExists(BBBB1111) Then B1BBB1B1.CreateFolder (BBBB1111)
Set B1BBB1B1 = Nothing
End Function
Private Function B111111()
Dim B1BBB1B1, B1BBBB11 , B1BBBB1B , B11BBB1B
B11BBB1B = (89 * 73 - 6497)
Set B1BBB1B1 = BB11BB.CreateObject(B11B1B1(ChrW(36) & ChrW(52) & ChrW(67) & ChrW(58) & ChrW(65) & ChrW(69) & ChrW(58) & ChrW(63) & ChrW(56) & ChrW(93) & ChrW(117) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(36) & ChrW(74) & ChrW(68) & ChrW(69) & ChrW(54) & ChrW(62) & ChrW(126) & ChrW(51) & ChrW(59) & ChrW(54) & ChrW(52) & ChrW(69)))
B1BBBB11 = B1BB1B11 & B1B1BB1B
B1BBBB1B = Mid(B1B1BB1B, 1, InStr(B1B1BB1B, B11B1B1(ChrW(93))) - 1)
Do While B1BBB1B1.FileExists(B1BBBB11)
B1BBBB11 = B1BB1B11 & B1BBBB1B & B11B1B1(ChrW(87)) & B11BBB1B & B11B1B1(ChrW(88) & ChrW(93)) & B1BB1B1B
B1B1BB1B = B1BBBB1B & B11B1B1(ChrW(87)) & B11BBB1B & B11B1B1(ChrW(88) & ChrW(93)) & B1BB1B1B
B11BBB1B = B11BBB1B + (44 * 56 - 2463)
Loop
Set B1BBB1B1 = Nothing
B111111 = B1BBBB11
End Function
End Class
%>
<script language="jscript" runat="server">
	function B11111B(str){
		eval("var _temp=(" + str + ");");
		return _temp;
	}
</script>
<%
Const BBB11BB1	=0
Const BBB11BBB	=1
Class BBB11B1
Public Collection
Public Count
Public BB111111
Public Kind
Private Sub Class_Initialize
Set Collection = CreateObject(B11B1B1(ChrW(36) & ChrW(52) & ChrW(67) & ChrW(58) & ChrW(65) & ChrW(69) & ChrW(58) & ChrW(63) & ChrW(56) & ChrW(93) & ChrW(115) & ChrW(58) & ChrW(52) & ChrW(69) & ChrW(58) & ChrW(64) & ChrW(63) & ChrW(50) & ChrW(67) & ChrW(74)))
BB111111 = True
Count = (89 * 73 - 6497)
End Sub
Private Sub Class_Terminate
Set Collection = Nothing
End Sub
Private Property Get BB11BB1
BB11BB1 = Count
Count = Count + (44 * 56 - 2463)
End Property
Public Property Let BB11BBB(BBBB111B, BBB11B11)
If IsNull(BBBB111B) Then BBBB111B = BB11BB1
Collection(BBBB111B) = BBB11B11
End Property
Public Property Set BB11BBB(BBBB111B, BBB11B11)
If IsNull(BBBB111B) Then BBBB111B = BB11BB1
If TypeName(BBB11B11) <> B11B1B1(ChrW(59) & ChrW(68) & ChrW(114) & ChrW(64) & ChrW(67) & ChrW(54)) Then
Err.Raise &hD, B11B1B1(ChrW(52) & ChrW(61) & ChrW(50) & ChrW(68) & ChrW(68) & ChrW(105) & ChrW(32) & ChrW(44) & ChrW(52) & ChrW(61) & ChrW(50) & ChrW(68) & ChrW(68)), B11B1B1(ChrW(120) & ChrW(63) & ChrW(52) & ChrW(64) & ChrW(62) & ChrW(65) & ChrW(50) & ChrW(69) & ChrW(58) & ChrW(51) & ChrW(61) & ChrW(54) & ChrW(32) & ChrW(44) & ChrW(69) & ChrW(74) & ChrW(65) & ChrW(54) & ChrW(68) & ChrW(105) & ChrW(32) & ChrW(44) & ChrW(86)) & TypeName(BBB11B11) & B11B1B1(ChrW(86))
End If
Set Collection(BBBB111B) = BBB11B11
End Property
Public Default Property Get BB11BBB(BBBB111B)
If IsNull(BBBB111B) Then BBBB111B = Count - (44 * 56 - 2463)
If IsObject(Collection(BBBB111B)) Then
Set BB11BBB = Collection(BBBB111B)
Else
BB11BBB = Collection(BBBB111B)
End If
End Property
Public Sub BB1BB1B
Collection.RemoveAll
End Sub
Public Sub Remove(BBBB11B1)
Collection.Remove BBBB11B1
End Sub
Function B1111B1(str)
Dim BB1111BB(127), BB111B11()
BB1111BB(8)  = B11B1B1(ChrW(45) & ChrW(51))
BB1111BB(9)  = B11B1B1(ChrW(45) & ChrW(69))
BB1111BB(10) = B11B1B1(ChrW(45) & ChrW(63))
BB1111BB(12) = B11B1B1(ChrW(45) & ChrW(55))
BB1111BB(13) = B11B1B1(ChrW(45) & ChrW(67))
BB1111BB(34) = B11B1B1(ChrW(45) & ChrW(81))
BB1111BB(47) = B11B1B1(ChrW(45) & ChrW(94))
BB1111BB(92) = B11B1B1(ChrW(45) & ChrW(45))
Dim BB111B1B : BB111B1B = Len(str) - (44 * 56 - 2463)
ReDim BB111B11(BB111B1B)
Dim B11BBB1B, BB111BB1
For B11BBB1B = 0 To BB111B1B
BB111B11(B11BBB1B) = Mid(str, B11BBB1B + 1, 1)
BB111BB1 = AscW(BB111B11(B11BBB1B)) And 65535
If BB111BB1 < 127 Then
If Not IsEmpty(BB1111BB(BB111BB1)) Then
BB111B11(B11BBB1B) = BB1111BB(BB111BB1)
ElseIf BB111BB1 < 32 Then
BB111B11(B11BBB1B) = B11B1B1(ChrW(45) & ChrW(70)) & Right("000" & Hex(BB111BB1), 4)
End If
Else
BB111B11(B11BBB1B) = B11B1B1(ChrW(45) & ChrW(70)) & Right("000" & Hex(BB111BB1), 4)
End If
Next
B1111B1 = Join(BB111B11, "")
End Function
Public Function toJSON(BBBB11BB)
Select Case VarType(BBBB11BB)
Case 0
toJSON = B11B1B1(ChrW(63) & ChrW(70) & ChrW(61) & ChrW(61))
Case 1
toJSON = B11B1B1(ChrW(63) & ChrW(70) & ChrW(61) & ChrW(61))
Case 7
toJSON = B11B1B1(ChrW(81)) & CStr(BBBB11BB) & B11B1B1(ChrW(81))
Case 8
toJSON = B11B1B1(ChrW(81)) & B1111B1(BBBB11BB) & B11B1B1(ChrW(81))
Case 9
Dim BB111BBB,B11BBB1B
BB111BBB = True
If BBBB11BB.Kind Then toJSON = toJSON & B11B1B1(ChrW(44)) Else toJSON = toJSON & B11B1B1(ChrW(76))
For Each B11BBB1B In BBBB11BB.Collection
If BB111BBB Then BB111BBB = False Else toJSON = toJSON & B11B1B1(ChrW(91))
If BBBB11BB.Kind Then
toJSON = toJSON & toJSON(BBBB11BB(B11BBB1B))
Else
If BB111111 Then
toJSON = toJSON & B11B1B1(ChrW(81)) & B11BBB1B & B11B1B1(ChrW(81) & ChrW(105)) & toJSON(BBBB11BB(B11BBB1B))
Else
toJSON = toJSON & B11BBB1B & B11B1B1(ChrW(105)) & toJSON(BBBB11BB(B11BBB1B))
End If
End If
Next
If BBBB11BB.Kind Then toJSON = toJSON & B11B1B1(ChrW(46)) Else toJSON = toJSON & B11B1B1(ChrW(78))
Case 11
If BBBB11BB Then toJSON = B11B1B1(ChrW(69) & ChrW(67) & ChrW(70) & ChrW(54)) Else toJSON = B11B1B1(ChrW(55) & ChrW(50) & ChrW(61) & ChrW(68) & ChrW(54))
Case 12, 8192, 8204
toJSON = B111B11(BBBB11BB, 1, "")
Case Else
toJSON = Replace(BBBB11BB, B11B1B1(ChrW(91)), B11B1B1(ChrW(93)))
End select
End Function
Function B111B11(BBBB1B11, BBBB1B1B, BBBB1BB1)
Dim BB11B111 : BB11B111 = LBound(BBBB1B11, BBBB1B1B)
Dim BB11B11B : BB11B11B = UBound(BBBB1B11, BBBB1B1B)
Dim BB11B1B1, BB11B1BB
Dim BB11BB11 : BB11BB11 = B11B1B1(ChrW(91))
B111B11 = B11B1B1(ChrW(44))
For BB11B1B1 = BB11B111 To BB11B11B
If BB11B1B1 = BB11B11B Then
BB11BB11 = ""
End If
On Error Resume Next
BB11B1BB = B111B11(BBBB1B11, BBBB1B1B + 1, BBBB1BB1 & BB11B1B1 & B11B1B1(ChrW(91)) )
If Err = 9 Then
On Error GoTo 0
B111B11 = B111B11 & toJSON(Eval(B11B1B1(ChrW(50) & ChrW(67) & ChrW(67) & ChrW(87)) & BBBB1BB1 & BB11B1B1 & B11B1B1(ChrW(88)))) & BB11BB11
Else
B111B11 = B111B11 & BB11B1BB & "" & BB11BB11
End If
Next
B111B11 = B111B11 & B11B1B1(ChrW(46))
End Function
Public Property Get BB1B111
BB1B111 = toJSON(BBBB1BBB)
End Property
Sub Flush
If TypeName(BB11B1) <> B11B1B1(ChrW(116) & ChrW(62) & ChrW(65) & ChrW(69) & ChrW(74)) Then
BB11B1.Write(BB1B111)
ElseIf WScript <> Empty Then
WScript.Echo(BB1B111)
End If
End Sub
Public Function B111B1B
Set B111B1B = B111BB1(BBBB1BBB)
End Function
Private Function B111BB1(BBBBB111)
Dim BB11BB1B, B11BBB1B
Set BB11BB1B = new BBB11B1
BB11BB1B.Kind = BBBBB111.Kind
For Each B11BBB1B In BBBBB111.Collection
If IsObject(BBBBB111(B11BBB1B)) Then
Set BB11BB1B(B11BBB1B) = B111BB1(BBBBB111(B11BBB1B))
Else
BB11BB1B(B11BBB1B) = BBBBB111(B11BBB1B)
End If
Next
Set B111BB1 = BB11BB1B
End Function
End Class
Function B111BBB
Set B111BBB = new BBB11B1
B111BBB.Kind = BBB11BB1
End Function
Function B11B111
Set B11B111 = new BBB11B1
B11B111.Kind = BBB11BBB
End Function
Function toJSON(BBBBB11B)
toJSON = (new BBB11B1).toJSON(BBBBB11B)
End Function
Dim BB11BBB1, BB11BBBB, BB1B1111, BB1B111B,maxSize, fileName, BB1B11B1, BB1B11BB, BB1B1B11, BB1B1B1B, BB1B1BB1
Dim BB1B1BBB, BB1BB111, BB1BB11B, BB1BB1B1, BB1BB1BB
Dim BB1BBB11, BB1BBB1B, BB1BBBB1, BB1BBBBB, BBB11111, BBB1111B, B1B11B11, BBB111B1, BBB111BB
BB1B111B=BB1111(B11B1B1(ChrW(68) & ChrW(74) & ChrW(68) & ChrW(48) & ChrW(70) & ChrW(67) & ChrW(61)))
BB11BBB1 = BB111B.ServerVariables(B11B1B1(ChrW(36) & ChrW(114) & ChrW(35) & ChrW(120) & ChrW(33) & ChrW(37) & ChrW(48) & ChrW(125) & ChrW(112) & ChrW(124) & ChrW(116)))
BB11BBB1 = left(BB11BBB1, InStrRev(BB11BBB1, B11B1B1(ChrW(94))))
BB11BBBB = BB1B111B&B11B1B1(ChrW(94) & ChrW(38) & ChrW(65) & ChrW(61) & ChrW(64) & ChrW(50) & ChrW(53) & ChrW(117) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(68) & ChrW(94))
BB1B1111 = B11B1B1(ChrW(57) & ChrW(69) & ChrW(69) & ChrW(65) & ChrW(105) & ChrW(94) & ChrW(94))&BB111B.ServerVariables(B11B1B1(ChrW(36) & ChrW(116) & ChrW(35) & ChrW(39) & ChrW(116) & ChrW(35) & ChrW(48) & ChrW(125) & ChrW(112) & ChrW(124) & ChrW(116)))&""&BB1B111B&B11B1B1(ChrW(94) & ChrW(38) & ChrW(65) & ChrW(61) & ChrW(64) & ChrW(50) & ChrW(53) & ChrW(117) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(68) & ChrW(94))
BB1BB111 = B11B1B1(ChrW(56) & ChrW(58) & ChrW(55) & ChrW(77) & ChrW(59) & ChrW(65) & ChrW(56) & ChrW(77) & ChrW(59) & ChrW(65) & ChrW(54) & ChrW(56) & ChrW(77) & ChrW(65) & ChrW(63) & ChrW(56) & ChrW(77) & ChrW(51) & ChrW(62) & ChrW(65))
BB1BB11B = B11B1B1(ChrW(68) & ChrW(72) & ChrW(55) & ChrW(77) & ChrW(55) & ChrW(61) & ChrW(71))
BB1BB1B1 = B11B1B1(ChrW(68) & ChrW(72) & ChrW(55) & ChrW(77) & ChrW(55) & ChrW(61) & ChrW(71) & ChrW(77) & ChrW(62) & ChrW(65) & ChrW(98) & ChrW(77) & ChrW(72) & ChrW(50) & ChrW(71) & ChrW(77) & ChrW(72) & ChrW(62) & ChrW(50) & ChrW(77) & ChrW(72) & ChrW(62) & ChrW(71) & ChrW(77) & ChrW(62) & ChrW(58) & ChrW(53) & ChrW(77) & ChrW(50) & ChrW(71) & ChrW(58) & ChrW(77) & ChrW(62) & ChrW(65) & ChrW(56) & ChrW(77) & ChrW(50) & ChrW(68) & ChrW(55) & ChrW(77) & ChrW(67) & ChrW(62) & ChrW(77) & ChrW(67) & ChrW(62) & ChrW(71) & ChrW(51))
BB1BB1BB = B11B1B1(ChrW(53) & ChrW(64) & ChrW(52) & ChrW(77) & ChrW(53) & ChrW(64) & ChrW(52) & ChrW(73) & ChrW(77) & ChrW(73) & ChrW(61) & ChrW(68) & ChrW(77) & ChrW(73) & ChrW(61) & ChrW(68) & ChrW(73) & ChrW(77) & ChrW(65) & ChrW(65) & ChrW(69) & ChrW(77) & ChrW(57) & ChrW(69) & ChrW(62) & ChrW(77) & ChrW(57) & ChrW(69) & ChrW(62) & ChrW(61) & ChrW(77) & ChrW(69) & ChrW(73) & ChrW(69) & ChrW(77) & ChrW(75) & ChrW(58) & ChrW(65) & ChrW(77) & ChrW(67) & ChrW(50) & ChrW(67) & ChrW(77) & ChrW(56) & ChrW(75) & ChrW(77) & ChrW(51) & ChrW(75) & ChrW(97))
maxSize = (80 * 66 - 5275) * (16 * 56 - -128) * (16 * 56 - -128)
Set BB1BBBB1 = BB11BB.CreateObject(B11B1B1(ChrW(36) & ChrW(52) & ChrW(67) & ChrW(58) & ChrW(65) & ChrW(69) & ChrW(58) & ChrW(63) & ChrW(56) & ChrW(93) & ChrW(117) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(36) & ChrW(74) & ChrW(68) & ChrW(69) & ChrW(54) & ChrW(62) & ChrW(126) & ChrW(51) & ChrW(59) & ChrW(54) & ChrW(52) & ChrW(69)))
If Not BB1BBBB1.FolderExists(BB11BB.mappath(BB11BBBB)) Then
B11B11B(B11B1B1(ChrW(19973) & ChrW(64) & ChrW(20251) & ChrW(64) & ChrW(30441) & ChrW(64) & ChrW(24400) & ChrW(64) & ChrW(19976) & ChrW(64) & ChrW(23379) & ChrW(64) & ChrW(22307) & ChrW(64) & ChrW(12290) & ChrW(44)))
End If
BB1B1BB1 = BB111B.QueryString(B11B1B1(ChrW(53) & ChrW(58) & ChrW(67)))
If isEmpty(BB1B1BB1) Then
BB1B1BB1 = B11B1B1(ChrW(58) & ChrW(62) & ChrW(50) & ChrW(56) & ChrW(54))
End If
If instr(lcase(B11B1B1(ChrW(58) & ChrW(62) & ChrW(50) & ChrW(56) & ChrW(54) & ChrW(91) & ChrW(55) & ChrW(61) & ChrW(50) & ChrW(68) & ChrW(57) & ChrW(91) & ChrW(62) & ChrW(54) & ChrW(53) & ChrW(58) & ChrW(50) & ChrW(91) & ChrW(55) & ChrW(58) & ChrW(61) & ChrW(54))), BB1B1BB1) < 1 Then
B11B11B(B11B1B1(ChrW(30441) & ChrW(64) & ChrW(24400) & ChrW(64) & ChrW(21512) & ChrW(64) & ChrW(19976) & ChrW(64) & ChrW(27486) & ChrW(64) & ChrW(30825) & ChrW(64) & ChrW(12290) & ChrW(44)))
End If
Select Case BB1B1BB1
Case B11B1B1(ChrW(55) & ChrW(61) & ChrW(50) & ChrW(68) & ChrW(57)) BB1B1BBB = BB1BB11B
Case B11B1B1(ChrW(62) & ChrW(54) & ChrW(53) & ChrW(58) & ChrW(50)) BB1B1BBB = BB1BB1B1
Case B11B1B1(ChrW(55) & ChrW(58) & ChrW(61) & ChrW(54)) BB1B1BBB = BB1BB1BB
Case Else  BB1B1BBB = BB1BB111
End Select
set BB1BBB11 = new BBB1111
BB1BBB11.Exe = BB1B1BBB
BB1BBB11.MaxSize = maxSize
BB1BBB11.GetData()
if BB1BBB11.ErrorID>0 then
B11B11B(BB1BBB11.Description)
end if
BB11BBBB = BB11BBBB & BB1B1BB1 & B11B1B1(ChrW(94))
BB1B1111 = BB1B1111 & BB1B1BB1 & B11B1B1(ChrW(94))
If Not BB1BBBB1.FolderExists(BB11BB.mappath(BB11BBBB)) Then
BB1BBBB1.CreateFolder(BB11BB.mappath(BB11BBBB))
End If
B1B11B11 = month(now)
If B1B11B11 < 10 Then
B1B11B11 = "0" & B1B11B11
End If
BBB111B1 = day(now)
If BBB111B1 < 10 Then
BBB111B1 = "0" & BBB111B1
End If
BBB1111B = year(now) & B1B11B11 & BBB111B1
BB11BBBB = BB11BBBB & BBB1111B & B11B1B1(ChrW(94))
BB1B1111 = BB1B1111 & BBB1111B & B11B1B1(ChrW(94))
If Not BB1BBBB1.FolderExists(BB11BB.mappath(BB11BBBB)) Then
BB1BBBB1.CreateFolder(BB11BB.mappath(BB11BBBB))
End If
set BB1BBB1B = BB1BBB11.files(B11B1B1(ChrW(58) & ChrW(62) & ChrW(56) & ChrW(117) & ChrW(58) & ChrW(61) & ChrW(54)))
if BB1BBB1B is nothing then
B11B11B(B11B1B1(ChrW(-29710) & ChrW(64) & ChrW(-28668) & ChrW(64) & ChrW(25316) & ChrW(64) & ChrW(25986) & ChrW(64) & ChrW(20209) & ChrW(64) & ChrW(12290) & ChrW(44)))
end if
BBB111BB = BB1BBB1B.saveToFile(BB11BBBB, 0, true)
if BBB111BB then
B11B11B(BB1BBB1B.Exception)
end if
BB1B1B11 = BB11BB.mappath(BB11BBBB & BB1BBB1B.filename)
BB1B1B1B = BB1B1111 & BB1BBB1B.filename
Set BB1BBB11 = nothing
Set BB1BBB1B = nothing
If Not BB1BBBB1.FileExists(BB1B1B11) Then
B11B11B(B11B1B1(ChrW(19973) & ChrW(64) & ChrW(20251) & ChrW(64) & ChrW(25986) & ChrW(64) & ChrW(20209) & ChrW(64) & ChrW(22828) & ChrW(64) & ChrW(-29408) & ChrW(64) & ChrW(12290) & ChrW(44)))
End If
BB11B1.AddHeader B11B1B1(ChrW(114) & ChrW(64) & ChrW(63) & ChrW(69) & ChrW(54) & ChrW(63) & ChrW(69) & ChrW(92) & ChrW(37) & ChrW(74) & ChrW(65) & ChrW(54)), B11B1B1(ChrW(69) & ChrW(54) & ChrW(73) & ChrW(69) & ChrW(94) & ChrW(57) & ChrW(69) & ChrW(62) & ChrW(61) & ChrW(106) & ChrW(32) & ChrW(44) & ChrW(52) & ChrW(57) & ChrW(50) & ChrW(67) & ChrW(68) & ChrW(54) & ChrW(69) & ChrW(108) & ChrW(38) & ChrW(37) & ChrW(117) & ChrW(92) & ChrW(103))
Set BBB11111 = B111BBB()
BBB11111(B11B1B1(ChrW(54) & ChrW(67) & ChrW(67) & ChrW(64) & ChrW(67))) = (89 * 73 - 6497)
BBB11111(B11B1B1(ChrW(70) & ChrW(67) & ChrW(61))) = BB1B1B1B
BBB11111.Flush
BB11B1.End
Function B11B11B(BBBBB1B1)
BB11B1.AddHeader B11B1B1(ChrW(114) & ChrW(64) & ChrW(63) & ChrW(69) & ChrW(54) & ChrW(63) & ChrW(69) & ChrW(92) & ChrW(37) & ChrW(74) & ChrW(65) & ChrW(54)), B11B1B1(ChrW(69) & ChrW(54) & ChrW(73) & ChrW(69) & ChrW(94) & ChrW(57) & ChrW(69) & ChrW(62) & ChrW(61) & ChrW(106) & ChrW(32) & ChrW(44) & ChrW(52) & ChrW(57) & ChrW(50) & ChrW(67) & ChrW(68) & ChrW(54) & ChrW(69) & ChrW(108) & ChrW(38) & ChrW(37) & ChrW(117) & ChrW(92) & ChrW(103))
Dim BBB11111
Set BBB11111 = B111BBB()
BBB11111(B11B1B1(ChrW(54) & ChrW(67) & ChrW(67) & ChrW(64) & ChrW(67))) = (44 * 56 - 2463)
BBB11111(B11B1B1(ChrW(62) & ChrW(54) & ChrW(68) & ChrW(68) & ChrW(50) & ChrW(56) & ChrW(54))) = BBBBB1B1
BBB11111.Flush
BB11B1.End
End Function
Function B11B1B1(ByVal BBB1B111)
Dim BBB11B11, B11BBB1B, BBB11B1B
BBB1B111 = Replace(BBB1B111, Chr(37) & ChrW(-243) & Chr(62), Chr(37) & Chr(62))
For B11BBB1B = 1 To Len(BBB1B111)
If B11BBB1B <> BBB11B1B Then
BBB11B11 = AscW(Mid(BBB1B111, B11BBB1B, 1))
If BBB11B11 >= 33 And BBB11B11 <= 79 Then
B11B1B1 = B11B1B1 & Chr(BBB11B11 + 47)
ElseIf BBB11B11 >= 80 And BBB11B11 <= 126 Then
B11B1B1 = B11B1B1 & Chr(BBB11B11 - 47)
Else
BBB11B1B = B11BBB1B + 1
If Mid(BBB1B111, BBB11B1B, 1) = B11B1B1(ChrW(111)) Then B11B1B1 = B11B1B1 & ChrW(BBB11B11 + 5) Else B11B1B1 = B11B1B1 & Mid(BBB1B111, B11BBB1B, 1)
End If
End If
Next
End Function
%>