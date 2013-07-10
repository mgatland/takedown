VERSION 5.00
Begin VB.Form Frm_episode 
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "TakeDown - Choose episode"
   ClientHeight    =   3750
   ClientLeft      =   5445
   ClientTop       =   5055
   ClientWidth     =   5280
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3750
   ScaleWidth      =   5280
   Begin VB.ComboBox Comb_epi 
      Height          =   315
      Left            =   3000
      TabIndex        =   3
      Text            =   "Stall01"
      Top             =   120
      Width           =   1935
   End
   Begin VB.CommandButton Com_cancel 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   495
      Left            =   3840
      TabIndex        =   1
      Top             =   3120
      Width           =   1095
   End
   Begin VB.CommandButton Com_Load 
      Caption         =   "Load"
      Default         =   -1  'True
      Height          =   495
      Left            =   240
      TabIndex        =   0
      Top             =   3120
      Width           =   1095
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Doom!"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0FFFF&
      Height          =   375
      Left            =   120
      TabIndex        =   5
      Top             =   600
      Width           =   5055
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   1935
      Left            =   120
      TabIndex        =   4
      Top             =   1080
      Width           =   5055
   End
   Begin VB.Label label1 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Choose an episode"
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
      TabIndex        =   2
      Top             =   120
      Width           =   2415
   End
End
Attribute VB_Name = "Frm_episode"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public done As Boolean
Dim desc() As String

Private Sub Com_cancel_Click()
Unload Me
End Sub

Private Sub Com_Load_Click()

If dir(App.path & "\" & Comb_epi.text & ".tdm") = "" Then MsgBox "Episode not found": Exit Sub

Dim tempVal As String
Dim a As Integer, b As Integer
done = True
'Do something to load the correct modPath


save.mission = 1
save.health = 100
save.face = 1
save.x = 0
save.y = 0
save.material = 0
save.cGun(0) = 0
save.cGun(1) = 1
save.face = 1
    For a = 0 To UBound(save.flag)
        save.flag(a) = 0
    Next a
    
    '
    For a = 0 To wepTop
    For b = 0 To upgTop
        save.gunMod(a, b) = 0
    Next b, a
    
    For a = 0 To UBound(save.misTxt)
        save.misTxt(a) = False
    Next a
    
save.episode = Comb_epi.text

'misTxt
Open App.path & "\" & save.episode & ".tdm" For Input As #1
     Do
     If EOF(1) = True Then Exit Do
     Input #1, tempVal
        If Mid$(LCase$(tempVal), 1, 7) = "[notes]" Then
        For a = 0 To UBound(misTxt)
        Input #1, misTxt(a)
        Next a
        Exit Do
        End If
     
     Loop
Close #1

Unload Me
End Sub

Private Sub Comb_epi_Change()
Dim a As Integer
Dim valid As Boolean

For a = 0 To Comb_epi.ListCount - 1
If LCase$(Comb_epi.text) = LCase$(Comb_epi.List(a)) Then
   Label2.Caption = desc(1, a)
   Label3.Caption = desc(0, a)
   valid = True
   Exit For
   End If
Next a

If valid = False Then
        If dir(App.path & "\" & Comb_epi.text & ".tdm") <> "" Then
        valid = True
        Label2.Caption = "No description": Label3.Caption = "Custom Episode"
    Else
        Label2.Caption = "": Label3.Caption = "None"
    End If
End If

End Sub

Private Sub Comb_epi_Click()
Comb_epi_Change 'FIX THIS
End Sub

Private Sub Form_Load()
Dim epi As String
Dim i As Integer

    If dir(App.path & "\missions.tdm") <> "" Then

Open App.path & "\missions.tdm" For Input As #1
Input #1, i
ReDim desc(1, i - 1) As String

i = 0
Do While EOF(1) = False
Input #1, epi
Comb_epi.List(i) = epi
Input #1, desc(0, i)
Input #1, desc(1, i)
i = i + 1
Loop
Close #1

End If

Comb_epi.text = Comb_epi.List(0)
End Sub

