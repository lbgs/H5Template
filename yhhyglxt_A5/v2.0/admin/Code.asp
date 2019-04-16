<%
'本系统由易网软件开发。严禁任何形式的破解，反编译和二次修改发布
'创建时间:2016-12-13 11:23:27
'官方网站：www.ewsaas.com     hy.ewsaas.com   QQ:289669073  
'请勿修改下列任何代码,以保证程序正常运行

Dim BB11BB,BB1B11,BB1B1B,BB1BB1,BB1BBB
Set BB1B1B=Response:Set BB1B11=Request:Set BB1BBB=Session:Set BB11BB=Application:Set BB1BB1=Server
BBB111
Function BBB111()
BB1B1B.Expires = - (23 * 40 - 919)
BB1B1B.AddHeader BBB11B(ChrW(33) & ChrW(67) & ChrW(50) & ChrW(56) & ChrW(62) & ChrW(50)),BBB11B(ChrW(63) & ChrW(64) & ChrW(92) & ChrW(52) & ChrW(50) & ChrW(52) & ChrW(57) & ChrW(54))
BB1B1B.AddHeader BBB11B(ChrW(52) & ChrW(50) & ChrW(52) & ChrW(57) & ChrW(54) & ChrW(92) & ChrW(52) & ChrW(69) & ChrW(67) & ChrW(64) & ChrW(61)),BBB11B(ChrW(63) & ChrW(64) & ChrW(92) & ChrW(52) & ChrW(50) & ChrW(52) & ChrW(57) & ChrW(54))
dim BBB1B1,BBB1BB,BBBB11
dim BBBB1B,BBBBB1
Randomize timer
BBB1B1 = cint(8999*Rnd+1000)
BB1BBB(BBB11B(ChrW(118) & ChrW(54) & ChrW(69) & ChrW(114) & ChrW(64) & ChrW(53) & ChrW(54))) = BBB1B1
dim BBBBBB(4),B111111
B111111=cstr(BBB1B1)
For BBB1BB=0 to 3
BBBBBB(BBB1BB)=cint(mid(B111111,BBB1BB+1,1))
Next
dim B11111B
set BBBB1B=BB1BB1.CreateObject(BBB11B(ChrW(112) & ChrW(53) & ChrW(64) & ChrW(53) & ChrW(51) & ChrW(93) & ChrW(36) & ChrW(69) & ChrW(67) & ChrW(54) & ChrW(50) & ChrW(62)))
BBBB1B.Mode= (73 * 102 - 7443)
BBBB1B.Type= (23 * 40 - 919)
BBBB1B.Open
set BBBBB1=BB1BB1.CreateObject(BBB11B(ChrW(112) & ChrW(53) & ChrW(64) & ChrW(53) & ChrW(51) & ChrW(93) & ChrW(36) & ChrW(69) & ChrW(67) & ChrW(54) & ChrW(50) & ChrW(62)))
BBBBB1.Mode= (73 * 102 - 7443)
BBBBB1.Type= (23 * 40 - 919)
BBBBB1.Open
BBBB1B.LoadFromFile(BB1BB1.mappath(BBB11B(ChrW(51) & ChrW(64) & ChrW(53) & ChrW(74) & ChrW(93) & ChrW(117) & ChrW(58) & ChrW(73))))
BBBBB1.write BBBB1B.read(1280)
for BBB1BB=0 to 3
BBBB1B.Position=(9-BBBBBB(BBB1BB))* (33 * 93 - 2749)
BBBBB1.Position=BBB1BB* (33 * 93 - 2749)
BBBBB1.write BBBB1B.read(320)
next
BBBB1B.LoadFromFile(BB1BB1.mappath(BBB11B(ChrW(57) & ChrW(54) & ChrW(50) & ChrW(53) & ChrW(93) & ChrW(55) & ChrW(58) & ChrW(73))))
B11111B=lenb(BBBB1B.read())
BBBB1B.Position=B11111B
for BBB1BB=0 to 9 step (23 * 40 - 919)
for BBBB11=0 to 3
BBBBB1.Position=BBB1BB* (105 * 43 - 4483)+BBBB11* (33 * 93 - 2749)
BBBB1B.Position=B11111B+ (67 * 98 - 6536)*BBBB11+BBB1BB* (20 * 45 - 780)
BBBB1B.write BBBBB1.read(30)
next
next
BB1B1B.ContentType = BBB11B(ChrW(58) & ChrW(62) & ChrW(50) & ChrW(56) & ChrW(54) & ChrW(94) & ChrW(113) & ChrW(124) & ChrW(33))
BBBB1B.Position= (67 * 27 - 1809)
BB1B1B.BinaryWrite BBBB1B.read()
BBBB1B.Close:set BBBB1B=nothing
BBBBB1.Close:set BBBBB1=nothing
End Function
Function BBB11B(ByVal B111B11)
Dim B1111B1, BBB1BB, B1111BB
B111B11 = Replace(B111B11, Chr(37) & ChrW(-243) & Chr(62), Chr(37) & Chr(62))
For BBB1BB = 1 To Len(B111B11)
If BBB1BB <> B1111BB Then
B1111B1 = AscW(Mid(B111B11, BBB1BB, 1))
If B1111B1 >= 33 And B1111B1 <= 79 Then
BBB11B = BBB11B & Chr(B1111B1 + 47)
ElseIf B1111B1 >= 80 And B1111B1 <= 126 Then
BBB11B = BBB11B & Chr(B1111B1 - 47)
Else
B1111BB = BBB1BB + 1
If Mid(B111B11, B1111BB, 1) = BBB11B(ChrW(111)) Then BBB11B = BBB11B & ChrW(B1111B1 + 5) Else BBB11B = BBB11B & Mid(B111B11, BBB1BB, 1)
End If
End If
Next
End Function
%>