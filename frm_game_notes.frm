VERSION 5.00
Begin VB.Form frm_game_notes 
   BackColor       =   &H00000000&
   Caption         =   "TakeDown - Notes"
   ClientHeight    =   7110
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   9720
   ControlBox      =   0   'False
   ForeColor       =   &H00FFFFFF&
   LinkTopic       =   "Form1"
   ScaleHeight     =   474
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   648
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton com_next 
      Cancel          =   -1  'True
      Caption         =   "Previous"
      Default         =   -1  'True
      Height          =   495
      Index           =   0
      Left            =   240
      TabIndex        =   3
      Top             =   6480
      Width           =   1095
   End
   Begin VB.CommandButton com_next 
      Caption         =   "Next"
      Height          =   495
      Index           =   1
      Left            =   1440
      TabIndex        =   2
      Top             =   6480
      Width           =   1095
   End
   Begin VB.CommandButton com_exit 
      Caption         =   "Close"
      Height          =   495
      Left            =   4080
      TabIndex        =   1
      Top             =   6480
      Width           =   1095
   End
   Begin VB.Label labnotes 
      BackStyle       =   0  'Transparent
      Caption         =   "No information found"
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
      Height          =   6255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   9495
   End
End
Attribute VB_Name = "frm_game_notes"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim notesPage As Integer



Public Sub opennotes(ByVal np As Integer)
notesPage = np
changenotes 0
End Sub

Private Sub changenotes(ByVal dir As Integer)
Dim a As Integer

      notesPage = notesPage + dir
      If notesPage > UBound(save.misTxt) Then notesPage = 0
      If notesPage < 0 Then notesPage = UBound(save.misTxt)
      a = notesPage
      Do While save.misTxt(a) = False
        If dir = 0 Then dir = 1
        a = a + dir
        If a > UBound(save.misTxt) Then a = 0
        If a < 0 Then a = UBound(save.misTxt)
            If a = notesPage Then Exit Do 'full circle
      Loop
    notesPage = a
drawnotes

End Sub

Private Sub drawnotes()
Dim a As Integer
Dim notesTxt As String * 1

labnotes = ""

If save.misTxt(notesPage) = False Then
    'LabNotes.ForeColor = RBG(255, 255, 255)
    labnotes.ForeColor = RGB(255, 255, 255)
    labnotes.Caption = "NO DATA IN NOTES"
    
    Else

    For a = 1 To Len(misTxt(notesPage))
    notesTxt = Mid$(misTxt(notesPage), a, 1)
    If notesTxt = "^" Then
      a = a + 1
      notesTxt = Mid$(misTxt(notesPage), a, 1)
      Select Case notesTxt
      Case "1": labnotes = labnotes + Chr$(10)
      Case "2": labnotes = labnotes + Chr$(10) + Chr$(10)
      Case "r": labnotes.ForeColor = RGB(255, 100, 100)
      Case "g": labnotes.ForeColor = RGB(100, 255, 100)
      Case "b": labnotes.ForeColor = RGB(100, 100, 255)
      Case "w": labnotes.ForeColor = RGB(255, 255, 255)
      Case "x": labnotes.ForeColor = RGB(0, 0, 0)
      End Select
      Else:
            labnotes = labnotes + notesTxt
    End If
    Next a
    
End If

End Sub

Private Sub com_exit_Click()
frm_game.engine_setnotespage notesPage
Unload Me
End Sub

Private Sub com_next_Click(Index As Integer)
Dim dir As Integer
If Index = 0 Then dir = -1 Else dir = 1
changenotes dir
End Sub
