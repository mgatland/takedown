VERSION 5.00
Begin VB.Form frm_help 
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Takedown - Help"
   ClientHeight    =   6585
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7920
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Haettenschweiler"
      Size            =   15
      Charset         =   0
      Weight          =   500
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6585
   ScaleWidth      =   7920
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command1 
      Cancel          =   -1  'True
      Caption         =   "OK"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   6600
      TabIndex        =   0
      Top             =   5880
      Width           =   1095
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      ForeColor       =   &H00FFFFFF&
      Height          =   2295
      Left            =   4000
      TabIndex        =   3
      Top             =   120
      Width           =   3015
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      ForeColor       =   &H00FFFFFF&
      Height          =   2295
      Left            =   2000
      TabIndex        =   2
      Top             =   120
      Width           =   3015
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      ForeColor       =   &H00FFFFFF&
      Height          =   6375
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   7695
   End
End
Attribute VB_Name = "frm_help"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Unload Me
End Sub



Private Sub Form_Load()
Label2.Caption = "W - Up" + Chr(13) + "A - Left" + Chr(13) + "M - Fire" + Chr(13) + Chr(13) + Chr(13)

Label1.Caption = "S - Down" + Chr(13) + "D - Right" + Chr(13) + "N - Alt Fire"
Label3.Caption = "X - Show\Cycle Notes" + Chr(13) + "Shift - strafe" + Chr(13) + "Team: F - Follow, G - Stop"

Label2.Caption = Label2.Caption + "Damage taken is displayed as a green bar. A light shows the status of your weapon - reloading, ready or overheated." + Chr(13) + Chr(13)
Label2.Caption = Label2.Caption + "Your weapon's heat is shown to the right. Firing too rapidly or taking damage will make it overheat. While your weapon is above 100% heat it will not be able to fire." + Chr(13) + Chr(13)
Label2.Caption = Label2.Caption + "On the bottom left of the screen you may be given information helping you to complete the mission." + Chr(13) + Chr(13)
Label2.Caption = Label2.Caption + "Avoiding projectiles is an important skill. When dodging, concentrate on the area around yourself and carefully move out of the way of incoming projectiles."
End Sub
