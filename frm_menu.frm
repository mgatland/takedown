VERSION 5.00
Begin VB.Form frm_menu 
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "TakeDown - MAIN MENU"
   ClientHeight    =   5295
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   7125
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   12
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H00FFFFFF&
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5295
   ScaleWidth      =   7125
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Com_options 
      BackColor       =   &H00808080&
      Caption         =   "Options"
      BeginProperty Font 
         Name            =   "Haettenschweiler"
         Size            =   21.75
         Charset         =   0
         Weight          =   500
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   120
      MaskColor       =   &H00808080&
      TabIndex        =   5
      Top             =   4200
      Width           =   1575
   End
   Begin VB.CommandButton CmdNew 
      BackColor       =   &H00808080&
      Caption         =   "New Game"
      BeginProperty Font 
         Name            =   "Haettenschweiler"
         Size            =   21.75
         Charset         =   0
         Weight          =   500
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   120
      MaskColor       =   &H00808080&
      TabIndex        =   7
      Top             =   2040
      Width           =   1575
   End
   Begin VB.CommandButton Com_quit 
      BackColor       =   &H00808080&
      Cancel          =   -1  'True
      Caption         =   "Exit Game"
      BeginProperty Font 
         Name            =   "Haettenschweiler"
         Size            =   21.75
         Charset         =   0
         Weight          =   500
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   120
      MaskColor       =   &H00808080&
      TabIndex        =   6
      Top             =   4680
      Width           =   1575
   End
   Begin VB.CommandButton Com_load 
      BackColor       =   &H00808080&
      Caption         =   "Load/Save"
      BeginProperty Font 
         Name            =   "Haettenschweiler"
         Size            =   21.75
         Charset         =   0
         Weight          =   500
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   120
      MaskColor       =   &H00808080&
      TabIndex        =   3
      Top             =   3000
      Width           =   1575
   End
   Begin VB.CommandButton cmdContinue 
      BackColor       =   &H00808080&
      Caption         =   "Continue"
      Default         =   -1  'True
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Haettenschweiler"
         Size            =   21.75
         Charset         =   0
         Weight          =   500
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   120
      MaskColor       =   &H00808080&
      TabIndex        =   2
      Top             =   2520
      Width           =   1575
   End
   Begin VB.CommandButton Com_help 
      BackColor       =   &H00808080&
      Caption         =   "Help"
      BeginProperty Font 
         Name            =   "Haettenschweiler"
         Size            =   21.75
         Charset         =   0
         Weight          =   500
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   120
      MaskColor       =   &H00808080&
      TabIndex        =   4
      Top             =   3720
      Width           =   1575
   End
   Begin VB.Label Labinit 
      BackColor       =   &H00000000&
      BackStyle       =   0  'Transparent
      Caption         =   "LOADING"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   825
      Left            =   240
      TabIndex        =   8
      Top             =   720
      Width           =   6735
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Copyright (c) 2002 Matthew Gatland"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   2520
      TabIndex        =   1
      Top             =   4920
      Width           =   4575
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Intro text goes here."
      BeginProperty Font 
         Name            =   "Haettenschweiler"
         Size            =   15
         Charset         =   0
         Weight          =   500
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   5295
      Left            =   2400
      TabIndex        =   0
      Top             =   120
      Width           =   4695
   End
   Begin VB.Image Image1 
      BorderStyle     =   1  'Fixed Single
      Height          =   1905
      Left            =   0
      Picture         =   "frm_menu.frx":0000
      Stretch         =   -1  'True
      Top             =   0
      Width           =   1905
   End
End
Attribute VB_Name = "frm_menu"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Com_help_Click()
frm_help.Show 1
End Sub

Private Sub Com_Load_Click()
frm_load.Show 1
If mission > 1 Then cmdContinue.SetFocus
End Sub

Private Sub cmdNew_Click()

Frm_episode.done = False
Frm_episode.Show 1

If Frm_episode.done = True Then
  cmdContinue.Enabled = True
  cmdContinue.SetFocus
  frm_game.game_startup
End If
  
End Sub

Private Sub Com_options_Click()

'frm_options.networked False
frm_options.Show 1
If bBackground = True And frm_blank.Visible = False Then frm_blank.Show: frm_menu.Show
If bBackground = False And frm_blank.Visible = True Then frm_blank.Hide

'If frm_options.bnetworked = True Then
'  cmdContinue.Enabled = True
'  cmdContinue.SetFocus
'  frm_game.game_startup
'End If

End Sub

Private Sub Com_quit_Click()
Unload Me
End Sub

Private Sub cmdContinue_Click()
frm_game.game_startup
End Sub

'Private Sub Form_Activate()
'Unload frm_game
'gameon = False
'running = False
'End Sub

Private Sub Form_Load()
If bBackground = True Then frm_blank.Show
changetext 1
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)

 If UnloadMode = 1 Or UnloadMode = 0 Then
  If MsgBox("Are you sure you want to quit TakeDown? (If you have not saved, your current game will be lost.)", vbYesNo, "Exit TakeDown") = vbYes Then Cancel = 0 Else Cancel = 1
 End If

End Sub

Private Sub Form_Unload(Cancel As Integer)
Unload frm_game
End
End Sub

Public Sub changetext(ByVal a As Integer)
Select Case a
 Case 1:
         Label2 = "<TAKEDOWN>" + Chr(13) + Chr(13)
         Label2 = Label2 + "In the year 2170, man has finally triumphed. With the combined power of the entire world, the UNITY has ended famine, disease and war." + Chr$(10)
         Label2 = Label2 + "But some resist. Hungry for power, factions have formed to throw mankind back into conflict." + Chr$(10)
         Label2 = Label2 + "Stall have declared themselves independant from the UNITY and are arming themselves with illegal equipment." + Chr$(10)
         Label2 = Label2 + "Peace is no longer an option. The rebel uprising must be taken down."
Case 2:
         Label2 = "<TAKEDOWN>" + Chr(13) + Chr(13)
         Label2 = Label2 + "Click 'Continue' to continue your game from the last mission."
         'cmdContinue.SetFocus
Case 3:  Label2 = "<TAKEDOWN>" + Chr(13) + Chr(13)
         Label2 = Label2 + "Click 'Continue' to continue the saved game that you have loaded."
         'cmdContinue.SetFocus
Case 4:  Label2 = "<TAKEDOWN>" + Chr(13) + Chr(13)
         Label2 = Label2 + "Click 'New Game' to begin a new game."
         'cmdNew.SetFocus


End Select

End Sub

