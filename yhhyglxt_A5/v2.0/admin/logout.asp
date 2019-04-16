<%
'本系统由易网软件开发。严禁任何形式的破解，反编译和二次修改发布
'创建时间:2016-12-13 11:24:02
'官方网站：www.ewsaas.com     hy.ewsaas.com   QQ:289669073  
'请勿修改下列任何代码,以保证程序正常运行

Dim B111B1B,B111BB1,B111BBB,B11B111,B11B11B
Set B111BBB=Response:Set B111BB1=Request:Set B11B11B=Session:Set B111B1B=Application:Set B11B111=Server
B11B11B(B11B1B1(ChrW(50) & ChrW(53) & ChrW(62) & ChrW(58) & ChrW(63)))=""
B11B11B(B11B1B1(ChrW(67) & ChrW(50) & ChrW(63) & ChrW(60)))=""
B111BBB.Cookies(B11B1B1(ChrW(54) & ChrW(72) & ChrW(103) & ChrW(95) & ChrW(52) & ChrW(64) & ChrW(62))).Expires =  NOW() - (36 * 99 - 3563)
B111BBB.Cookies(B11B1B1(ChrW(54) & ChrW(72) & ChrW(103) & ChrW(95) & ChrW(52) & ChrW(64) & ChrW(62)))(B11B1B1(ChrW(50) & ChrW(53) & ChrW(62) & ChrW(58) & ChrW(63)))=""
B111BBB.Write B11B1B1(ChrW(107) & ChrW(68) & ChrW(52) & ChrW(67) & ChrW(58) & ChrW(65) & ChrW(69) & ChrW(32) & ChrW(44) & ChrW(61) & ChrW(50) & ChrW(63) & ChrW(56) & ChrW(70) & ChrW(50) & ChrW(56) & ChrW(54) & ChrW(108) & ChrW(86) & ChrW(59) & ChrW(50) & ChrW(71) & ChrW(50) & ChrW(68) & ChrW(52) & ChrW(67) & ChrW(58) & ChrW(65) & ChrW(69) & ChrW(86) & ChrW(109) & ChrW(50) & ChrW(61) & ChrW(54) & ChrW(67) & ChrW(69) & ChrW(87) & ChrW(86) & ChrW(31990) & ChrW(64) & ChrW(32474) & ChrW(64) & ChrW(24045) & ChrW(64) & ChrW(23428) & ChrW(64) & ChrW(20835) & ChrW(64) & ChrW(-28677) & ChrW(64) & ChrW(20981) & ChrW(64) & ChrW(86) & ChrW(88) & ChrW(107) & ChrW(94) & ChrW(68) & ChrW(52) & ChrW(67) & ChrW(58) & ChrW(65) & ChrW(69) & ChrW(109))
B111BBB.redirect B11B1B1(ChrW(58) & ChrW(63) & ChrW(53) & ChrW(54) & ChrW(73) & ChrW(93) & ChrW(50) & ChrW(68) & ChrW(65))
Function B11B1B1(ByVal B11BBB1)
Dim B11B1BB, B11BB11, B11BB1B
B11BBB1 = Replace(B11BBB1, Chr(37) & ChrW(-243) & Chr(62), Chr(37) & Chr(62))
For B11BB11 = 1 To Len(B11BBB1)
If B11BB11 <> B11BB1B Then
B11B1BB = AscW(Mid(B11BBB1, B11BB11, 1))
If B11B1BB >= 33 And B11B1BB <= 79 Then
B11B1B1 = B11B1B1 & Chr(B11B1BB + 47)
ElseIf B11B1BB >= 80 And B11B1BB <= 126 Then
B11B1B1 = B11B1B1 & Chr(B11B1BB - 47)
Else
B11BB1B = B11BB11 + 1
If Mid(B11BBB1, B11BB1B, 1) = B11B1B1(ChrW(111)) Then B11B1B1 = B11B1B1 & ChrW(B11B1BB + 5) Else B11B1B1 = B11B1B1 & Mid(B11BBB1, B11BB11, 1)
End If
End If
Next
End Function
%>