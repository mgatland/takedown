VERSION 5.00
Begin VB.Form frm_options 
   BackColor       =   &H00000000&
   Caption         =   "TakeDown - Options"
   ClientHeight    =   4770
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7395
   ControlBox      =   0   'False
   ForeColor       =   &H00FFFFFF&
   LinkTopic       =   "Form1"
   ScaleHeight     =   4770
   ScaleWidth      =   7395
   StartUpPosition =   3  'Windows Default
   Begin VB.CheckBox chkMusic 
      BackColor       =   &H00000000&
      Caption         =   "Music"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   300
      Left            =   240
      TabIndex        =   5
      Top             =   1560
      Value           =   1  'Checked
      Width           =   2055
   End
   Begin VB.CheckBox chkBorder 
      BackColor       =   &H00000000&
      Caption         =   "Border"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   300
      Left            =   240
      TabIndex        =   4
      Top             =   1200
      Value           =   1  'Checked
      Width           =   2055
   End
   Begin VB.TextBox Text_FRate 
      Height          =   285
      Left            =   1920
      TabIndex        =   3
      Text            =   "40"
      Top             =   600
      Width           =   495
   End
   Begin VB.CommandButton Com_ok 
      Cancel          =   -1  'True
      Caption         =   "OK"
      Height          =   495
      Left            =   6240
      TabIndex        =   0
      Top             =   4080
      Width           =   975
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "ADVANCED OPTIONS"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   615
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   7215
   End
   Begin VB.Label lab_framerate 
      BackStyle       =   0  'Transparent
      Caption         =   "Frame delay:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   600
      Width           =   1815
   End
End
Attribute VB_Name = "frm_options"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Public bnetworked As Boolean

'Public Function networked(c As Boolean) As Boolean
'bnetworked = c
'If c = True Then lblMultiplayer.Caption = "MULTIPLAYER - CONNECTED" Else lblMultiplayer.Caption = "MULTIPLAYER"
'
'Dim tempVal As String
'Dim a As Integer, b As Integer
''Do something to load the correct modPath
'
'save.mission = 1
'save.health = 100
'save.face = 1
'save.x = 0
'save.y = 0
'save.material = 0
'save.cGun(0) = 0
'save.cGun(1) = 1
'save.face = 1
'    For a = 0 To UBound(save.flag)
'        save.flag(a) = 0
'    Next a
    
'    '
'    For a = 0 To wepTop
'    For b = 0 To upgTop
'        save.gunMod(a, b) = 0
'    Next b, a
    
'    For a = 0 To UBound(save.misTxt)
'        save.misTxt(a) = False
'    Next a
    
'save.episode = "01"
'
''misTxt
'Open App.path & "\" & save.episode & ".tdm" For Input As #1
'     Do
'     If EOF(1) = True Then Exit Do
'     Input #1, tempVal
'        If Mid$(LCase$(tempVal), 1, 7) = "[notes]" Then
'        For a = 0 To UBound(misTxt)
'        Input #1, misTxt(a)
'        Next a
'        Exit Do
'        End If
'
'     Loop
'Close #1

'
'End Function

Private Sub chkBorder_Click()
bBackground = chkBorder.Value
End Sub

Private Sub chkMusic_Click()
bMusic = chkMusic.Value
End Sub

'Private Sub cmdDC_Click()
'MsgBox "Disconnect not supported"
'connectEnd
'End Sub

'Private Sub cmdHost_Click()'
'
'frm_game.Winsock1.LocalPort = 5167
'frm_game.Winsock1.Listen
'connectTry

'End Sub

'Private Sub cmdJoin_Click()
'
'frm_game.Winsock1.Connect txtIP.text, 5167
'connectTry
'
'End Sub

Private Sub Com_ok_Click()
Unload Me
End Sub

Private Sub Form_Load()
Text_FRate = frm_game.TickDifference
If bBackground = True Then chkBorder.Value = 1 Else chkBorder.Value = 0
If bMusic = True Then chkMusic.Value = 1 Else chkMusic.Value = 0
End Sub


Private Sub Text_Frate_Change()
frm_game.TickDifference = val(Text_FRate.text)
End Sub

'Private Sub connectTry()
'
'txtIP.Enabled = False
'txtPW.Enabled = False
'cmdHost.Enabled = False
'cmdJoin.Enabled = False
'cmdDC.Enabled = True
'
'End Sub

'Private Sub connectEnd()
'
'txtIP.Enabled = True
'txtPW.Enabled = True
'cmdHost.Enabled = True
'cmdJoin.Enabled = True
'cmdDC.Enabled = False
'
'End Sub
