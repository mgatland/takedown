VERSION 5.00
Begin VB.Form frm_game_brief 
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   " "
   ClientHeight    =   5115
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7320
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   12
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   341
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   488
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Com_opt 
      Caption         =   "Eat the cake!"
      Height          =   420
      Index           =   3
      Left            =   240
      TabIndex        =   5
      Top             =   4680
      Width           =   6735
   End
   Begin VB.CommandButton Com_opt 
      Caption         =   "Go in solo!"
      Height          =   420
      Index           =   0
      Left            =   240
      TabIndex        =   2
      Top             =   3240
      Width           =   6735
   End
   Begin VB.CommandButton Com_opt 
      Caption         =   "Teamwork!"
      Height          =   420
      Index           =   2
      Left            =   240
      TabIndex        =   4
      Top             =   4200
      Width           =   6735
   End
   Begin VB.CommandButton Com_opt 
      Caption         =   "Activate the transponder"
      Height          =   420
      Index           =   1
      Left            =   240
      TabIndex        =   3
      Top             =   3720
      Width           =   6735
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Continue"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   5520
      TabIndex        =   0
      Top             =   4320
      Width           =   1575
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Mission briefing."
      ForeColor       =   &H00FFFFFF&
      Height          =   4140
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   7005
      WordWrap        =   -1  'True
   End
End
Attribute VB_Name = "frm_game_brief"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim mytext(0 To 2) As String
Dim number As Byte
Dim linelength As Integer
Dim lines As Integer
'Dim pressOption(0 To 1) As String
Dim pressFlag(0 To 3) As Integer
Dim pressFlag2(0 To 3) As Integer
Dim pressType(0 To 3) As Byte


Public Sub givebrief(ByVal txt0 As String, ByVal txt1 As String, ByVal txt2 As String)

For a = 0 To UBound(pressFlag)
    Com_opt(a).Caption = ""
Next a

mytext(0) = txt0: mytext(1) = txt1: mytext(2) = txt2
number = 0
changetext
End Sub

Private Sub Com_opt_Click(Index As Integer)

'0 - toggle flag
'1 - upgrade weapon, slot

Select Case pressType(Index)
    Case 0: frm_game.brief_toggleflag val(pressFlag(Index))
    Case 1: frm_game.brief_upgrade val(pressFlag(Index)), val(pressFlag2(Index))
End Select
         
changetext
End Sub

Private Sub Command1_Click()
changetext
End Sub

Sub changetext()
  Dim a As Integer, b As String * 1, c As Integer
  Dim bOptions As Boolean
  
  For c = 0 To UBound(pressFlag)
  'pressOption(c) = ""
  Com_opt(c).Caption = ""
  pressFlag(c) = -1
  pressFlag2(c) = -1
  pressType(c) = 0
  Next c
  
  linelength = 0
  lines = 0
  i = number
  
  If i > UBound(mytext) Then Unload Me: Exit Sub
  If mytext(i) = "" Then Unload Me: Exit Sub
  
  Label1 = ""
    For a = 1 To Len(mytext(i))
    b = Mid$(mytext(i), a, 1)
    If b = "^" Then
      a = a + 1
      b = Mid$(mytext(i), a, 1)
      Select Case b
      Case "1": Label1 = Label1 + Chr$(10): linelength = 0: lines = lines + 1
      Case "2": Label1 = Label1 + Chr$(10) + Chr$(10): linelength = 0: lines = lines + 2
      Case "r": Label1.ForeColor = RGB(255, 100, 100)
      Case "g": Label1.ForeColor = RGB(100, 255, 100)
      Case "b": Label1.ForeColor = RGB(100, 100, 255)
      Case "w": Label1.ForeColor = RGB(255, 255, 255)
      Case "[": GoSub buttontext
      End Select
      Else:
            Label1 = Label1 + b
            linelength = linelength + 1
    End If
    If linelength >= 60 Then linelength = 0: lines = lines + 1
  Next a

  'Height = (lines * 260) + 1000 + 200
  'Command1.Top = (lines * 260) + 200
  number = number + 1
  
  For a = 0 To UBound(pressFlag)
  If Com_opt(a).Caption <> "" Then bOptions = True
  Next a
  
  If bOptions = False Then
      Command1.Visible = True
      For a = 0 To UBound(pressFlag)
      Com_opt(a).Visible = False
      Next a
    Else
      Command1.Visible = False
      For a = 0 To UBound(pressFlag)
        If Com_opt(a).Caption <> "" Then Com_opt(a).Visible = True Else Com_opt(a).Visible = False
      Next a
  End If
  
  Exit Sub
  
buttontext:
   a = a + 1
   c = val(Mid$(mytext(i), a, 1))

   
   Do
    a = a + 1
    b = Mid$(mytext(i), a, 1)
    If b = "]" Then
      Return
      
    ElseIf b = "^" Then
        If pressFlag(c) = -1 Then
            a = a + 2
            pressFlag(c) = val(Mid$(mytext(i), a, 2))
        Else
             a = a + 2
            pressFlag2(c) = val(Mid$(mytext(i), a, 2))
        End If
    
    ElseIf b = "{" Then
    a = a + 2
    pressType(c) = val(Mid$(mytext(i), a, 2))
    
      Else:
            Com_opt(c).Caption = Com_opt(c).Caption + b
     End If
Loop While a < Len(mytext(i))
Return


End Sub


