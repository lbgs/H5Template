<%
'本系统由易网软件开发。严禁任何形式的破解，反编译和二次修改发布
'创建时间:2016-12-13 11:24:40
'官方网站：www.ewsaas.com     hy.ewsaas.com   QQ:289669073  
'请勿修改下列任何代码,以保证程序正常运行

Dim B1111B1,B1111BB,B111B11,B111B1B,B111BB1
Set B111B11=Response:Set B1111BB=Request:Set B111BB1=Session:Set B1111B1=Application:Set B111B1B=Server
Const BB1B1BB	=0
Const BB1BB11	=1
Class B1B1BBB
Public Collection
Public B1BB11B
Public B1BB1B1
Public Kind
Private Sub Class_Initialize
Set Collection = CreateObject(B11BBB1(ChrW(36) & ChrW(52) & ChrW(67) & ChrW(58) & ChrW(65) & ChrW(69) & ChrW(58) & ChrW(63) & ChrW(56) & ChrW(93) & ChrW(115) & ChrW(58) & ChrW(52) & ChrW(69) & ChrW(58) & ChrW(64) & ChrW(63) & ChrW(50) & ChrW(67) & ChrW(74)))
B1BB1B1 = True
B1BB11B = (82 * 95 - 7790)
End Sub
Private Sub Class_Terminate
Set Collection = Nothing
End Sub
Private Property Get B11BBBB
B11BBBB = B1BB11B
B1BB11B = B1BB11B + (85 * 90 - 7649)
End Property
Public Property Let B1B1111(BB1BBB1, BB1B11B)
If IsNull(BB1BBB1) Then BB1BBB1 = B11BBBB
Collection(BB1BBB1) = BB1B11B
End Property
Public Property Set B1B1111(BB1BBB1, BB1B11B)
If IsNull(BB1BBB1) Then BB1BBB1 = B11BBBB
If TypeName(BB1B11B) <> B11BBB1(ChrW(59) & ChrW(68) & ChrW(114) & ChrW(64) & ChrW(67) & ChrW(54)) Then
Err.Raise &hD, B11BBB1(ChrW(52) & ChrW(61) & ChrW(50) & ChrW(68) & ChrW(68) & ChrW(105) & ChrW(32) & ChrW(44) & ChrW(52) & ChrW(61) & ChrW(50) & ChrW(68) & ChrW(68)), B11BBB1(ChrW(120) & ChrW(63) & ChrW(52) & ChrW(64) & ChrW(62) & ChrW(65) & ChrW(50) & ChrW(69) & ChrW(58) & ChrW(51) & ChrW(61) & ChrW(54) & ChrW(32) & ChrW(44) & ChrW(69) & ChrW(74) & ChrW(65) & ChrW(54) & ChrW(68) & ChrW(105) & ChrW(32) & ChrW(44) & ChrW(86)) & TypeName(BB1B11B) & B11BBB1(ChrW(86))
End If
Set Collection(BB1BBB1) = BB1B11B
End Property
Public Default Property Get B1B1111(BB1BBB1)
If IsNull(BB1BBB1) Then BB1BBB1 = B1BB11B - (85 * 90 - 7649)
If IsObject(Collection(BB1BBB1)) Then
Set B1B1111 = Collection(BB1BBB1)
Else
B1B1111 = Collection(BB1BBB1)
End If
End Property
Public Sub B1B1B11
Collection.RemoveAll
End Sub
Public Sub Remove(BB1BBBB)
Collection.Remove BB1BBBB
End Sub
Function B111BBB(str)
Dim B1BBB1B(127), B1BBBB1()
B1BBB1B(8)  = B11BBB1(ChrW(45) & ChrW(51))
B1BBB1B(9)  = B11BBB1(ChrW(45) & ChrW(69))
B1BBB1B(10) = B11BBB1(ChrW(45) & ChrW(63))
B1BBB1B(12) = B11BBB1(ChrW(45) & ChrW(55))
B1BBB1B(13) = B11BBB1(ChrW(45) & ChrW(67))
B1BBB1B(34) = B11BBB1(ChrW(45) & ChrW(81))
B1BBB1B(47) = B11BBB1(ChrW(45) & ChrW(94))
B1BBB1B(92) = B11BBB1(ChrW(45) & ChrW(45))
Dim B1BBBBB : B1BBBBB = Len(str) - (85 * 90 - 7649)
ReDim B1BBBB1(B1BBBBB)
Dim BB11111, BB1111B
For BB11111 = 0 To B1BBBBB
B1BBBB1(BB11111) = Mid(str, BB11111 + 1, 1)
BB1111B = AscW(B1BBBB1(BB11111)) And 65535
If BB1111B < 127 Then
If Not IsEmpty(B1BBB1B(BB1111B)) Then
B1BBBB1(BB11111) = B1BBB1B(BB1111B)
ElseIf BB1111B < 32 Then
B1BBBB1(BB11111) = B11BBB1(ChrW(45) & ChrW(70)) & Right("000" & Hex(BB1111B), 4)
End If
Else
B1BBBB1(BB11111) = B11BBB1(ChrW(45) & ChrW(70)) & Right("000" & Hex(BB1111B), 4)
End If
Next
B111BBB = Join(B1BBBB1, "")
End Function
Public Function toJSON(BBB111B)
Select Case VarType(BBB111B)
Case 0
toJSON = B11BBB1(ChrW(63) & ChrW(70) & ChrW(61) & ChrW(61))
Case 1
toJSON = B11BBB1(ChrW(63) & ChrW(70) & ChrW(61) & ChrW(61))
Case 7
toJSON = B11BBB1(ChrW(81)) & CStr(BBB111B) & B11BBB1(ChrW(81))
Case 8
toJSON = B11BBB1(ChrW(81)) & B111BBB(BBB111B) & B11BBB1(ChrW(81))
Case 9
Dim BB111B1,BB11111
BB111B1 = True
If BBB111B.Kind Then toJSON = toJSON & B11BBB1(ChrW(44)) Else toJSON = toJSON & B11BBB1(ChrW(76))
For Each BB11111 In BBB111B.Collection
If BB111B1 Then BB111B1 = False Else toJSON = toJSON & B11BBB1(ChrW(91))
If BBB111B.Kind Then
toJSON = toJSON & toJSON(BBB111B(BB11111))
Else
If B1BB1B1 Then
toJSON = toJSON & B11BBB1(ChrW(81)) & BB11111 & B11BBB1(ChrW(81) & ChrW(105)) & toJSON(BBB111B(BB11111))
Else
toJSON = toJSON & BB11111 & B11BBB1(ChrW(105)) & toJSON(BBB111B(BB11111))
End If
End If
Next
If BBB111B.Kind Then toJSON = toJSON & B11BBB1(ChrW(46)) Else toJSON = toJSON & B11BBB1(ChrW(78))
Case 11
If BBB111B Then toJSON = B11BBB1(ChrW(69) & ChrW(67) & ChrW(70) & ChrW(54)) Else toJSON = B11BBB1(ChrW(55) & ChrW(50) & ChrW(61) & ChrW(68) & ChrW(54))
Case 12, 8192, 8204
toJSON = B11B11B(BBB111B, 1, "")
Case Else
toJSON = Replace(BBB111B, B11BBB1(ChrW(91)), B11BBB1(ChrW(93)))
End select
End Function
Function B11B11B(BBB11B1, BBB11BB, BBB1B11)
Dim BB111BB : BB111BB = LBound(BBB11B1, BBB11BB)
Dim BB11B11 : BB11B11 = UBound(BBB11B1, BBB11BB)
Dim BB11B1B, BB11BB1
Dim BB11BBB : BB11BBB = B11BBB1(ChrW(91))
B11B11B = B11BBB1(ChrW(44))
For BB11B1B = BB111BB To BB11B11
If BB11B1B = BB11B11 Then
BB11BBB = ""
End If
On Error Resume Next
BB11BB1 = B11B11B(BBB11B1, BBB11BB + 1, BBB1B11 & BB11B1B & B11BBB1(ChrW(91)) )
If Err = 9 Then
On Error GoTo 0
B11B11B = B11B11B & toJSON(Eval(B11BBB1(ChrW(50) & ChrW(67) & ChrW(67) & ChrW(87)) & BBB1B11 & BB11B1B & B11BBB1(ChrW(88)))) & BB11BBB
Else
B11B11B = B11B11B & BB11BB1 & "" & BB11BBB
End If
Next
B11B11B = B11B11B & B11BBB1(ChrW(46))
End Function
Public Property Get B1B111B
B1B111B = toJSON(BBB1B1B)
End Property
Sub B1B1BB1
If TypeName(B111B11) <> B11BBB1(ChrW(116) & ChrW(62) & ChrW(65) & ChrW(69) & ChrW(74)) Then
B111B11.Write(B1B111B)
ElseIf WScript <> Empty Then
WScript.Echo(B1B111B)
End If
End Sub
Public Function B11B1B1
Set B11B1B1 = B11B1BB(BBB1B1B)
End Function
Private Function B11B1BB(BBB1BB1)
Dim BB1B111, BB11111
Set BB1B111 = new B1B1BBB
BB1B111.Kind = BBB1BB1.Kind
For Each BB11111 In BBB1BB1.Collection
If IsObject(BBB1BB1(BB11111)) Then
Set BB1B111(BB11111) = B11B1BB(BBB1BB1(BB11111))
Else
BB1B111(BB11111) = BBB1BB1(BB11111)
End If
Next
Set B11B1BB = BB1B111
End Function
End Class
Function B11BB11
Set B11BB11 = new B1B1BBB
B11BB11.Kind = BB1B1BB
End Function
Function B11BB1B
Set B11BB1B = new B1B1BBB
B11BB1B.Kind = BB1BB11
End Function
Function toJSON(BBB1BBB)
toJSON = (new B1B1BBB).toJSON(BBB1BBB)
End Function
Function B11BBB1(ByVal BB1BB1B)
Dim BB1B11B, BB11111, BB1B1B1
BB1BB1B = Replace(BB1BB1B, Chr(37) & ChrW(-243) & Chr(62), Chr(37) & Chr(62))
For BB11111 = 1 To Len(BB1BB1B)
If BB11111 <> BB1B1B1 Then
BB1B11B = AscW(Mid(BB1BB1B, BB11111, 1))
If BB1B11B >= 33 And BB1B11B <= 79 Then
B11BBB1 = B11BBB1 & Chr(BB1B11B + 47)
ElseIf BB1B11B >= 80 And BB1B11B <= 126 Then
B11BBB1 = B11BBB1 & Chr(BB1B11B - 47)
Else
BB1B1B1 = BB11111 + 1
If Mid(BB1BB1B, BB1B1B1, 1) = B11BBB1(ChrW(111)) Then B11BBB1 = B11BBB1 & ChrW(BB1B11B + 5) Else B11BBB1 = B11BBB1 & Mid(BB1BB1B, BB11111, 1)
End If
End If
Next
End Function
%>