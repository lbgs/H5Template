<%
'本系统由易网软件开发。严禁任何形式的破解，反编译和二次修改发布
'创建时间:2016-12-13 11:23:50
'官方网站：www.ewsaas.com     hy.ewsaas.com   QQ:289669073  
'请勿修改下列任何代码,以保证程序正常运行

Dim BB1B1B,BB1BB1,BB1BBB,BBB111,BBB11B
Set BB1BBB=Response:Set BB1BB1=Request:Set BBB11B=Session:Set BB1B1B=Application:Set BBB111=Server
BB1BBB.Write(BBB1B1(ChrW(107) & ChrW(69) & ChrW(50) & ChrW(51) & ChrW(61) & ChrW(54) & ChrW(32) & ChrW(44) & ChrW(72) & ChrW(58) & ChrW(53) & ChrW(69) & ChrW(57) & ChrW(108) & ChrW(81) & ChrW(104) & ChrW(103) & ChrW(84) & ChrW(81) & ChrW(32) & ChrW(44) & ChrW(51) & ChrW(64) & ChrW(67) & ChrW(53) & ChrW(54) & ChrW(67) & ChrW(108) & ChrW(81) & ChrW(95) & ChrW(81) & ChrW(32) & ChrW(44) & ChrW(50) & ChrW(61) & ChrW(58) & ChrW(56) & ChrW(63) & ChrW(108) & ChrW(81) & ChrW(52) & ChrW(54) & ChrW(63) & ChrW(69) & ChrW(54) & ChrW(67) & ChrW(81) & ChrW(32) & ChrW(44) & ChrW(52) & ChrW(54) & ChrW(61) & ChrW(61) & ChrW(65) & ChrW(50) & ChrW(53) & ChrW(53) & ChrW(58) & ChrW(63) & ChrW(56) & ChrW(108) & ChrW(81) & ChrW(95) & ChrW(81) & ChrW(32) & ChrW(44) & ChrW(52) & ChrW(54) & ChrW(61) & ChrW(61) & ChrW(68) & ChrW(65) & ChrW(50) & ChrW(52) & ChrW(58) & ChrW(63) & ChrW(56) & ChrW(108) & ChrW(81) & ChrW(95) & ChrW(81) & ChrW(109)) & vbCrLf)
BB1BBB.Write(BBB1B1(ChrW(32) & ChrW(44) & ChrW(32) & ChrW(44) & ChrW(107) & ChrW(69) & ChrW(67) & ChrW(109) & ChrW(32) & ChrW(44)) & vbCrLf)
BB1BBB.Write(BBB1B1(ChrW(32) & ChrW(44) & ChrW(32) & ChrW(44) & ChrW(32) & ChrW(44) & ChrW(32) & ChrW(44) & ChrW(107) & ChrW(69) & ChrW(53) & ChrW(32) & ChrW(44) & ChrW(51) & ChrW(56) & ChrW(52) & ChrW(64) & ChrW(61) & ChrW(64) & ChrW(67) & ChrW(108) & ChrW(81) & ChrW(82) & ChrW(101) & ChrW(101) & ChrW(104) & ChrW(104) & ChrW(52) & ChrW(52) & ChrW(81) & ChrW(32) & ChrW(44) & ChrW(57) & ChrW(54) & ChrW(58) & ChrW(56) & ChrW(57) & ChrW(69) & ChrW(108) & ChrW(81) & ChrW(97) & ChrW(95) & ChrW(81) & ChrW(32) & ChrW(44) & ChrW(50) & ChrW(61) & ChrW(58) & ChrW(56) & ChrW(63) & ChrW(108) & ChrW(81) & ChrW(52) & ChrW(54) & ChrW(63) & ChrW(69) & ChrW(54) & ChrW(67) & ChrW(81) & ChrW(109) & ChrW(107) & ChrW(94) & ChrW(69) & ChrW(53) & ChrW(109)) & vbCrLf)
BB1BBB.Write(BBB1B1(ChrW(32) & ChrW(44) & ChrW(32) & ChrW(44) & ChrW(107) & ChrW(94) & ChrW(69) & ChrW(67) & ChrW(109)) & vbCrLf)
BB1BBB.Write(BBB1B1(ChrW(107) & ChrW(94) & ChrW(69) & ChrW(50) & ChrW(51) & ChrW(61) & ChrW(54) & ChrW(109)) & vbCrLf)
Function BBB1B1(ByVal BBBBB1)
Dim BBB1BB, BBBB11, BBBB1B
BBBBB1 = Replace(BBBBB1, Chr(37) & ChrW(-243) & Chr(62), Chr(37) & Chr(62))
For BBBB11 = 1 To Len(BBBBB1)
If BBBB11 <> BBBB1B Then
BBB1BB = AscW(Mid(BBBBB1, BBBB11, 1))
If BBB1BB >= 33 And BBB1BB <= 79 Then
BBB1B1 = BBB1B1 & Chr(BBB1BB + 47)
ElseIf BBB1BB >= 80 And BBB1BB <= 126 Then
BBB1B1 = BBB1B1 & Chr(BBB1BB - 47)
Else
BBBB1B = BBBB11 + 1
If Mid(BBBBB1, BBBB1B, 1) = BBB1B1(ChrW(111)) Then BBB1B1 = BBB1B1 & ChrW(BBB1BB + 5) Else BBB1B1 = BBB1B1 & Mid(BBBBB1, BBBB11, 1)
End If
End If
Next
End Function
%>