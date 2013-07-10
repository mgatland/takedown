VERSION 5.00
Begin VB.Form frm_upgrade 
   BackColor       =   &H00000000&
   Caption         =   " Upgrade selection"
   ClientHeight    =   6270
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   8505
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
   ForeColor       =   &H00FFFFFF&
   LinkTopic       =   "Form1"
   ScaleHeight     =   6270
   ScaleWidth      =   8505
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Com_cancel 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   495
      Left            =   7080
      TabIndex        =   14
      Top             =   120
      Width           =   1335
   End
   Begin VB.CommandButton com_upg 
      Caption         =   "Upgrade"
      Height          =   495
      Index           =   4
      Left            =   6240
      TabIndex        =   13
      Top             =   5160
      Width           =   1215
   End
   Begin VB.CommandButton com_upg 
      Caption         =   "Upgrade"
      Height          =   495
      Index           =   3
      Left            =   6240
      TabIndex        =   12
      Top             =   4080
      Width           =   1215
   End
   Begin VB.CommandButton com_upg 
      Caption         =   "Upgrade"
      Height          =   495
      Index           =   2
      Left            =   6240
      TabIndex        =   11
      Top             =   3000
      Width           =   1215
   End
   Begin VB.CommandButton com_upg 
      Caption         =   "Upgrade"
      Height          =   495
      Index           =   1
      Left            =   6240
      TabIndex        =   10
      Top             =   1920
      Width           =   1215
   End
   Begin VB.CommandButton com_upg 
      Caption         =   "Upgrade"
      Height          =   495
      Index           =   0
      Left            =   6240
      TabIndex        =   9
      Top             =   840
      Width           =   1215
   End
   Begin VB.OptionButton opt_wep 
      BackColor       =   &H00000000&
      Caption         =   "Blaster"
      ForeColor       =   &H00FFFFFF&
      Height          =   375
      Index           =   2
      Left            =   5040
      TabIndex        =   3
      Top             =   240
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.OptionButton opt_wep 
      BackColor       =   &H00000000&
      Caption         =   "Rifle"
      ForeColor       =   &H00FFFFFF&
      Height          =   375
      Index           =   1
      Left            =   3120
      TabIndex        =   2
      Top             =   240
      Width           =   1695
   End
   Begin VB.OptionButton opt_wep 
      BackColor       =   &H00000000&
      Caption         =   "Pistol"
      ForeColor       =   &H00FFFFFF&
      Height          =   375
      Index           =   0
      Left            =   1440
      TabIndex        =   1
      Top             =   240
      Value           =   -1  'True
      Width           =   1815
   End
   Begin VB.Label lbl_upg 
      BackColor       =   &H00000000&
      BackStyle       =   0  'Transparent
      Caption         =   "Slot five:"
      ForeColor       =   &H00FFFFFF&
      Height          =   975
      Index           =   4
      Left            =   120
      TabIndex        =   8
      Top             =   5160
      Width           =   5775
   End
   Begin VB.Label lbl_upg 
      BackColor       =   &H00000000&
      BackStyle       =   0  'Transparent
      Caption         =   "Slot four:"
      ForeColor       =   &H00FFFFFF&
      Height          =   975
      Index           =   3
      Left            =   120
      TabIndex        =   7
      Top             =   4080
      Width           =   5775
   End
   Begin VB.Label lbl_upg 
      BackColor       =   &H00000000&
      BackStyle       =   0  'Transparent
      Caption         =   "Slot three:"
      ForeColor       =   &H00FFFFFF&
      Height          =   975
      Index           =   2
      Left            =   120
      TabIndex        =   6
      Top             =   3000
      Width           =   5775
   End
   Begin VB.Label lbl_upg 
      BackColor       =   &H00000000&
      BackStyle       =   0  'Transparent
      Caption         =   "Slot two:"
      ForeColor       =   &H00FFFFFF&
      Height          =   975
      Index           =   1
      Left            =   120
      TabIndex        =   5
      Top             =   1920
      Width           =   5775
   End
   Begin VB.Label lbl_upg 
      BackColor       =   &H00000000&
      BackStyle       =   0  'Transparent
      Caption         =   "Slot one: Cooling coil. Decreases heat rise but also slows the fire rate. Next level: -50 heat  increase, -50 fire rate"
      ForeColor       =   &H00FFFFFF&
      Height          =   975
      Index           =   0
      Left            =   120
      TabIndex        =   4
      Top             =   840
      Width           =   5775
   End
   Begin VB.Label lbl_upgrade 
      BackStyle       =   0  'Transparent
      Caption         =   "Upgrades:"
      ForeColor       =   &H00FFFFFF&
      Height          =   420
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   1365
      WordWrap        =   -1  'True
   End
End
Attribute VB_Name = "frm_upgrade"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim wep As Integer

Private Sub Com_cancel_Click()
If MsgBox("Abort this upgrade?", vbOKCancel, "Abort") = vbOK Then Unload Me
End Sub

Private Sub com_upg_Click(Index As Integer)
frm_game.upgrade_upg wep, Index
MsgBox "Slot upgraded"
Unload Me
End Sub

Private Sub Form_Load()
opt_wep(0).Value = True
opt_wep_Click (0)
End Sub


Private Sub opt_wep_Click(Index As Integer)
wep = Index
Dim a As Integer
Dim bAllowed As Boolean

For a = 0 To upgTop
    lbl_upg(a).Caption = frm_game.upgrade_getlbl(wep, a, bAllowed)
    com_upg(a).Enabled = bAllowed
Next a

End Sub
