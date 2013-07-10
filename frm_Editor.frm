VERSION 5.00
Begin VB.Form frm_Editor 
   BackColor       =   &H00000000&
   Caption         =   "TAKEDOWN level editor"
   ClientHeight    =   8385
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   11250
   LinkTopic       =   "Form1"
   ScaleHeight     =   8385
   ScaleWidth      =   11250
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox PicScreen 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   7695
      Left            =   0
      MousePointer    =   2  'Cross
      ScaleHeight     =   513
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   752
      TabIndex        =   0
      Top             =   0
      Width           =   11280
   End
End
Attribute VB_Name = "frm_Editor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Editor_Episode As String
Dim Editor_Mission As Integer

Private Type editorenemytype
    live As Boolean
    x As Integer  '20, 14, 1, "standing",1, 0
    y As Integer
    class As Integer
    state As String
    killgoal As Integer
    triggerval As Integer
End Type

Private Type EditorPathType
    live As Boolean
    x As Integer
    y As Integer
End Type

Dim Title As String
'Dim O(0 To ObjTop) As objtype
'Dim e(0 To EnemyTop) As editorenemytype

Dim groundstyle As Byte

Dim p_x As Integer
Dim p_y As Integer
Dim p_face As Integer
'Dim trig(0 To TrigTop) As Triggertype
'Dim path(0 To PathTop) As EditorPathType

Dim killgoal As Integer
Dim delay As Integer
Dim healamount As Integer

Dim bEnemies As Boolean
Dim bPlayer As Boolean
Dim bPaths As Boolean


' GRAPHICS STUFF
Private Sub game_moveimages()
Dim x As Integer, y As Integer, a As Integer, b As Integer

  For a = 0 To screenWidth
  For b = 0 To screenHeight
    BitBlt PicScreen.hDC, a * TileSize, b * TileSize, TileSize, TileSize, frm_game.pic_ground.hDC, TileSize * groundstyle, 0, vbSrcCopy
  Next b, a

  For a = 0 To UBound(O)
        If O(a).live = True Then
                          BitBlt PicScreen.hDC, O(a).x * TileSize, O(a).y * TileSize, TileSize, TileSize, frm_game.pic_groundm.hDC, TileSize * (O(a).type + 3), 0, vbSrcAnd
                          BitBlt PicScreen.hDC, O(a).x * TileSize, O(a).y * TileSize, TileSize, TileSize, frm_game.pic_ground.hDC, TileSize * (O(a).type + 3), 0, vbSrcPaint
                          End If
        Next a

If bPlayer = True Then
   x = p_x * TileSize
   y = p_y * TileSize
   BitBlt PicScreen.hDC, x, y, TileSize, TileSize, frm_game.pic_humanm.hDC, TileSize * (p_face - 1), 0, vbSrcAnd
   BitBlt PicScreen.hDC, x, y, TileSize, TileSize, frm_game.pic_human.hDC, TileSize * (p_face - 1), 0, vbSrcPaint
End If

If bEnemies = True Then
  For a = 0 To UBound(e)
   If e(a).live = True And e(a).x <> -1 Then
   x = e(a).x * TileSize
   y = e(a).y * TileSize
          BitBlt PicScreen.hDC, x, y, TileSize, TileSize, frm_game.pic_humanm.hDC, TileSize * (1), 0, vbSrcAnd
          BitBlt PicScreen.hDC, x, y, TileSize, TileSize, frm_game.pic_human.hDC, TileSize * (1), TileSize * 1, vbSrcPaint
   End If
  Next a
End If

If bPaths = True Then
  For a = 0 To UBound(path)
   If path(a).live = True Then
   x = path(a).x * TileSize
   y = path(a).y * TileSize
          BitBlt PicScreen.hDC, x, y, TileSize, TileSize, frm_game.pic_deadm.hDC, 0, 0, vbSrcAnd
          BitBlt PicScreen.hDC, x, y, TileSize, TileSize, frm_game.pic_dead.hDC, 0, 0, vbSrcPaint
   End If
  Next a
End If

PicScreen.Refresh

End Sub

Private Sub PicScreen_MouseUp(button As Integer, shift As Integer, x As Single, y As Single)
   x = Int(x / TileSize)
   y = Int(y / TileSize)
   
 If button = 0 Then

 End If
End Sub
