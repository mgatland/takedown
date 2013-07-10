VERSION 5.00
Begin VB.Form frm_load 
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "TakeDown - Load mission"
   ClientHeight    =   4155
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6810
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4155
   ScaleWidth      =   6810
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton com_save 
      Caption         =   "Save"
      Height          =   495
      Left            =   360
      TabIndex        =   1
      Top             =   2760
      Width           =   1095
   End
   Begin VB.CommandButton Command2 
      Cancel          =   -1  'True
      Caption         =   "OK"
      Height          =   495
      Left            =   5400
      TabIndex        =   3
      Top             =   3480
      Width           =   1095
   End
   Begin VB.CommandButton com_load 
      Caption         =   "Load"
      Height          =   495
      Left            =   360
      TabIndex        =   2
      Top             =   3480
      Width           =   1095
   End
   Begin VB.OptionButton Opt_save 
      BackColor       =   &H00000000&
      Caption         =   "Slot 1"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   0
      Left            =   240
      TabIndex        =   5
      Top             =   720
      Width           =   2055
   End
   Begin VB.OptionButton Opt_save 
      BackColor       =   &H00000000&
      Caption         =   "Slot 2"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   1
      Left            =   240
      TabIndex        =   6
      Top             =   1080
      Width           =   2055
   End
   Begin VB.OptionButton Opt_save 
      BackColor       =   &H00000000&
      Caption         =   "Slot 3 "
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   2
      Left            =   240
      TabIndex        =   7
      Top             =   1440
      Width           =   2055
   End
   Begin VB.OptionButton Opt_save 
      BackColor       =   &H00000000&
      Caption         =   "Slot 4"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   3
      Left            =   240
      TabIndex        =   8
      Top             =   1800
      Width           =   2055
   End
   Begin VB.OptionButton Opt_save 
      BackColor       =   &H00000000&
      Caption         =   "Slot 5"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   4
      Left            =   240
      TabIndex        =   9
      Top             =   2160
      Width           =   2055
   End
   Begin VB.Label label1 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Select a Save game slot"
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
      Height          =   2655
      Left            =   2640
      TabIndex        =   0
      Top             =   600
      Width           =   3855
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Save or Load the game"
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
      TabIndex        =   4
      Top             =   120
      Width           =   2895
   End
End
Attribute VB_Name = "frm_load"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim sslot(0 To 4) As savegame
Dim savenum As Integer

Private Sub com_save_Click()
'Dim suggestTxt As String
Dim i As Integer, egDescription As String
If save.episode = "" Or save.mission = 0 Then MsgBox "No game to save!": Exit Sub
'  If sslot(savenum).text <> "" Then
'        suggestTxt = sslot(savenum).text
'     Else
'        suggestTxt = Str$(Date)
'  End If
If savenum < 0 Then MsgBox "Choose a save slot!": Exit Sub
If sslot(savenum).text <> "EMPTY" And sslot(savenum).text <> "" Then egDescription = sslot(savenum).text Else egDescription = "Save Description"
savetext = InputBox("Enter save description", "Save game", egDescription)
If savetext = "" Then
  MsgBox "Game has not been saved"
  Exit Sub
End If

Opt_save(savenum).Caption = Mid$(savetext, 1, 18)

        sslot(savenum).episode = save.episode
        sslot(savenum).mission = save.mission
        sslot(savenum).text = savetext
        sslot(savenum).x = save.x
        sslot(savenum).y = save.y
        sslot(savenum).face = save.face
        sslot(savenum).health = save.health

        
        'this all isn't implimented
        ''''''''''''''
        
        ' cGun, gunMod, material
        For a = 0 To 1
        sslot(savenum).cGun(a) = save.cGun(a)
        Next a
        For a = 0 To wepTop
        For b = 0 To upgTop
        sslot(savenum).gunMod(a, b) = save.gunMod(a, b)
        Next b, a
        sslot(savenum).material = save.material
        
        '''''''''''''''''''''''''''''''
        
        'flags
        For a = 0 To flagTop
        sslot(savenum).flag(a) = save.flag(a)
        Next a

Open App.path & "\saves.tds" For Output As #1
     For i = 0 To 4
        Print #1, sslot(i).episode
        Print #1, sslot(i).mission
        Print #1, sslot(i).text
        Print #1, sslot(i).x
        Print #1, sslot(i).y
        Print #1, sslot(i).face
        Print #1, sslot(i).health
        
        ' cGun, gunMod, material
        For a = 0 To 1
        Print #1, sslot(i).cGun(a)
        Next a
        For a = 0 To wepTop
        For b = 0 To upgTop
        Print #1, sslot(i).gunMod(a, b)
        Next b, a
        Print #1, sslot(i).material
        
        'flags
        For a = 0 To UBound(sslot(i).flag) ' 29
        Print #1, sslot(i).flag(a)
        Next a
        
        'misTxts
        For a = 0 To UBound(sslot(i).misTxt) ' 19
        Print #1, sslot(i).misTxt(a)
        Next a
        
     Next
     
Close #1

Label1.Caption = "Episode: " + sslot(savenum).episode + Chr$(10) + "Mission: " + Str$(sslot(savenum).mission) + Chr$(10) + Chr$(10) + sslot(savenum).text

End Sub

Private Sub Com_Load_Click()

If savenum < 0 Then Exit Sub
If sslot(savenum).episode <> "" Then

        save.episode = sslot(savenum).episode
        save.mission = sslot(savenum).mission
        save.text = sslot(savenum).text
        save.x = sslot(savenum).x
        save.y = sslot(savenum).y
        save.face = sslot(savenum).face
        save.health = sslot(savenum).health
        
        ' cGun, gunMod, material
        For a = 0 To 1
        save.cGun(a) = sslot(savenum).cGun(a)
        Next a
        For a = 0 To wepTop
        For b = 0 To upgTop
        save.gunMod(a, b) = sslot(savenum).gunMod(a, b)
        Next b, a
        save.material = sslot(savenum).material
        
        'flags
        For a = 0 To UBound(sslot(savenum).flag) '29
        save.flag(a) = sslot(savenum).flag(a)
        Next a
        
        'misTxts
        For a = 0 To UBound(sslot(savenum).misTxt)  '19
        save.misTxt(a) = sslot(savenum).misTxt(a)
        Next a
    
    frm_menu.changetext 3
    frm_menu.cmdContinue.Enabled = True

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
End If
End Sub

Private Sub Command2_Click()
Unload Me
End Sub

Private Sub Form_Load()
Dim a As Integer, b As Integer
If dir(App.path & "\saves.tds") = "" Then Exit Sub

Open App.path & "\saves.tds" For Input As #1
     For savenum = 0 To 4
        Input #1, sslot(savenum).episode
        Input #1, sslot(savenum).mission
        Input #1, sslot(savenum).text
        If sslot(savenum).text = "" Then Opt_save(savenum).Caption = "EMPTY" Else Opt_save(savenum).Caption = Mid$(sslot(savenum).text, 1, 18)
        Input #1, sslot(savenum).x
        Input #1, sslot(savenum).y
        Input #1, sslot(savenum).face
        Input #1, sslot(savenum).health
        
        ' cGun, gunMod, material
        For a = 0 To 1
        Input #1, sslot(savenum).cGun(a)
        Next a
        For a = 0 To wepTop
        For b = 0 To upgTop
        Input #1, sslot(savenum).gunMod(a, b)
        Next b, a
        Input #1, sslot(savenum).material
        
        'flags
        For a = 0 To UBound(sslot(savenum).flag) '29
        Input #1, sslot(savenum).flag(a)
        Next a
        'mission texts
        For a = 0 To UBound(sslot(savenum).misTxt) '19
        Input #1, sslot(savenum).misTxt(a)
        Next a
        
     Next
     
Close #1
       
savenum = -1
       
End Sub

Private Sub Opt_save_Click(Index As Integer)
savenum = Index
Label1.Caption = "Episode: " + sslot(Index).episode + Chr$(10) + "Mission: " + Str$(sslot(Index).mission) + Chr$(10) + Chr$(10)
If sslot(Index).text = "" Then Label1.Caption = Label1.Caption + "EMPTY" Else Label1.Caption = Label1.Caption + sslot(Index).text
End Sub
