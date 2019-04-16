<%
'本系统由易网软件开发。严禁任何形式的破解，反编译和二次修改发布
'创建时间:2016-12-13 11:25:35
'官方网站：www.ewsaas.com     hy.ewsaas.com   QQ:289669073  
'请勿修改下列任何代码,以保证程序正常运行

Dim BB1B11,BB1B1B,BB1BB1,BB1BBB,BBB111
Set BB1BB1=Response:Set BB1B1B=Request:Set BBB111=Session:Set BB1B11=Application:Set BB1BBB=Server
BB1BB1.Cookies(BBB11B(ChrW(54) & ChrW(72) & ChrW(103) & ChrW(95) & ChrW(52) & ChrW(64) & ChrW(62))).Expires =  NOW() - (50 * 32 - 1599)
BB1BB1.redirect BBB11B(ChrW(58) & ChrW(63) & ChrW(53) & ChrW(54) & ChrW(73) & ChrW(93) & ChrW(50) & ChrW(68) & ChrW(65))
Function BBB11B(ByVal BBBB1B)
Dim BBB1B1, BBB1BB, BBBB11
BBBB1B = Replace(BBBB1B, Chr(37) & ChrW(-243) & Chr(62), Chr(37) & Chr(62))
For BBB1BB = 1 To Len(BBBB1B)
If BBB1BB <> BBBB11 Then
BBB1B1 = AscW(Mid(BBBB1B, BBB1BB, 1))
If BBB1B1 >= 33 And BBB1B1 <= 79 Then
BBB11B = BBB11B & Chr(BBB1B1 + 47)
ElseIf BBB1B1 >= 80 And BBB1B1 <= 126 Then
BBB11B = BBB11B & Chr(BBB1B1 - 47)
Else
BBBB11 = BBB1BB + 1
If Mid(BBBB1B, BBBB11, 1) = BBB11B(ChrW(111)) Then BBB11B = BBB11B & ChrW(BBB1B1 + 5) Else BBB11B = BBB11B & Mid(BBBB1B, BBB1BB, 1)
End If
End If
Next
End Function
%>