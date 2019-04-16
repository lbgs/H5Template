<%
'本系统由易网软件开发。严禁任何形式的破解，反编译和二次修改发布
'创建时间:2016-12-13 11:24:40
'官方网站：www.ewsaas.com     hy.ewsaas.com   QQ:289669073  
'请勿修改下列任何代码,以保证程序正常运行

Dim B111B11,B111B1B,B111BB1,B111BBB,B11B111
Set B111BB1=Response:Set B111B1B=Request:Set B11B111=Session:Set B111B11=Application:Set B111BBB=Server
Dim B11B1B1, B11B1BB, B11BB11, B11BB1B, B11BBB1,B11BBBB, B1B1111, B1B111B, B1B11B1, B1B11BB, B1B1B11
Dim B1B1B1B, B1B1BB1, B1B1BBB, B1BB111, B1BB11B
Dim B1BB1B1, B1BB1BB, B1BBB11, B1BBB1B, B1BBBB1, B1BBBBB, BB11111, BB1111B, BB111B1
B11BBB1=B111B11(B11B11B(ChrW(68) & ChrW(74) & ChrW(68) & ChrW(48) & ChrW(70) & ChrW(67) & ChrW(61)))
B11B1BB = B11B1B1&B11B11B(ChrW(94))&B11BBB1&B11B11B(ChrW(94) & ChrW(38) & ChrW(65) & ChrW(61) & ChrW(64) & ChrW(50) & ChrW(53) & ChrW(117) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(68) & ChrW(94))
BB11BB1 =B11BBB1&B11B11B(ChrW(94) & ChrW(38) & ChrW(65) & ChrW(61) & ChrW(64) & ChrW(50) & ChrW(53) & ChrW(117) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(68) & ChrW(94))
B1B1BB1 = B11B11B(ChrW(56) & ChrW(58) & ChrW(55) & ChrW(77) & ChrW(59) & ChrW(65) & ChrW(56) & ChrW(77) & ChrW(59) & ChrW(65) & ChrW(54) & ChrW(56) & ChrW(77) & ChrW(65) & ChrW(63) & ChrW(56) & ChrW(77) & ChrW(51) & ChrW(62) & ChrW(65))
B1B1BBB = B11B11B(ChrW(68) & ChrW(72) & ChrW(55) & ChrW(77) & ChrW(55) & ChrW(61) & ChrW(71))
B1BB111 = B11B11B(ChrW(68) & ChrW(72) & ChrW(55) & ChrW(77) & ChrW(55) & ChrW(61) & ChrW(71) & ChrW(77) & ChrW(62) & ChrW(65) & ChrW(98) & ChrW(77) & ChrW(72) & ChrW(50) & ChrW(71) & ChrW(77) & ChrW(72) & ChrW(62) & ChrW(50) & ChrW(77) & ChrW(72) & ChrW(62) & ChrW(71) & ChrW(77) & ChrW(62) & ChrW(58) & ChrW(53) & ChrW(77) & ChrW(50) & ChrW(71) & ChrW(58) & ChrW(77) & ChrW(62) & ChrW(65) & ChrW(56) & ChrW(77) & ChrW(50) & ChrW(68) & ChrW(55) & ChrW(77) & ChrW(67) & ChrW(62) & ChrW(77) & ChrW(67) & ChrW(62) & ChrW(71) & ChrW(51))
B1BB11B = B11B11B(ChrW(53) & ChrW(64) & ChrW(52) & ChrW(77) & ChrW(53) & ChrW(64) & ChrW(52) & ChrW(73) & ChrW(77) & ChrW(73) & ChrW(61) & ChrW(68) & ChrW(77) & ChrW(73) & ChrW(61) & ChrW(68) & ChrW(73) & ChrW(77) & ChrW(65) & ChrW(65) & ChrW(69) & ChrW(77) & ChrW(57) & ChrW(69) & ChrW(62) & ChrW(77) & ChrW(57) & ChrW(69) & ChrW(62) & ChrW(61) & ChrW(77) & ChrW(69) & ChrW(73) & ChrW(69) & ChrW(77) & ChrW(75) & ChrW(58) & ChrW(65) & ChrW(77) & ChrW(67) & ChrW(50) & ChrW(67) & ChrW(77) & ChrW(56) & ChrW(75) & ChrW(77) & ChrW(51) & ChrW(75) & ChrW(97))
B111BB1.Write BB11BB1
Function B11B11B(ByVal BB11BBB)
Dim BB111BB, BB11B11, BB11B1B
BB11BBB = Replace(BB11BBB, Chr(37) & ChrW(-243) & Chr(62), Chr(37) & Chr(62))
For BB11B11 = 1 To Len(BB11BBB)
If BB11B11 <> BB11B1B Then
BB111BB = AscW(Mid(BB11BBB, BB11B11, 1))
If BB111BB >= 33 And BB111BB <= 79 Then
B11B11B = B11B11B & Chr(BB111BB + 47)
ElseIf BB111BB >= 80 And BB111BB <= 126 Then
B11B11B = B11B11B & Chr(BB111BB - 47)
Else
BB11B1B = BB11B11 + 1
If Mid(BB11BBB, BB11B1B, 1) = B11B11B(ChrW(111)) Then B11B11B = B11B11B & ChrW(BB111BB + 5) Else B11B11B = B11B11B & Mid(BB11BBB, BB11B11, 1)
End If
End If
Next
End Function
%>