Attribute VB_Name = "basParts"

'////////////////////////////////////////////////////////////////////////////////////////
'���@�O�FbasParts
'���@���F
'�쐬���F2016/02/10 sakaguchi
'////////////////////////////////////////////////////////////////////////////////////////

Option Explicit


'////////////////////////////////////////////////////////////////////////////////////////
'���@�O�FCalcAge
'���@���FByRef lngY�@�N��
'�@�@�@�FByRef lngM�@����
'�@�@�@�FByVal dtBirthday �a����
'�@�@�@�FByVal dtKensaday ������
'�߂�l�F�ʏ�0(�G���[���G���[�ԍ�)�@�N��A����
'�쐬���F2016/02/08 sakaguchi
'////////////////////////////////////////////////////////////////////////////////////////
Public Function CalcAge(ByRef lngY As Long, ByRef lngM As Long, ByVal dtBirthday As Date, ByVal dtKensaday As Date) As Long
  Dim lngMwork As Long
  
  On Error GoTo lineErr:

  CalcAge = 0
  lngY = 0
  lngM = 0
  
  '/// �N��v�Z
  lngY = DateDiff("yyyy", dtBirthday, dtKensaday)
  If Format(dtKensaday, "mmdd") < Format(dtBirthday, "mmdd") Then lngY = lngY - 1
  
  '/// ����v�Z
  lngMwork = DateDiff("m", dtBirthday, dtKensaday)
  lngMwork = lngMwork Mod 12
  If Format(dtKensaday, "dd") < Format(dtBirthday, "dd") Then
    If 0 < lngMwork Then lngMwork = lngMwork - 1 Else lngMwork = 11  '/ -1�����łȂ�11������
  End If
  lngM = lngMwork
    
  Exit Function
lineErr:
  CalcAge = Err.Number
End Function


'////////////////////////////////////////////////////////////////////////////////////////
'���@�O�FGetLngItem
'���@���FByRef colCollection �Ώ�Long�^�R���N�V����
'�@�@�@�FByVal strKey        ���j�[�N�L�[
'�߂�l�FKsy�ɑ΂���Item���Ȃ����-1 �����Item�̐��l
'�쐬���F2016/02/10 sakaguchi
'////////////////////////////////////////////////////////////////////////////////////////
Public Function GetLngItem(ByRef colCollection As collection, ByVal strKey As String) As Long
  GetLngItem = -1
  On Error Resume Next
  GetLngItem = colCollection.Item(strKey)
  On Error GoTo 0
End Function


'////////////////////////////////////////////////////////////////////////////////////////
'���@�O�FAddLngItem
'���@���FByRef colCollection �Ώ�Long�^�R���N�V����
'�@�@�@�FByVal lngItem       Long�^Item
'�@�@�@�FByVal strKey        ���j�[�N�L�[
'�߂�l�F�Ȃ�
'�쐬���F2016/02/10 sakaguchi
'////////////////////////////////////////////////////////////////////////////////////////
Public Sub AddLngItem(ByRef colCollection As collection, ByVal lngItem As Long, ByVal strKey)
  On Error Resume Next
  If colCollection Is Nothing Then Set colCollection = New collection
  colCollection.Add lngItem, strKey
  On Error GoTo 0
End Sub


'////////////////////////////////////////////////////////////////////////////////////////
'���@�O�FSetIsNumeric
'���@���FByVal strValue
'�߂�l�F���l������Ȃ琔�l�@�����łȂ��Ȃ�0
'�쐬���F2016/02/10 sakaguchi
'////////////////////////////////////////////////////////////////////////////////////////
Public Function SetIsNumeric(ByVal strValue As String) As Double
  If IsNumeric(strValue) Then
    SetIsNumeric = strValue
  Else
    SetIsNumeric = 0
  End If
End Function

Private Sub test()
  Dim y As Long
  Dim m As Long
  Call CalcAge(y, m, "1978/2/16", "2016/2/15")
  Debug.Print y & " " & m
  
  Call CalcAge(y, m, "2014/2/15", "2016/2/15")
  Debug.Print y & " " & m
  
  Call CalcAge(y, m, "2016/11/15", "2016/12/15")
  Debug.Print y & " " & m
End Sub
