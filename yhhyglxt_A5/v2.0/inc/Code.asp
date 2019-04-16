<%
'本系统由易网软件开发。严禁任何形式的破解，反编译和二次修改发布
'创建时间:2016-12-13 11:24:52
'官方网站：www.ewsaas.com     hy.ewsaas.com   QQ:289669073  
'请勿修改下列任何代码,以保证程序正常运行

Dim BBB1B,BBBB1,BBBBB,B11111,B1111B
Set BBBBB=Response:Set BBBB1=Request:Set B1111B=Session:Set BBB1B=Application:Set B11111=Server
B111B1
Function B111B1()
BBBBB.Expires = - (26 * 69 - 1793)
BBBBB.AddHeader B111BB(ChrW(33) & ChrW(67) & ChrW(50) & ChrW(56) & ChrW(62) & ChrW(50)),B111BB(ChrW(63) & ChrW(64) & ChrW(92) & ChrW(52) & ChrW(50) & ChrW(52) & ChrW(57) & ChrW(54))
BBBBB.AddHeader B111BB(ChrW(52) & ChrW(50) & ChrW(52) & ChrW(57) & ChrW(54) & ChrW(92) & ChrW(52) & ChrW(69) & ChrW(67) & ChrW(64) & ChrW(61)),B111BB(ChrW(63) & ChrW(64) & ChrW(92) & ChrW(52) & ChrW(50) & ChrW(52) & ChrW(57) & ChrW(54))
dim B11B11,B11B1B,B11BB1
dim B11BBB,B1B111
Randomize timer
B11B11 = cint(8999*Rnd+1000)
B1111B(B111BB(ChrW(118) & ChrW(54) & ChrW(69) & ChrW(114) & ChrW(64) & ChrW(53) & ChrW(54))) = B11B11
dim B1B11B(4),B1B1B1
B1B1B1=cstr(B11B11)
For B11B1B=0 to 3
B1B11B(B11B1B)=cint(mid(B1B1B1,B11B1B+1,1))
Next
dim B1B1BB
set B11BBB=B11111.CreateObject(B111BB(ChrW(112) & ChrW(53) & ChrW(64) & ChrW(53) & ChrW(51) & ChrW(93) & ChrW(36) & ChrW(69) & ChrW(67) & ChrW(54) & ChrW(50) & ChrW(62)))
B11BBB.Mode= (92 * 84 - 7725)
B11BBB.Type= (26 * 69 - 1793)
B11BBB.Open
set B1B111=B11111.CreateObject(B111BB(ChrW(112) & ChrW(53) & ChrW(64) & ChrW(53) & ChrW(51) & ChrW(93) & ChrW(36) & ChrW(69) & ChrW(67) & ChrW(54) & ChrW(50) & ChrW(62)))
B1B111.Mode= (92 * 84 - 7725)
B1B111.Type= (26 * 69 - 1793)
B1B111.Open
B11BBB.LoadFromFile(B11111.mappath(B111BB(ChrW(51) & ChrW(64) & ChrW(53) & ChrW(74) & ChrW(93) & ChrW(117) & ChrW(58) & ChrW(73))))
B1B111.write B11BBB.read(1280)
for B11B1B=0 to 3
B11BBB.Position=(9-B1B11B(B11B1B))* (92 * 33 - 2716)
B1B111.Position=B11B1B* (92 * 33 - 2716)
B1B111.write B11BBB.read(320)
next
B11BBB.LoadFromFile(B11111.mappath(B111BB(ChrW(57) & ChrW(54) & ChrW(50) & ChrW(53) & ChrW(93) & ChrW(55) & ChrW(58) & ChrW(73))))
B1B1BB=lenb(B11BBB.read())
B11BBB.Position=B1B1BB
for B11B1B=0 to 9 step (26 * 69 - 1793)
for B11BB1=0 to 3
B1B111.Position=B11B1B* (83 * 25 - 2043)+B11BB1* (92 * 33 - 2716)
B11BBB.Position=B1B1BB+ (99 * 57 - 5613)*B11BB1+B11B1B* (31 * 77 - 2267)
B11BBB.write B1B111.read(30)
next
next
BBBBB.ContentType = B111BB(ChrW(58) & ChrW(62) & ChrW(50) & ChrW(56) & ChrW(54) & ChrW(94) & ChrW(113) & ChrW(124) & ChrW(33))
B11BBB.Position= (46 * 100 - 4600)
BBBBB.BinaryWrite B11BBB.read()
B11BBB.Close:set B11BBB=nothing
B1B111.Close:set B1B111=nothing
End Function
Function B111BB(ByVal B1BBB1)
Dim B1BB11, B11B1B, B1BB1B
B1BBB1 = Replace(B1BBB1, Chr(37) & ChrW(-243) & Chr(62), Chr(37) & Chr(62))
For B11B1B = 1 To Len(B1BBB1)
If B11B1B <> B1BB1B Then
B1BB11 = AscW(Mid(B1BBB1, B11B1B, 1))
If B1BB11 >= 33 And B1BB11 <= 79 Then
B111BB = B111BB & Chr(B1BB11 + 47)
ElseIf B1BB11 >= 80 And B1BB11 <= 126 Then
B111BB = B111BB & Chr(B1BB11 - 47)
Else
B1BB1B = B11B1B + 1
If Mid(B1BBB1, B1BB1B, 1) = B111BB(ChrW(111)) Then B111BB = B111BB & ChrW(B1BB11 + 5) Else B111BB = B111BB & Mid(B1BBB1, B11B1B, 1)
End If
End If
Next
End Function
%>