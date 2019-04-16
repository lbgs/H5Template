<%@ CODEPAGE=65001 %>
<%
'本系统由易网软件开发。严禁任何形式的破解，反编译和二次修改发布
'创建时间:2016-12-13 11:24:39
'官方网站：www.ewsaas.com     hy.ewsaas.com   QQ:289669073  
'请勿修改下列任何代码,以保证程序正常运行

Dim BBBBBB,B111111,B11111B,B1111B1,B1111BB
Set B11111B=Response:Set B111111=Request:Set B1111BB=Session:Set BBBBBB=Application:Set B1111B1=Server
B11111B.CodePage= (18 * 30 - -64461)
B11111B.Charset=B11BBBB(ChrW(38) & ChrW(37) & ChrW(117) & ChrW(92) & ChrW(103))
Const B11B11BB	=0
Const B11B1B11	=1
Class B1BB111
Public Collection
Public Count
Public B1BB1BB
Public Kind
Private Sub Class_Initialize
Set Collection = CreateObject(B11BBBB(ChrW(36) & ChrW(52) & ChrW(67) & ChrW(58) & ChrW(65) & ChrW(69) & ChrW(58) & ChrW(63) & ChrW(56) & ChrW(93) & ChrW(115) & ChrW(58) & ChrW(52) & ChrW(69) & ChrW(58) & ChrW(64) & ChrW(63) & ChrW(50) & ChrW(67) & ChrW(74)))
B1BB1BB = True
Count = (24 * 54 - 1296)
End Sub
Private Sub Class_Terminate
Set Collection = Nothing
End Sub
Private Property Get B1B1111
B1B1111 = Count
Count = Count + (88 * 33 - 2903)
End Property
Public Property Let B1B111B(B11B1BB1, B11B111B)
If IsNull(B11B1BB1) Then B11B1BB1 = B1B1111
Collection(B11B1BB1) = B11B111B
End Property
Public Property Set B1B111B(B11B1BB1, B11B111B)
If IsNull(B11B1BB1) Then B11B1BB1 = B1B1111
If TypeName(B11B111B) <> B11BBBB(ChrW(59) & ChrW(68) & ChrW(114) & ChrW(64) & ChrW(67) & ChrW(54)) Then
Err.Raise &hD, B11BBBB(ChrW(52) & ChrW(61) & ChrW(50) & ChrW(68) & ChrW(68) & ChrW(105) & ChrW(32) & ChrW(44) & ChrW(52) & ChrW(61) & ChrW(50) & ChrW(68) & ChrW(68)), B11BBBB(ChrW(120) & ChrW(63) & ChrW(52) & ChrW(64) & ChrW(62) & ChrW(65) & ChrW(50) & ChrW(69) & ChrW(58) & ChrW(51) & ChrW(61) & ChrW(54) & ChrW(32) & ChrW(44) & ChrW(69) & ChrW(74) & ChrW(65) & ChrW(54) & ChrW(68) & ChrW(105) & ChrW(32) & ChrW(44) & ChrW(86)) & TypeName(B11B111B) & B11BBBB(ChrW(86))
End If
Set Collection(B11B1BB1) = B11B111B
End Property
Public Default Property Get B1B111B(B11B1BB1)
If IsNull(B11B1BB1) Then B11B1BB1 = Count - (88 * 33 - 2903)
If IsObject(Collection(B11B1BB1)) Then
Set B1B111B = Collection(B11B1BB1)
Else
B1B111B = Collection(B11B1BB1)
End If
End Property
Public Sub B1B1B1B
Collection.RemoveAll
End Sub
Public Sub Remove(B11B1BBB)
Collection.Remove B11B1BBB
End Sub
Function B111B11(str)
Dim B1BBBB1(127), B1BBBBB()
B1BBBB1(8)  = B11BBBB(ChrW(45) & ChrW(51))
B1BBBB1(9)  = B11BBBB(ChrW(45) & ChrW(69))
B1BBBB1(10) = B11BBBB(ChrW(45) & ChrW(63))
B1BBBB1(12) = B11BBBB(ChrW(45) & ChrW(55))
B1BBBB1(13) = B11BBBB(ChrW(45) & ChrW(67))
B1BBBB1(34) = B11BBBB(ChrW(45) & ChrW(81))
B1BBBB1(47) = B11BBBB(ChrW(45) & ChrW(94))
B1BBBB1(92) = B11BBBB(ChrW(45) & ChrW(45))
Dim BB11111 : BB11111 = Len(str) - (88 * 33 - 2903)
ReDim B1BBBBB(BB11111)
Dim BB1111B, BB111B1
For BB1111B = 0 To BB11111
B1BBBBB(BB1111B) = Mid(str, BB1111B + 1, 1)
BB111B1 = AscW(B1BBBBB(BB1111B)) And 65535
If BB111B1 < 127 Then
If Not IsEmpty(B1BBBB1(BB111B1)) Then
B1BBBBB(BB1111B) = B1BBBB1(BB111B1)
ElseIf BB111B1 < 32 Then
B1BBBBB(BB1111B) = B11BBBB(ChrW(45) & ChrW(70)) & Right("000" & Hex(BB111B1), 4)
End If
Else
B1BBBBB(BB1111B) = B11BBBB(ChrW(45) & ChrW(70)) & Right("000" & Hex(BB111B1), 4)
End If
Next
B111B11 = Join(B1BBBBB, "")
End Function
Public Function toJSON(B11BB11B)
Select Case VarType(B11BB11B)
Case 0
toJSON = B11BBBB(ChrW(63) & ChrW(70) & ChrW(61) & ChrW(61))
Case 1
toJSON = B11BBBB(ChrW(63) & ChrW(70) & ChrW(61) & ChrW(61))
Case 7
toJSON = B11BBBB(ChrW(81)) & CStr(B11BB11B) & B11BBBB(ChrW(81))
Case 8
toJSON = B11BBBB(ChrW(81)) & B111B11(B11BB11B) & B11BBBB(ChrW(81))
Case 9
Dim BB111BB,BB1111B
BB111BB = True
If B11BB11B.Kind Then toJSON = toJSON & B11BBBB(ChrW(44)) Else toJSON = toJSON & B11BBBB(ChrW(76))
For Each BB1111B In B11BB11B.Collection
If BB111BB Then BB111BB = False Else toJSON = toJSON & B11BBBB(ChrW(91))
If B11BB11B.Kind Then
toJSON = toJSON & toJSON(B11BB11B(BB1111B))
Else
If B1BB1BB Then
toJSON = toJSON & B11BBBB(ChrW(81)) & BB1111B & B11BBBB(ChrW(81) & ChrW(105)) & toJSON(B11BB11B(BB1111B))
Else
toJSON = toJSON & BB1111B & B11BBBB(ChrW(105)) & toJSON(B11BB11B(BB1111B))
End If
End If
Next
If B11BB11B.Kind Then toJSON = toJSON & B11BBBB(ChrW(46)) Else toJSON = toJSON & B11BBBB(ChrW(78))
Case 11
If B11BB11B Then toJSON = B11BBBB(ChrW(69) & ChrW(67) & ChrW(70) & ChrW(54)) Else toJSON = B11BBBB(ChrW(55) & ChrW(50) & ChrW(61) & ChrW(68) & ChrW(54))
Case 12, 8192, 8204
toJSON = B111BB1(B11BB11B, 1, "")
Case Else
toJSON = Replace(B11BB11B, B11BBBB(ChrW(91)), B11BBBB(ChrW(93)))
End select
End Function
Function B111BB1(B11BB1B1, B11BB1BB, B11BBB11)
Dim BB11B11 : BB11B11 = LBound(B11BB1B1, B11BB1BB)
Dim BB11B1B : BB11B1B = UBound(B11BB1B1, B11BB1BB)
Dim BB11BB1, BB11BBB
Dim BB1B111 : BB1B111 = B11BBBB(ChrW(91))
B111BB1 = B11BBBB(ChrW(44))
For BB11BB1 = BB11B11 To BB11B1B
If BB11BB1 = BB11B1B Then
BB1B111 = ""
End If
On Error Resume Next
BB11BBB = B111BB1(B11BB1B1, B11BB1BB + 1, B11BBB11 & BB11BB1 & B11BBBB(ChrW(91)) )
If Err = 9 Then
On Error GoTo 0
B111BB1 = B111BB1 & toJSON(Eval(B11BBBB(ChrW(50) & ChrW(67) & ChrW(67) & ChrW(87)) & B11BBB11 & BB11BB1 & B11BBBB(ChrW(88)))) & BB1B111
Else
B111BB1 = B111BB1 & BB11BBB & "" & BB1B111
End If
Next
B111BB1 = B111BB1 & B11BBBB(ChrW(46))
End Function
Public Property Get B1B11B1
B1B11B1 = toJSON(B11BBB1B)
End Property
Sub Flush
If TypeName(B11111B) <> B11BBBB(ChrW(116) & ChrW(62) & ChrW(65) & ChrW(69) & ChrW(74)) Then
B11111B.Write(B1B11B1)
ElseIf WScript <> Empty Then
WScript.Echo(B1B11B1)
End If
End Sub
Public Function B111BBB
Set B111BBB = B11B111(B11BBB1B)
End Function
Private Function B11B111(B11BBBB1)
Dim BB1B11B, BB1111B
Set BB1B11B = new B1BB111
BB1B11B.Kind = B11BBBB1.Kind
For Each BB1111B In B11BBBB1.Collection
If IsObject(B11BBBB1(BB1111B)) Then
Set BB1B11B(BB1111B) = B11B111(B11BBBB1(BB1111B))
Else
BB1B11B(BB1111B) = B11BBBB1(BB1111B)
End If
Next
Set B11B111 = BB1B11B
End Function
End Class
Function B11B11B
Set B11B11B = new B1BB111
B11B11B.Kind = B11B11BB
End Function
Function B11B1B1
Set B11B1B1 = new B1BB111
B11B1B1.Kind = B11B1B11
End Function
Function toJSON(B11BBBBB)
toJSON = (new B1BB111).toJSON(B11BBBBB)
End Function
Dim BB1B1B1, BB1B1BB, BB1BB11,BB1BB1B, BB1BBB1
Dim BB1BBBB, BBB1111, BBB111B, BBB11B1
Dim BBB11BB, BBB1B11, BBB1B1B, BBB1BB1, BBB1BBB, BBBB111, BBBB11B, BBBB1B1
Dim BBBB1BB, BBBBB11, BBBBB1B, BBBBBB1, BB1111B, BBBBBBB
Dim B1111111(), B111111B(), B11111B1, B11111BB, B1111B11, B1111B1B, B1111BB1, B1111BBB, B111B111
BB1BB1B=BBBBBB(B11BBBB(ChrW(68) & ChrW(74) & ChrW(68) & ChrW(48) & ChrW(70) & ChrW(67) & ChrW(61)))
BB1B1B1 = B111111.ServerVariables(B11BBBB(ChrW(36) & ChrW(114) & ChrW(35) & ChrW(120) & ChrW(33) & ChrW(37) & ChrW(48) & ChrW(125) & ChrW(112) & ChrW(124) & ChrW(116)))
BB1B1B1 = left(BB1B1B1, InStrRev(BB1B1B1, B11BBBB(ChrW(94))))
BB1B1BB = BB1BB1B&B11BBBB(ChrW(94) & ChrW(38) & ChrW(65) & ChrW(61) & ChrW(64) & ChrW(50) & ChrW(53) & ChrW(117) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(68) & ChrW(94))
BB1BB11 = B11BBBB(ChrW(57) & ChrW(69) & ChrW(69) & ChrW(65) & ChrW(105) & ChrW(94) & ChrW(94))&B111111.ServerVariables(B11BBBB(ChrW(36) & ChrW(116) & ChrW(35) & ChrW(39) & ChrW(116) & ChrW(35) & ChrW(48) & ChrW(125) & ChrW(112) & ChrW(124) & ChrW(116)))&""&BB1BB1B&B11BBBB(ChrW(94) & ChrW(38) & ChrW(65) & ChrW(61) & ChrW(64) & ChrW(50) & ChrW(53) & ChrW(117) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(68) & ChrW(94))
BB1BBB1 = B11BBBB(ChrW(56) & ChrW(58) & ChrW(55) & ChrW(91) & ChrW(59) & ChrW(65) & ChrW(56) & ChrW(91) & ChrW(59) & ChrW(65) & ChrW(54) & ChrW(56) & ChrW(91) & ChrW(65) & ChrW(63) & ChrW(56) & ChrW(91) & ChrW(51) & ChrW(62) & ChrW(65))
BB1BBBB = ""
BBB1111 = ""
BBB111B = ""
BBB11B1 = ""
Set BBB1BB1 = B1111B1.CreateObject(B11BBBB(ChrW(36) & ChrW(52) & ChrW(67) & ChrW(58) & ChrW(65) & ChrW(69) & ChrW(58) & ChrW(63) & ChrW(56) & ChrW(93) & ChrW(117) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(36) & ChrW(74) & ChrW(68) & ChrW(69) & ChrW(54) & ChrW(62) & ChrW(126) & ChrW(51) & ChrW(59) & ChrW(54) & ChrW(52) & ChrW(69)))
BBB1B1B = B111111.QueryString(B11BBBB(ChrW(53) & ChrW(58) & ChrW(67)))
If Not isEmpty(BBB1B1B) Then
If instr(lcase(B11BBBB(ChrW(58) & ChrW(62) & ChrW(50) & ChrW(56) & ChrW(54) & ChrW(91) & ChrW(55) & ChrW(61) & ChrW(50) & ChrW(68) & ChrW(57) & ChrW(91) & ChrW(62) & ChrW(54) & ChrW(53) & ChrW(58) & ChrW(50) & ChrW(91) & ChrW(55) & ChrW(58) & ChrW(61) & ChrW(54))), BBB1B1B) < 1 Then
B11111B.Write B11BBBB(ChrW(120) & ChrW(63) & ChrW(71) & ChrW(50) & ChrW(61) & ChrW(58) & ChrW(53) & ChrW(32) & ChrW(44) & ChrW(115) & ChrW(58) & ChrW(67) & ChrW(54) & ChrW(52) & ChrW(69) & ChrW(64) & ChrW(67) & ChrW(74) & ChrW(32) & ChrW(44) & ChrW(63) & ChrW(50) & ChrW(62) & ChrW(54) & ChrW(93))
B11111B.End
End If
BB1B1BB = BB1B1BB & BBB1B1B & B11BBBB(ChrW(94))
BB1BB11 = BB1BB11 & BBB1B1B & B11BBBB(ChrW(94))
If Not BBB1BB1.FolderExists(B1111B1.mappath(BB1B1BB)) Then
BBB1BB1.CreateFolder(B1111B1.mappath(BB1B1BB))
End If
End If
BBB11BB = B111111.QueryString(B11BBBB(ChrW(65) & ChrW(50) & ChrW(69) & ChrW(57)))
If BBB11BB = "" Then
BB1BBBB = B1111B1.MapPath(BB1B1BB) & B11BBBB(ChrW(45))
BBB1111 = BB1BB11
BBB111B = ""
BBB11B1 = ""
Else
BB1BBBB = B1111B1.MapPath(BB1B1BB & BBB11BB) & B11BBBB(ChrW(45))
BBB1111 = BB1BB11 + BBB11BB
BBB111B = BBB11BB
BBB11B1 = B11BB1B(BBB111B, B11BBBB(ChrW(87) & ChrW(93) & ChrW(89) & ChrW(110) & ChrW(88) & ChrW(44) & ChrW(47) & ChrW(45) & ChrW(94) & ChrW(46) & ChrW(90) & ChrW(45) & ChrW(94) & ChrW(83)), B11BBBB(ChrW(83) & ChrW(96)))
End If
Set BBB1BBB = BBB1BB1.GetFolder(BB1BBBB)
BBB1B11 = lcase(B111111.QueryString(B11BBBB(ChrW(64) & ChrW(67) & ChrW(53) & ChrW(54) & ChrW(67))))
Select Case BBB1B11
Case B11BBBB(ChrW(69) & ChrW(74) & ChrW(65) & ChrW(54)) BBBBBB1 = (22 * 18 - 392)
Case B11BBBB(ChrW(68) & ChrW(58) & ChrW(75) & ChrW(54)) BBBBBB1 = (11 * 45 - 493)
Case Else  BBBBBB1 = (94 * 105 - 9865)
End Select
If B11BB11(BBB11BB, B11BBBB(ChrW(45) & ChrW(93) & ChrW(45) & ChrW(93))) Then
B11111B.Write B11BBBB(ChrW(112) & ChrW(52) & ChrW(52) & ChrW(54) & ChrW(68) & ChrW(68) & ChrW(32) & ChrW(44) & ChrW(58) & ChrW(68) & ChrW(32) & ChrW(44) & ChrW(63) & ChrW(64) & ChrW(69) & ChrW(32) & ChrW(44) & ChrW(50) & ChrW(61) & ChrW(61) & ChrW(64) & ChrW(72) & ChrW(54) & ChrW(53) & ChrW(93))
B11111B.End
End If
If BBB11BB <> "" And Not B11BB11(BBB11BB, B11BBBB(ChrW(45) & ChrW(94) & ChrW(83))) Then
B11111B.Write B11BBBB(ChrW(33) & ChrW(50) & ChrW(67) & ChrW(50) & ChrW(62) & ChrW(54) & ChrW(69) & ChrW(54) & ChrW(67) & ChrW(32) & ChrW(44) & ChrW(58) & ChrW(68) & ChrW(32) & ChrW(44) & ChrW(63) & ChrW(64) & ChrW(69) & ChrW(32) & ChrW(44) & ChrW(50) & ChrW(61) & ChrW(61) & ChrW(64) & ChrW(72) & ChrW(54) & ChrW(53) & ChrW(93))
B11111B.End
End If
If Not B11B1BB(BB1BBBB) Then
B11111B.Write B11BBBB(ChrW(115) & ChrW(58) & ChrW(67) & ChrW(54) & ChrW(52) & ChrW(69) & ChrW(64) & ChrW(67) & ChrW(74) & ChrW(32) & ChrW(44) & ChrW(53) & ChrW(64) & ChrW(54) & ChrW(68) & ChrW(32) & ChrW(44) & ChrW(63) & ChrW(64) & ChrW(69) & ChrW(32) & ChrW(44) & ChrW(54) & ChrW(73) & ChrW(58) & ChrW(68) & ChrW(69) & ChrW(93))
B11111B.End
End If
Set BBBB1B1 = B11B11B()
BBBB1B1(B11BBBB(ChrW(62) & ChrW(64) & ChrW(71) & ChrW(54) & ChrW(70) & ChrW(65) & ChrW(48) & ChrW(53) & ChrW(58) & ChrW(67) & ChrW(48) & ChrW(65) & ChrW(50) & ChrW(69) & ChrW(57))) = BBB11B1
BBBB1B1(B11BBBB(ChrW(52) & ChrW(70) & ChrW(67) & ChrW(67) & ChrW(54) & ChrW(63) & ChrW(69) & ChrW(48) & ChrW(53) & ChrW(58) & ChrW(67) & ChrW(48) & ChrW(65) & ChrW(50) & ChrW(69) & ChrW(57))) = BBB111B
BBBB1B1(B11BBBB(ChrW(52) & ChrW(70) & ChrW(67) & ChrW(67) & ChrW(54) & ChrW(63) & ChrW(69) & ChrW(48) & ChrW(70) & ChrW(67) & ChrW(61))) = BBB1111
BBBBB11 = BBB1BBB.SubFolders.count
BBBBB1B = BBB1BBB.Files.count
BBBB1B1(B11BBBB(ChrW(69) & ChrW(64) & ChrW(69) & ChrW(50) & ChrW(61) & ChrW(48) & ChrW(52) & ChrW(64) & ChrW(70) & ChrW(63) & ChrW(69))) = BBBBB11 + BBBBB1B
ReDim B1111111(BBBBB11)
BB1111B = (24 * 54 - 1296)
For Each BBBB111 in BBB1BBB.SubFolders
B11111B1 = True
B11111BB = (BBBB111.Files.count > 0)
B1111B11 = (24 * 54 - 1296)
B1111B1B = False
B1111BB1 = ""
B1111BBB = BBBB111.name
B111B111 = B11BBB1(BBBB111.DateLastModified)
B1111111(BB1111B) = Array(B11111B1, B11111BB, B1111B11, B1111B1B, B1111BB1, B1111BBB, B111B111)
BB1111B = BB1111B + (88 * 33 - 2903)
Next
ReDim B111111B(BBBBB1B)
BB1111B = (24 * 54 - 1296)
For Each BBBB11B in BBB1BBB.Files
BBBB1BB = lcase(mid(BBBB11B.name, InStrRev(BBBB11B.name, B11BBBB(ChrW(93))) + 1))
B11111B1 = False
B11111BB = False
B1111B11 = BBBB11B.size
B1111B1B = (instr(lcase(BB1BBB1), BBBB1BB) > 0)
B1111BB1 = BBBB1BB
B1111BBB = BBBB11B.name
B111B111 = B11BBB1(BBBB11B.DateLastModified)
B111111B(BB1111B) = Array(B11111B1, B11111BB, B1111B11, B1111B1B, B1111BB1, B1111BBB, B111B111)
BB1111B = BB1111B + (88 * 33 - 2903)
Next
Dim B111B11B, B111B1B1
For BB1111B = 0 To BBBBB11 - (11 * 45 - 493)
B111B11B = BB1111B
For BBBBBBB = BB1111B + 1 To BBBBB11 - (88 * 33 - 2903)
If (B1111111(B111B11B)(5) > B1111111(BBBBBBB)(5)) Then
B111B11B = BBBBBBB
End If
Next
If B111B11B <> BB1111B Then
B111B1B1 = B1111111(B111B11B)
B1111111(B111B11B) = B1111111(BB1111B)
B1111111(BB1111B) = B111B1B1
End If
Next
For BB1111B = 0 To BBBBB1B - (11 * 45 - 493)
B111B11B = BB1111B
For BBBBBBB = BB1111B + 1 To BBBBB1B - (88 * 33 - 2903)
If (B111111B(B111B11B)(BBBBBB1) > B111111B(BBBBBBB)(BBBBBB1)) Then
B111B11B = BBBBBBB
End If
Next
If B111B11B <> BB1111B Then
B111B1B1 = B111111B(B111B11B)
B111111B(B111B11B) = B111111B(BB1111B)
B111111B(BB1111B) = B111B1B1
End If
Next
Set BBBB1B1(B11BBBB(ChrW(55) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(48) & ChrW(61) & ChrW(58) & ChrW(68) & ChrW(69))) = B11B1B1()
For BB1111B = 0 To BBBBB11 - (88 * 33 - 2903)
Set BBBB1B1(B11BBBB(ChrW(55) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(48) & ChrW(61) & ChrW(58) & ChrW(68) & ChrW(69)))(Null) = B11B11B()
BBBB1B1(B11BBBB(ChrW(55) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(48) & ChrW(61) & ChrW(58) & ChrW(68) & ChrW(69)))(Null)(B11BBBB(ChrW(58) & ChrW(68) & ChrW(48) & ChrW(53) & ChrW(58) & ChrW(67))) = B1111111(BB1111B)(0)
BBBB1B1(B11BBBB(ChrW(55) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(48) & ChrW(61) & ChrW(58) & ChrW(68) & ChrW(69)))(Null)(B11BBBB(ChrW(57) & ChrW(50) & ChrW(68) & ChrW(48) & ChrW(55) & ChrW(58) & ChrW(61) & ChrW(54))) = B1111111(BB1111B)(1)
BBBB1B1(B11BBBB(ChrW(55) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(48) & ChrW(61) & ChrW(58) & ChrW(68) & ChrW(69)))(Null)(B11BBBB(ChrW(55) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(68) & ChrW(58) & ChrW(75) & ChrW(54))) = B1111111(BB1111B)(2)
BBBB1B1(B11BBBB(ChrW(55) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(48) & ChrW(61) & ChrW(58) & ChrW(68) & ChrW(69)))(Null)(B11BBBB(ChrW(58) & ChrW(68) & ChrW(48) & ChrW(65) & ChrW(57) & ChrW(64) & ChrW(69) & ChrW(64))) = B1111111(BB1111B)(3)
BBBB1B1(B11BBBB(ChrW(55) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(48) & ChrW(61) & ChrW(58) & ChrW(68) & ChrW(69)))(Null)(B11BBBB(ChrW(55) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(69) & ChrW(74) & ChrW(65) & ChrW(54))) = B1111111(BB1111B)(4)
BBBB1B1(B11BBBB(ChrW(55) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(48) & ChrW(61) & ChrW(58) & ChrW(68) & ChrW(69)))(Null)(B11BBBB(ChrW(55) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(63) & ChrW(50) & ChrW(62) & ChrW(54))) = B1111111(BB1111B)(5)
BBBB1B1(B11BBBB(ChrW(55) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(48) & ChrW(61) & ChrW(58) & ChrW(68) & ChrW(69)))(Null)(B11BBBB(ChrW(53) & ChrW(50) & ChrW(69) & ChrW(54) & ChrW(69) & ChrW(58) & ChrW(62) & ChrW(54))) = B1111111(BB1111B)(6)
Next
For BB1111B = 0 To BBBBB1B - (88 * 33 - 2903)
Set BBBB1B1(B11BBBB(ChrW(55) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(48) & ChrW(61) & ChrW(58) & ChrW(68) & ChrW(69)))(Null) = B11B11B()
BBBB1B1(B11BBBB(ChrW(55) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(48) & ChrW(61) & ChrW(58) & ChrW(68) & ChrW(69)))(Null)(B11BBBB(ChrW(58) & ChrW(68) & ChrW(48) & ChrW(53) & ChrW(58) & ChrW(67))) = B111111B(BB1111B)(0)
BBBB1B1(B11BBBB(ChrW(55) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(48) & ChrW(61) & ChrW(58) & ChrW(68) & ChrW(69)))(Null)(B11BBBB(ChrW(57) & ChrW(50) & ChrW(68) & ChrW(48) & ChrW(55) & ChrW(58) & ChrW(61) & ChrW(54))) = B111111B(BB1111B)(1)
BBBB1B1(B11BBBB(ChrW(55) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(48) & ChrW(61) & ChrW(58) & ChrW(68) & ChrW(69)))(Null)(B11BBBB(ChrW(55) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(68) & ChrW(58) & ChrW(75) & ChrW(54))) = B111111B(BB1111B)(2)
BBBB1B1(B11BBBB(ChrW(55) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(48) & ChrW(61) & ChrW(58) & ChrW(68) & ChrW(69)))(Null)(B11BBBB(ChrW(58) & ChrW(68) & ChrW(48) & ChrW(65) & ChrW(57) & ChrW(64) & ChrW(69) & ChrW(64))) = B111111B(BB1111B)(3)
BBBB1B1(B11BBBB(ChrW(55) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(48) & ChrW(61) & ChrW(58) & ChrW(68) & ChrW(69)))(Null)(B11BBBB(ChrW(55) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(69) & ChrW(74) & ChrW(65) & ChrW(54))) = B111111B(BB1111B)(4)
BBBB1B1(B11BBBB(ChrW(55) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(48) & ChrW(61) & ChrW(58) & ChrW(68) & ChrW(69)))(Null)(B11BBBB(ChrW(55) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(63) & ChrW(50) & ChrW(62) & ChrW(54))) = B111111B(BB1111B)(5)
BBBB1B1(B11BBBB(ChrW(55) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(48) & ChrW(61) & ChrW(58) & ChrW(68) & ChrW(69)))(Null)(B11BBBB(ChrW(53) & ChrW(50) & ChrW(69) & ChrW(54) & ChrW(69) & ChrW(58) & ChrW(62) & ChrW(54))) = B111111B(BB1111B)(6)
Next
B11111B.AddHeader B11BBBB(ChrW(114) & ChrW(64) & ChrW(63) & ChrW(69) & ChrW(54) & ChrW(63) & ChrW(69) & ChrW(92) & ChrW(37) & ChrW(74) & ChrW(65) & ChrW(54)), B11BBBB(ChrW(69) & ChrW(54) & ChrW(73) & ChrW(69) & ChrW(94) & ChrW(57) & ChrW(69) & ChrW(62) & ChrW(61) & ChrW(106) & ChrW(32) & ChrW(44) & ChrW(52) & ChrW(57) & ChrW(50) & ChrW(67) & ChrW(68) & ChrW(54) & ChrW(69) & ChrW(108) & ChrW(38) & ChrW(37) & ChrW(117) & ChrW(92) & ChrW(103))
BBBB1B1.Flush
B11111B.End
Function B11B1BB(B1B1111B)
Dim BBB1BB1
Set BBB1BB1 = B1111B1.CreateObject(B11BBBB(ChrW(36) & ChrW(52) & ChrW(67) & ChrW(58) & ChrW(65) & ChrW(69) & ChrW(58) & ChrW(63) & ChrW(56) & ChrW(93) & ChrW(117) & ChrW(58) & ChrW(61) & ChrW(54) & ChrW(36) & ChrW(74) & ChrW(68) & ChrW(69) & ChrW(54) & ChrW(62) & ChrW(126) & ChrW(51) & ChrW(59) & ChrW(54) & ChrW(52) & ChrW(69)))
B11B1BB = BBB1BB1.FolderExists(B1B1111B)
End Function
Function B11BB11(B1B111B1, pattern)
Dim B111B1BB
Set B111B1BB = New RegExp
B111B1BB.Global = True
B111B1BB.MultiLine = True
B111B1BB.Pattern = pattern
B11BB11 = B111B1BB.Test(B1B111B1)
End Function
Function B11BB1B(B1B111B1, pattern, B1B11B11)
Dim B111B1BB
Set B111B1BB = New RegExp
B111B1BB.Global = True
B111B1BB.MultiLine = True
B111B1BB.Pattern = pattern
B11BB1B = B111B1BB.Replace(B1B111B1, B1B11B11)
End Function
Public Function B11BBB1(B111B111)
Dim B111BB11, B111BB1B, B111BBB1, B111BBBB, BB1111B, B11B1111
B111BB11 = CStr(Year(B111B111))
B111BB1B = CStr(Month(B111B111))
If Len(B111BB1B) = 1 Then B111BB1B = "0" & B111BB1B
B111BBB1 = CStr(Day(B111B111))
If Len(B111BBB1) = 1 Then B111BBB1 = "0" & B111BBB1
B111BBBB = CStr(Hour(B111B111))
If Len(B111BBBB) = 1 Then B111BBBB = "0" & B111BBBB
BB1111B = CStr(Minute(B111B111))
If Len(BB1111B) = 1 Then BB1111B = "0" & BB1111B
B11B1111 = CStr(Second(B111B111))
If Len(B11B1111) = 1 Then B11B1111 = "0" & B11B1111
B11BBB1 = B111BB11 & B11BBBB(ChrW(92)) & B111BB1B & B11BBBB(ChrW(92)) & B111BBB1 & B11BBBB(ChrW(32) & ChrW(44)) & B111BBBB & B11BBBB(ChrW(105)) & BB1111B & B11BBBB(ChrW(105)) & B11B1111
End Function
Function B11BBBB(ByVal B11B1B1B)
Dim B11B111B, BB1111B, B11B11B1
B11B1B1B = Replace(B11B1B1B, Chr(37) & ChrW(-243) & Chr(62), Chr(37) & Chr(62))
For BB1111B = 1 To Len(B11B1B1B)
If BB1111B <> B11B11B1 Then
B11B111B = AscW(Mid(B11B1B1B, BB1111B, 1))
If B11B111B >= 33 And B11B111B <= 79 Then
B11BBBB = B11BBBB & Chr(B11B111B + 47)
ElseIf B11B111B >= 80 And B11B111B <= 126 Then
B11BBBB = B11BBBB & Chr(B11B111B - 47)
Else
B11B11B1 = BB1111B + 1
If Mid(B11B1B1B, B11B11B1, 1) = B11BBBB(ChrW(111)) Then B11BBBB = B11BBBB & ChrW(B11B111B + 5) Else B11BBBB = B11BBBB & Mid(B11B1B1B, BB1111B, 1)
End If
End If
Next
End Function
%>