VERSION 5.00
Begin VB.Form frm_game 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00808080&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "TakeDown"
   ClientHeight    =   8415
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   11280
   Icon            =   "frm_game.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   561
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   752
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox pic_mech 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      Height          =   510
      Left            =   1800
      ScaleHeight     =   30
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   150
      TabIndex        =   17
      Top             =   4320
      Visible         =   0   'False
      Width           =   2310
   End
   Begin VB.PictureBox pic_deadm 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      Height          =   510
      Left            =   5520
      ScaleHeight     =   30
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   150
      TabIndex        =   12
      Top             =   720
      Visible         =   0   'False
      Width           =   2310
   End
   Begin VB.PictureBox pic_effectm 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      Height          =   510
      Left            =   1920
      ScaleHeight     =   30
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   240
      TabIndex        =   11
      Top             =   2880
      Visible         =   0   'False
      Width           =   3660
   End
   Begin VB.PictureBox pic_effect 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      Height          =   510
      Left            =   1920
      ScaleHeight     =   30
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   240
      TabIndex        =   10
      Top             =   2280
      Visible         =   0   'False
      Width           =   3660
   End
   Begin VB.CommandButton cmdExit 
      BackColor       =   &H00000000&
      Cancel          =   -1  'True
      Caption         =   "Exit to Menu"
      Height          =   375
      Left            =   9240
      TabIndex        =   9
      Top             =   7800
      Width           =   1695
   End
   Begin VB.PictureBox pic_shotm 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      Height          =   510
      Left            =   5760
      ScaleHeight     =   30
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   150
      TabIndex        =   8
      Top             =   2880
      Visible         =   0   'False
      Width           =   2310
   End
   Begin VB.PictureBox Pic_shot 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      Height          =   510
      Left            =   5760
      ScaleHeight     =   30
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   150
      TabIndex        =   7
      Top             =   2280
      Visible         =   0   'False
      Width           =   2310
   End
   Begin VB.PictureBox pic_dead 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      Height          =   510
      Left            =   5520
      ScaleHeight     =   30
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   150
      TabIndex        =   5
      Top             =   120
      Visible         =   0   'False
      Width           =   2310
   End
   Begin VB.PictureBox pic_groundm 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      Height          =   510
      Left            =   840
      ScaleHeight     =   30
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   300
      TabIndex        =   4
      Top             =   600
      Visible         =   0   'False
      Width           =   4560
   End
   Begin VB.PictureBox pic_ground 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      Height          =   510
      Left            =   840
      ScaleHeight     =   30
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   300
      TabIndex        =   3
      Top             =   120
      Visible         =   0   'False
      Width           =   4560
   End
   Begin VB.PictureBox pic_human 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      Height          =   4110
      Left            =   8520
      ScaleHeight     =   270
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   120
      TabIndex        =   2
      Top             =   840
      Visible         =   0   'False
      Width           =   1860
   End
   Begin VB.PictureBox pic_humanm 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      Height          =   510
      Left            =   8520
      ScaleHeight     =   30
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   120
      TabIndex        =   1
      Top             =   240
      Visible         =   0   'False
      Width           =   1860
   End
   Begin VB.PictureBox Pic_decM 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      Height          =   510
      Left            =   1440
      ScaleHeight     =   30
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   360
      TabIndex        =   15
      Top             =   1800
      Visible         =   0   'False
      Width           =   5460
   End
   Begin VB.PictureBox Pic_dec 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      Height          =   510
      Left            =   2040
      ScaleHeight     =   30
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   360
      TabIndex        =   14
      Top             =   960
      Visible         =   0   'False
      Width           =   5460
   End
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
      TabIndex        =   13
      Top             =   0
      Width           =   11280
      Begin VB.PictureBox pic_mechm 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   510
         Left            =   1800
         ScaleHeight     =   30
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   150
         TabIndex        =   18
         Top             =   4920
         Visible         =   0   'False
         Width           =   2310
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
         Left            =   120
         TabIndex        =   16
         Top             =   120
         Visible         =   0   'False
         Width           =   6735
      End
   End
   Begin VB.Label lblMis 
      BackColor       =   &H00000000&
      BackStyle       =   0  'Transparent
      Caption         =   "Mission information Trooper:_The_enemy_is_approaching. Commander:_See_that_he_does_not_escape"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Index           =   2
      Left            =   120
      TabIndex        =   20
      Top             =   8190
      UseMnemonic     =   0   'False
      Width           =   7095
   End
   Begin VB.Label lblMis 
      BackColor       =   &H00000000&
      BackStyle       =   0  'Transparent
      Caption         =   "Mission information Trooper:_The_enemy_is_approaching. Commander:_See_that_he_does_not_escape"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Index           =   1
      Left            =   120
      TabIndex        =   19
      Top             =   7995
      UseMnemonic     =   0   'False
      Width           =   7095
   End
   Begin VB.Label lblMis 
      BackColor       =   &H00000000&
      BackStyle       =   0  'Transparent
      Caption         =   "Mission information Trooper:_The_enemy_is_approaching. Commander:_See_that_he_does_not_escape"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Index           =   0
      Left            =   120
      TabIndex        =   6
      Top             =   7800
      UseMnemonic     =   0   'False
      Width           =   7095
   End
   Begin VB.Label labheat 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00000000&
      BackStyle       =   0  'Transparent
      Caption         =   "0% Heat"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   375
      Left            =   7320
      TabIndex        =   0
      Top             =   7800
      Width           =   1815
   End
   Begin VB.Shape healthbar 
      BackColor       =   &H0000C000&
      BackStyle       =   1  'Opaque
      BorderWidth     =   5
      FillStyle       =   5  'Downward Diagonal
      Height          =   495
      Left            =   4080
      Top             =   7800
      Width           =   2250
   End
   Begin VB.Shape Shape2 
      BackColor       =   &H000000FF&
      BackStyle       =   1  'Opaque
      BorderWidth     =   5
      FillStyle       =   5  'Downward Diagonal
      Height          =   495
      Left            =   4080
      Top             =   7800
      Width           =   2250
   End
   Begin VB.Shape shootlight 
      BackColor       =   &H0000FFFF&
      BackStyle       =   1  'Opaque
      BorderWidth     =   3
      Height          =   495
      Left            =   6480
      Shape           =   2  'Oval
      Top             =   7800
      Width           =   615
   End
End
Attribute VB_Name = "frm_game"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Function\Sub catagories
'
' Engine - Core functions. Playsound
' Game   - Main game functions. Newlev
' Ph     - ingame Physics information. Cansee, Canmove
' action - Such as firing.
' info   - stored information

Option Explicit

'============= type definitions (and some consts)

''Declarations for the WaveMix32.dll library

Private Declare Function WaveMixInit Lib "WAVMIX32.DLL" () As Long
Private Declare Function WaveMixConfigureInit Lib "WAVMIX32.DLL" (NewConfig As MIXCONFIG) As Long
Private Declare Function WaveMixActivate Lib "WAVMIX32.DLL" (ByVal MixSession As Long, ByVal Activate As Integer) As Long
Private Declare Function WaveMixOpenWave Lib "WAVMIX32.DLL" (ByVal MixSession As Long, WaveFilename As Any, ByVal hInst As Long, ByVal Flags As Long) As Long
Private Declare Function WaveMixOpenChannel Lib "WAVMIX32.DLL" (ByVal MixSession As Long, ByVal Channel As Long, ByVal Flags As Long) As Long
Private Declare Function WaveMixPlay Lib "WAVMIX32.DLL" (PlayParameters As MIXPLAYPARAMS) As Integer
Private Declare Function WaveMixFlushChannel Lib "WAVMIX32.DLL" (ByVal MixSession As Long, ByVal Channel As Long, ByVal Flags As Long) As Integer
Private Declare Function WaveMixCloseChannel Lib "WAVMIX32.DLL" (ByVal MixSession As Long, ByVal Channel As Long, ByVal Flags As Long) As Integer
Private Declare Function WaveMixFreeWave Lib "WAVMIX32.DLL" (ByVal MixSession As Long, ByVal MixWave As Long) As Integer
Private Declare Function WaveMixCloseSession Lib "WAVMIX32.DLL" (ByVal MixSession As Long) As Integer
Private Declare Sub WaveMixPump Lib "WAVMIX32.DLL" ()
Private Declare Function WaveMixGetInfo Lib "WAVMIX32.DLL" (WaveMixInfo As WaveMixInfo) As Integer

'Types for the WaveMix32.dll library
Private Type WaveMixInfo
   Size As Integer
   VersionMajor As Byte
   VersionMinor As Byte
   Date(12) As String
   Formats As Long
End Type

'
Private Type MIXCONFIG
    Size As Integer
    Flags As Long
    Channels As Integer
    SamplingRate As Integer
End Type

Private Type networktype
    bhost As Boolean
    bclient As Boolean
    state As String
End Type

Private Type MIXPLAYPARAMS
    Size         As Integer
    MixSessionLo As Integer
    MixSessionHi As Integer
    ChannelLo    As Integer
    ChannelHi    As Integer
    MixWaveLo   As Integer
    MixWaveHi   As Integer
    hWndNotifyLo  As Integer
    hWndNotifyHi  As Integer
    FlagsLo     As Integer
    FlagsHi     As Integer
    wLoops        As Integer
End Type

'Configurable consts

Private Const pathlinktop = 9
Private Const TileSize = 30
Private Const ShotTop = 29
Private Const ExpTop = 19
Private Const EnemyTop = 29
Private Const TeamsTop = 2  ' plus the player
'timertop = 9 - not a const, check in code
Private Const ObjTop = 511 '139
Private Const decTop = 79
Private Const TrigTop = 39
Private Const MaxHeat = 120
Private Const PathTop = 99
Private Const keysqTop = 99
Private Const PatrolSqTop = 19
Private Const patchTop = 31

Private Const speakDur = 5  ' How long (in frames) an icon appears on speaking enemy
Private Const behindMult = 0.2      'how hard is it to see things behind you (for enemies)
Private Const pathDepth = 20
 
Private Const screenHeight = 16
Private Const screenWidth = 24

Private Const maxViewDist = 22  'used for PH_Cansee - how far anyone can see

Private Const misSoundsTop = 9 'How many special mission sounds


Private Type positionType
  x(1 To 4) As Integer
  y(1 To 4) As Integer
  angle(1 To 4) As Single
End Type

Private Type pointType
          x As Integer
          y As Integer
End Type

Private Enum eAttitude
    At_Agressive = 0   'Seek player
    At_Cautious = 1    'Fight only if you can see him
    at_defensive = 2   'Fight but never seek.
    at_cowardly = 3    'Flee from player (not complete!)
End Enum

Private Type eCheckType
    bFriends As Boolean 'Do we alert friends?
    FriendTag As String
    FriendNum As Integer
    bCheck As Boolean 'Do we check at all?
    bHome As Boolean  'Do we return home after a check?
End Type

'Unaware role, Suspect role, Aware role.
Private Enum eSuspect
    Cl_wander = 1 'wander around
    Cl_stand = 2 'stand still
    Cl_patrol = 3 'follow patrol route X; report to commander Y.
    Cl_hide = 4     'go and hide
    cl_guard = 5    'Guard this space
    Cl_command = 6 'accept patrol reports
End Enum
 

Private Type enemytype
        'basic vars
        x As Integer
        y As Integer
        health As Integer
        moved As Integer    'Movement timer
        shot As Integer     'Shooting timer
        face As Integer     'Direction we are facing
        
        live As Boolean     'does the enemy actually exist
        mspeed As Integer   'movement speed
        sspeed As Integer   'shooting speed
        skin As Byte        'graphical appearance
        shottype As Byte    'shot type
        
        goaldie As Boolean  'counts on the kill count
        material As Integer 'how much material for killing it? (not really used)
                
        tag As String       'tag for triggers to use
                
        'AI
        
        skill As Integer    '1 to 100.  intelligence\skill
        lastmove As Integer 'Last direction we moved, for ai.
        oldface As Integer  'last face, for ai
            
                
        Attitude As eAttitude  'Our combat attitude
        
        actUnaware As eSuspect 'four vars govern our behaviour.
        actSuspect As eSuspect
        actAware As eSuspect
        actFullAware As eSuspect
           
           
        role As eSuspect         'our role - from 3 vars above.
        action As String        'our action
        actionV As Integer      'phase of the action.
        actionT As Integer      'Action timer
           
 '       Action As String 'Action is a string of states, eg investigate a noise then return.
 '       ActionN As Integer
                
        'stand, wander, patrol+, command+.
                
        'patrol variables
        'patrolb As Boolean 'Are we currently patrolling
        patrolRoute As String 'patrol route we follow
        patrolIndex As Integer 'next position on route
        patrolbReport As Boolean 'have we reported in?
        
        ''commandb As Boolean 'Are we commanding?
        'commandMax As Integer 'How many should report in? (long patrols can be doubled to make up for infrequent visits)
        'commandNum As Integer 'How many have reported in
        'commandTimeMax As Integer 'What's the longest we can wait to get them all?
        'commandTime As Integer 'How long have we waited?
        
                
        'investigate variables
'        checkb As Boolean 'Are we investigating a suspicious thing?
        checkpos(1) As pointType 'where is it?
        checkscore As Integer
        checktime As Integer
        check As eCheckType
        following As Integer
        bfollowed As Boolean 'has someone followed us?
        
        home As pointType 'where we go back to afterwards
        guard As pointType ' Don't go too far from here
                
        
        
        ''NOT USED START
        gethelpb As Boolean 'Do we get help?
        gethelpWho As String 'what group do we call for help?
        gethelpMax As Integer 'How many do we need in tow?
        gethelpNum As Integer 'How many do we have in tow?
        ''Guard' position is used for gethelping too.
        
        ''when we've got them, we go to the check\hide state.
       '
       ' hideb As Boolean 'Are we hiding?
       ' hideX As Integer 'where shall we hide?
       ' hideY As Integer
       ' 'we will go there and hide.

       ' 'NOT USED END
                              
        bStartled As Boolean
        StartledT As Single
                              
        fightDisMax As Integer    'prefered combat distance
        fightDisMin As Integer
        
        bEngage As Boolean     'We are fighting\seeking player
        
        
        cansee(-1 To EnemyTop) As Single   'Can we see the player? How well?
        
        bAllAware As Boolean            'are we magically aware of everyone, always?
        bAwareAll(2) As Boolean
        bAware(-1 To EnemyTop, 2) As Boolean      'We know that the player is present
        bAwareG As Boolean
        'dimensions: 0 = aware exactly, 1 = aware but don't know where, 2 = suspicious, otherwise nothing
        
        suspicion(-1 To EnemyTop) As Single     'I wonder if the player is here...
        suspiciong As Single 'global, total suspicion
        
        state As String     'AI state, eg Seeking or waiting.
        
        tactictime As Single 'used (and controlled)in states
                              'for time remaining before
                              'abandoning a tactical move.
        substate As Integer   'a special property for a state
        nextstate As String   'In a runto, state to change to
                              'after arriving at destination.
        finaldest As pointType  'In a runto, where we're aiming
        orderpriority As Integer  'in a runto, can it be interrupted?
       
        counter As Single  'Count down timer
                           'used in states and for death anim.
    
        t As Integer 'who we are fighting - enemy number or -1 is the player
        team As Byte 'our team

        randval As Integer '0 or 1, randomly.
End Type

Private Type teamtype
    rel(-1 To TeamsTop) As Byte
    'relationships:
    '0  = Hostile       - Attack on sight
    '1  = Neutral       - ignore\return fire
    '2 = friendly       - Help in combat - shots don't affect
End Type

Private Type guntype
        projtype As Integer
        
        special As Integer
        heatinc As Single  'heat increase per shot
        sspeed As Integer  'refire rate
        kick As Integer    'Stops you moving for this long after firing.
        stealth As Integer
        selfhurt As Integer 'How much does it hurt its owner per shot
        
        'proj_speed As Integer 'move delay of projectile
        'proj_damage As Integer 'damage of projectile
        
        
        
        'Upgrade(0 To 4) As Integer
End Type

Private Type patchtype
    x(0 To 1) As Integer
    y(0 To 1) As Integer
    type As Integer
    live As Boolean
    offset As Single
End Type

Private Type tripnettype
    live As Boolean
    triggered As Boolean
    rel(-1 To TeamsTop) As Byte
    'Hostile0, Neutral1, friendly2
    '0 means it detects. All others do not.
    
    x As Integer 'where it was last triggered
    y As Integer
    tag As String ' the tag of the response team who will check out this tripwire
                  'leave it blank to send none, if the tripwire sets a trigger instead
End Type

Private Type tripwiretype
    face As Integer
    net As Integer
    live As Boolean
    group As Integer
    x As Integer
    y As Integer
End Type

Private Type playertype
        x As Integer
        y As Integer

        health As Integer
        
        moved As Integer
        shot As Integer
        heat As Single
        
        face As Integer
        kills As Integer
        mspeed As Integer

        lastmove As Integer
        
        material As Integer
        
        gunMod(wepTop, upgTop) As Integer
        
        gun(0 To 2) As guntype
        cGun(0 To 1) As Integer 'Guns we are carrying
        'cInv(0 To 1) As Integer      'Inv we are carrying
        'inv(9) As integer     'amount of this item
        

        cmd As Integer 'Command we gave

End Type

Private Type shottype
        x As Integer
        y As Integer
        oldx As Integer
        oldy As Integer
        moved As Integer
        face As Integer
        live As Boolean
        own As Integer
        
        mspeed As Integer
        damage As Integer
        skin As Byte
        
        shottype As Integer
        
        special As Byte
        stealth As Integer
        bHasHurt As Boolean
        
        shotfrom As pointType
End Type

Private Type objtype
        x As Integer
        y As Integer
        xw As Integer
        yw As Integer
        live As Boolean
        type As Byte
        
        bVisOnly As Boolean 'don't draw its full size, only first square, it's for los only
        bDrawOnly As Boolean 'don't use in LOS, it's for drawing only.
End Type

Private Type decoType
        x As Single 'not ints for decorations!
        y As Single
        live As Boolean
        type As Byte
End Type

Private Type keySqType
    x As Integer
    y As Integer
    live As Boolean
    nametag As String
End Type

Private Type PatrolSqType
    live As Boolean
    x As Integer
    y As Integer
    group As String 'name of patrol route
    Index As Integer 'when do I go to this square
    report As String 'Report to this commander.
End Type

Private Type exptype
        x As Single
        y As Single 'not ints for explosions!
        face As Integer
        frame As Single
        endframe As Integer
        live As Boolean
        skin As Byte
        own As Integer
        
        shotfrom As pointType
End Type

Private Type Triggertype
    repeating As Integer
    live As Boolean
    actwhen As String 'And, Or
    Condtype(0 To 1) As String 'What kind of condition
    CondVal(0 To 1, 0 To 2) As Variant   'parameter for condition
    ActType(0 To 1) As String ' What kind of action
    ActVal(0 To 1, 0 To 2) As Variant
End Type

Private Type pathtype
    live As Boolean
    x As Integer
    y As Integer
    links(0 To pathlinktop) As Integer
    rating(-1 To PathTop) As Integer
    range As Integer
End Type

Private Type speechType
    live As Boolean
    speaker As Integer 'enemy speaker, -1 = none
    soundType As Byte 'seen, taunt, mission sound
    number As Byte    'which variation of that sound
    solo As Boolean  'is this a solo line or said to someone?
    priority As Integer
End Type


'=================end of type definitions

' SOUND STUFF START

'Constants for the WaveMix32.dll library
 Const WMIX_QUEUEWAVE As Long = &H0
 Const WMIX_CLEARQUEUE As Long = &H1
 Const WMIX_USELRUCHANNEL As Long = &H2
 Const WMIX_HIGHPRIORITY As Long = &H4
 Const WMIX_WAIT As Long = &H8

 Const WMIX_CONFIG_CHANNELS As Long = &H1
 Const WMIX_CONFIG_SAMPLINGRATE As Long = &H2

 Const WMIX_FILE As Long = &H0
 Const WMIX_RESOURCE As Long = &H2

 Const WMIX_OPENSINGLE As Long = &H0
 Const WMIX_OPENALL As Long = &H1
 Const WMIX_OPENCOUNT As Long = &H2

 Const WMIX_ALL As Long = &H1
 Const WMIX_NOREMIX As Long = &H2

 Const WMIX_ACTIVATE As Integer = 1
 Const WMIX_DEACTIVATE As Integer = 0
''''''''''''''''''''''''''''''''''''''''''''''
'End of sound stuff.


Dim Session As Long

Dim ChannelOne As Long
Dim ChannelTwo As Long
Dim ChannelThree As Long
Dim ChannelFour As Long
Dim ChannelFive As Long
Dim ChannelSix As Long
Dim ChannelSeven As Long
Dim ChannelEight As Long

Dim SoundDead(0) As Long    'shot hits enemy and kills

Dim SoundShot(4) As Long    'one for each shottype

Dim SoundExp(3) As Long   'shot hits a surface, one per shottype
Dim SoundThud(1) As Long  '0 = hit enemy
                          '1 = hit player

Dim soundoverheat As Long
Dim soundmsg As Long
Dim soundTrip As Long

Dim SoundSeen(1) As Long
'Dim SoundTaunt(1) As Long 'soundgoodshot
Dim SoundCheck(1) As Long
Dim SoundCheckF(1) As Long
Dim SoundYesCheck(1) As Long

Dim soundCheckStop(1) As Long

Dim soundSeekF(1) As Long
Dim soundSeekYes(1) As Long

Dim soundGatherFail(1) As Long
Dim soundGatherWork(1) As Long

Dim soundGatherF(1) As Long
Dim soundGatherYes(1) As Long

Dim soundManDown(1) As Long
Dim soundGotHurt(1) As Long
Dim soundGotHurtF(1) As Long
Dim soundGoodShot(1) As Long
Dim soundGoodShotF(1) As Long

Dim SoundMusic(4) As Long

Dim soundMis(misSoundsTop) As Long
 'SOUND STUFF END
 
Dim gamespeed As Single  '1

Private Type recentTextType
    txt As String
    time As Integer
End Type

Dim RecentText(0 To 7) As recentTextType
Const misTxtDelay = 50

Dim countdown As Single 'Countdown until the new level.
Dim nextmission As Integer 'number of next mission

Private Type cdTimerType
    val As Single
    bDown As Boolean
    bActive As Boolean
End Type

Dim cdTimer(9) As cdTimerType 'Countdown timers
Dim speech(4) As speechType 'spoken lines
Dim speakTime As Integer 'frame number to start next line
Dim LastSpeakTime As Integer
Dim lastSpeaker As Integer

Dim multimode As Boolean 'is this match with multiple teams, not just player vs enemies?

Dim p As playertype: Dim e(0 To EnemyTop) As enemytype: Dim s(0 To ShotTop) As shottype
Dim O(0 To ObjTop) As objtype
Dim ex(0 To ExpTop) As exptype
Dim Dec(0 To decTop) As decoType
Dim keysq(0 To keysqTop) As keySqType: Dim team(0 To TeamsTop) As teamtype
Dim psq(0 To PatrolSqTop) As PatrolSqType
Dim patch(0 To patchTop) As patchtype
Dim t(0 To TrigTop) As Triggertype

Dim tripnet(0 To 4) As tripnettype
Dim tripwire(0 To 11) As tripwiretype

Dim gamewidth As Integer, gameheight As Integer
Dim screenX As Single
Dim screenY As Single
Dim screenXd As Single
Dim screenYd As Single
Dim danger() As Integer   'Is this square dangerous? (about to have a shot enter it)
Dim walkable() As Boolean 'Is a square empty of impassible terrain?
Dim path(0 To PathTop) As pathtype

Dim flag(0 To flagTop) As Integer

Dim groundstyle As Integer

Dim alarm As Boolean
Dim bFailed As Boolean 'the player has stuffed up the misson

Dim notesPage As Integer

Dim randval As Integer 'For assigning a randval to enemies
Dim timepast As Single
Dim SoundSlot As Integer

Dim lowestFreeDec As Integer 'how many decs does the level use
                          ' and how many can be used for scorchmarks
Dim scorchDec As Integer ' what are we up to?
                          
Dim exiting As Boolean
Dim gameon As Boolean
Dim keydir(1 To 4) As Boolean 'Direction keys that are being pressed
Dim LastTick As Long
Dim CurrentTick As Long

Public TickDifference As Long

'Editor dims
Dim editorX As Integer, editorY As Integer

''Demo (under construction
'Dim bDemoRec As Boolean
'Dim bDemoPlay As Boolean
'Dim demo() As demoframe

Dim net As networktype
Private Declare Function GetTickCount Lib "kernel32" () As Long

Sub game_loop()
Dim escaped As Boolean
Dim pface As Integer
Dim scrollRate As Integer

'Dim frameskip As Boolean 'DEBUG frameskip monitor, part 1

'If running = True Then Exit Sub
'running = True
Do 'Here is the big monster game loop

If gameon = True Then

    CurrentTick = GetTickCount()
       
 If CurrentTick - LastTick > TickDifference Then
 
 'If frameskip = False Then 'DEBUG frameskip monitor, part 2
 'p.heat = 99
 'Else
 'p.heat = 0
 'End If
 'frameskip = False

    LastTick = GetTickCount()


Dim tried As Byte
Dim i As Integer, a As Integer, b As Integer, x As Integer, y As Integer, dangernum As Integer, lastface As Integer

timepast = timepast + 1 / gamespeed


If timepast >= speakTime Then
If engine_playspeech = True Then speakTime = timepast + 10 + Int(Rnd * 10)
End If

For a = 0 To UBound(cdTimer)
    If cdTimer(a).bActive = True Then
    If cdTimer(a).val > 0 And cdTimer(a).bDown = True Then
             cdTimer(a).val = cdTimer(a).val - (1 / gamespeed)
             If cdTimer(a).val < 0 Then cdTimer(a).val = 0
             End If
    If cdTimer(a).val > 0 And cdTimer(a).bDown = False Then
             cdTimer(a).val = cdTimer(a).val + (1 / gamespeed)
             End If
    End If
Next


'TRIGGERS
game_checktrigs "loop"

If countdown > 0 Then
  countdown = (countdown - (1 / gamespeed))
'  labMission.Caption = Int(countdown)
  If countdown <= 0 Then
            If bFailed = True Then
                exiting = True
                Else
                    game_winmission
                    GoTo finishloop
                End If
  End If
End If

engine_MisTxt_update


If p.heat > 0 Then p.heat = p.heat - (0.5 / gamespeed)
If p.heat < 0 Then p.heat = 0
If p.heat > MaxHeat Then p.heat = MaxHeat
labheat.Caption = Str$(Int(p.heat)) + "% Heat"

If p.heat < 100 Then
   labheat.ForeColor = RGB(Int(p.heat * 2.55), 0, 255 - Int(p.heat * 2.55))
   labheat.Font.Size = 12
Else
   labheat.ForeColor = RGB(255, 255, 0)
   labheat.Font.Size = 14
End If

' PLAYER MOVEMENT ===============================================

'Pause?
If (GetKeyState(vbKeyP) And KEY_PRESSED) Then MsgBox "PAUSED at frame " & Str$(timepast) & ".", vbOKOnly, "TakeDown"

'Editor keys
If Cheatmode = True Then editor_catchkey

'Get the movement keys
If (GetKeyState(vbKeyW) And KEY_PRESSED) Then keydir(1) = True Else keydir(1) = False
If (GetKeyState(vbKeyS) And KEY_PRESSED) Then keydir(3) = True Else keydir(3) = False
If (GetKeyState(vbKeyA) And KEY_PRESSED) Then keydir(2) = True Else keydir(2) = False
If (GetKeyState(vbKeyD) And KEY_PRESSED) Then keydir(4) = True Else keydir(4) = False

'Remove doubles
If keydir(1) And keydir(3) Then keydir(1) = False: keydir(3) = False
If keydir(2) And keydir(4) Then keydir(2) = False: keydir(4) = False

pface = 0

'Don't move in the same dir twice, always look in the same dir twice.
For a = 1 To 4
  If keydir(a) And ((a <> p.lastmove And p.moved <= 1) Or (a = p.lastmove And p.moved > 1)) Then pface = a
Next a
If pface = 0 Then 'Otherwise, check for any direction
  For a = 1 To 4
  If keydir(a) Then pface = a
  Next a
End If

'face in dir
If (pface > 0) And (GetKeyState(vbKeyShift) And KEY_PRESSED) = False Then p.face = pface

'Notes page
If (GetKeyState(vbKeyX) And KEY_PRESSED) Then
    frm_game_notes.opennotes notesPage
    frm_game_notes.Show 1
End If

If p.moved > 0 Then
p.moved = p.moved - 1
Else
p.moved = -1
'p.oldx = p.X
'p.oldy = p.Y

  If pface > 0 Then
    If pface = 1 And ph_canmove(p.x, p.y - 1) = True Then p.y = p.y - 1
    If pface = 3 And ph_canmove(p.x, p.y + 1) = True Then p.y = p.y + 1
    If pface = 2 And ph_canmove(p.x - 1, p.y) = True Then p.x = p.x - 1
    If pface = 4 And ph_canmove(p.x + 1, p.y) = True Then p.x = p.x + 1
    p.moved = p.mspeed * gamespeed
    p.lastmove = pface
  End If

''''''''' Wingmen commands ! ''''''''''
p.cmd = 0
'First the command is issued to adjacent friends
'If there are none, it is ussued to all friends who can see
'the player.
If (GetKeyState(vbKeyF) And KEY_PRESSED) Then
                p.cmd = 1 '1 is follow
            b = 0 'no adjacents found
     ''       'find adjacent
     ''       For a = 0 To UBound(e)
     ''       If e(a).live = True And team(e(a).team).rel(-1) = 2 Then
     ''           If ph_GetDist(e(a).x, e(a).y, p.x, p.y) = 1 Then
     ''               b = 1
     ''               If e(a).following = -10 Then
     ''               e(a).following = -1
     ''               'make him reply
     ''               engine_addspeech a, 6, Int((UBound(SoundYesCheck) + 1) * Rnd), 10, True
     ''               End If
     ''           End If
     ''       End If
     ''     Next a
                
            'Find non-adjacents then.
            If b = 0 Then
            For a = 0 To UBound(e) 'from here, b is used for temp distance working.
            If e(a).live = True And team(e(a).team).rel(-1) = 2 Then
                b = ph_GetDist(p.x, p.y, e(a).x, e(a).y) - 3
                If b < 0 Then b = 0
                If e(a).cansee(-1) > b * 40 And b < 10 - 3 Then
                    If e(a).following = -10 Then
                    e(a).following = -1
                    ''e(a).bAwareG = True Don't become aware - its just the player ordering us
                    'make him reply
                    engine_addspeech a, 6, Int((UBound(SoundYesCheck) + 1) * Rnd), 10, True
                    End If
                End If
            End If
            Next a
                
            End If
            
    End If
If (GetKeyState(vbKeyG) And KEY_PRESSED) Then
                p.cmd = 2 '2 is stop following
            b = 0 'no adjacents found
    ''      'find adjacent
    ''      For a = 0 To UBound(e)
    ''      If e(a).live = True And team(e(a).team).rel(-1) = 2 Then
    ''          If ph_GetDist(e(a).x, e(a).y, p.x, p.y) = 1 Then
    ''              b = 1
    ''              If e(a).following = -1 Then
    ''              e(a).following = -10
    ''              'make him reply
    ''              ''engine_addspeech a, 6, Int((UBound(Soundyescheck) + 1) * Rnd), 10, True
    ''              End If
    ''          End If
    ''      End If
    ''      Next a
                
            'Find non-adjacents then.
            If b = 0 Then
            For a = 0 To UBound(e) 'from here, b is used for temp distance working.
            If e(a).live = True And team(e(a).team).rel(-1) = 2 Then
                b = ph_GetDist(p.x, p.y, e(a).x, e(a).y) - 3
                If b < 0 Then b = 0
                If e(a).cansee(-1) > b * 40 And b < 10 - 3 Then
                    If e(a).following = -1 Then
                    e(a).following = -10
                    'make him reply
                    ''engine_addspeech a, 6, Int((UBound(Soundyescheck) + 1) * Rnd), 10, True
                    End If
                End If
            End If
            Next a
                
            End If

    End If


'cheats - Q and L to activate
If (GetKeyState(vbKeyQ) And KEY_PRESSED) And (GetKeyState(vbKeyL) And KEY_PRESSED) Then MsgBox "Cheat mode enabled! O = health, I = enemy info, U = commando mode. Y = Runto command. T = slomo. R = level skip. K = smarten onscreen baddies. J = set enemy speed. H = Ninja mode. G = Set targets. Q = deactivate cheatmode": Cheatmode = True

End If

If p.shot > 0 Then
  p.shot = p.shot - 1
  Else
  If (GetKeyState(vbKeyM) And KEY_PRESSED) Then action_Pfire 0 Else If (GetKeyState(vbKeyN) And KEY_PRESSED) Then action_Pfire 1
End If


'Update screen position

screenXd = (p.x - screenWidth / 2) + 0.5
screenYd = (p.y - screenHeight / 2) + 0.5

Select Case Abs(screenX - screenXd)
    Case Is <= 1 / TileSize * 1: scrollRate = 0
    Case Is < 1: scrollRate = 2
    Case Is < 5: scrollRate = 3
    Case Is < 7: scrollRate = 4
    Case Is < 9: scrollRate = 5
    Case Else: scrollRate = 6
End Select
If screenX > screenXd Then scrollRate = -scrollRate
screenX = screenX + 1 / TileSize * scrollRate

Select Case Abs(screenY - screenYd)
    Case Is <= 1 / TileSize * 1: scrollRate = 0
    Case Is < 1: scrollRate = 2
    Case Is < 5: scrollRate = 3
    Case Is < 7: scrollRate = 4
    Case Is < 9: scrollRate = 5
    Case Else: scrollRate = 6
End Select
If screenY > screenYd Then scrollRate = -scrollRate
screenY = screenY + 1 / TileSize * scrollRate

'see if the player has stood in a tripwire
game_checkwire -1


'Now that the player has moved, work out what areas of the map
'are safe for baddies.

'Clear the array
 For a = 0 To gamewidth
  For b = 0 To gameheight
  danger(a, b) = 0
 Next b, a

'Fill in the array with the danger amount.
'for the area around the player
'not enough to deter movement, mind you
If p.x < gamewidth Then danger(p.x + 1, p.y) = 1
If p.x < gamewidth - 1 Then danger(p.x + 2, p.y) = 1
If p.x > 0 Then danger(p.x - 1, p.y) = 1
If p.x > 0 + 1 Then danger(p.x - 2, p.y) = 1
If p.y < gameheight Then danger(p.x, p.y + 1) = 1
If p.y < gameheight - 1 Then danger(p.x, p.y + 2) = 1
If p.y > 0 Then danger(p.x, p.y - 1) = 1
If p.y > 0 + 1 Then danger(p.x, p.y - 2) = 1

'for shots
For a = 0 To UBound(s)
  If s(a).live = True And (s(a).own = -1 Or multimode = True) Then
        x = s(a).x
        y = s(a).y
        dangernum = 100
        danger(x, y) = dangernum
        Do While ph_canmovedir(x, y, s(a).face, "s") = True And dangernum > 0
               Select Case s(a).face
               Case 1: y = y - 1
               Case 2: x = x - 1
               Case 3: y = y + 1
               Case 4: x = x + 1
               End Select
               Select Case s(a).mspeed
                    Case Is >= 1: dangernum = dangernum - 8 'slow shots
                    Case 0: dangernum = dangernum - 5 'fast shots (slightly harder to spot)
                    Case -1: dangernum = dangernum - 1 'instant hit
               End Select
               If danger(x, y) < dangernum Then danger(x, y) = dangernum
        Loop
  End If
Next a

'And update the path so they can find the player
game_PathsUpdate "player"

'Now the baddies
For a = 0 To UBound(e)
   'If we are alive
   If e(a).live = True And e(a).x <> -1 Then
   
    If e(a).counter > 0 Then e(a).counter = e(a).counter - 1 / gamespeed
   
    If e(a).health > 0 Then
    ai_Master a 'called every frame
    'ai_CheckEnemyState a
    If e(a).moved > 0 Then
        e(a).moved = e(a).moved - 1
        Else
         ai_moveAI a ' move us
         game_checkwire a 'Did I trip a tripwire?
    End If


   If e(a).shot > 0 Then
   e(a).shot = e(a).shot - 1
   Else
     lastface = e(a).face
     'GoSub ai_shootAI ' Face us the right way
     ai_shootAI a
     
       If e(a).face <> 0 Then
                        action_efire (a) ' If e(a).moved < 1 * gamespeed Then e(a).moved = 1 * gamespeed 'This last bit stops you walking into shots.
                        Else
                        If lastface <> 0 Then e(a).face = lastface Else e(a).face = Int(Rnd * 4) + 1
        End If
   End If
   
   Else ' A body
   If e(a).counter <= 0 Then e(a).live = False
   End If
End If

Next a




'Now the shots
For a = 0 To UBound(s)
    If s(a).live = True Then
         'don't hit your owner on the first frame
        If s(a).oldx <> -1 Then game_checkhit s(a).x, s(a).y, (a)
        
        If s(a).live = True Then
    
            If s(a).moved > 0 Then
                s(a).moved = s(a).moved - 1
            Else
                'allow special shots to collide again
                s(a).bHasHurt = False
                Do
                    s(a).oldx = s(a).x
                    s(a).oldy = s(a).y
                    s(a).moved = s(a).mspeed * gamespeed
                    If ph_canmovedir(s(a).x, s(a).y, s(a).face, "s") = True Then
                        Select Case s(a).face
                        Case 1:  s(a).y = s(a).y - 1
                        Case 3:  s(a).y = s(a).y + 1
                        Case 2:   s(a).x = s(a).x - 1
                        Case 4:  s(a).x = s(a).x + 1
                        End Select
                    Else:
                        If ph_offMapDir(s(a).x, s(a).y, s(a).face) = True Then
                            'off the map - just disappear
                            s(a).live = False
                        Else
                            'hit something, blow up
                            action_sExp a, 0
                        End If
                
                    End If
                    
                    If s(a).oldx <> s(a).x Or s(a).oldy <> s(a).y Then
                        game_checkhit s(a).x, s(a).y, Int(a)
                    End If
               
                Loop While (s(a).mspeed = -1) And s(a).live = True
            End If
        End If
    End If
'If gameon = False Then running = False: Exit Sub  ' IF the player died, we must exit
Next a

'Now the explosions
For a = 0 To UBound(ex)
If ex(a).live = True Then
      'ex(a).frame = ex(a).frame + 0.5 / gamespeed
      'If ex(a).endframe > 3 Then ex(a).frame = ex(a).frame + 1 / gamespeed Else ex(a).frame = ex(a).frame + 0.5 / gamespeed
      ex(a).frame = ex(a).frame + 1 / gamespeed
      If Int(ex(a).frame) >= ex(a).endframe Then ex(a).live = False
End If
Next a

game_moveimages


' Else  'DEBUG frameskip monitor, part 3
' 'we have spare processor power and have time between frames
' If frameskip = False Then frameskip = True

End If 'ends 'If frame is to be updated'

End If 'ends 'If game is on'

finishloop:

DoEvents


If exiting = True Then
          If p.health <= 0 Or bFailed = True Then
                      engine_playsound SoundMusic(1), 0, 0
                      
                      LastTick = GetTickCount()
                      Do
                      DoEvents
                      CurrentTick = GetTickCount()
                      Loop While CurrentTick - LastTick < 1400
                      'fix this - something better here
                      MsgBox "Mission failed", vbOKOnly, "Takedown"
          End If
   game_exitmission
End If


Loop

'running = False

End Sub

'Master AI function
Private Sub ai_Master(ByVal a As Integer)
Dim tempt As Integer
Dim bjustaware As Boolean
Dim stNum As Integer

ai_Awareness a, bjustaware 'determines who we can see + who we are aware of
ai_Target a 'selects a target we are aware of
'ai_shootai a 'called from gameloop

If e(a).bStartled = True Then
    e(a).StartledT = e(a).StartledT + 1 / gamespeed
    stNum = (25 - e(a).skill / 10)
        'This is to stop it crashing when we have no target.
        If e(a).t > -10 Then tempt = e(a).cansee(e(a).t) Else tempt = 0
    If e(a).StartledT > stNum Or ((e(a).StartledT > stNum - 10) And tempt + e(a).skill * 5 > 0) Then
        e(a).bStartled = False
        e(a).StartledT = 100
        'Woken up - from a long time, or
        'a short time while target is right in front of us.
    End If
    
End If

If e(a).bStartled = False Then
    ai_checkEnemyRole a
    ai_checkEnemyAction a
    ai_CheckEnemyState a, bjustaware
End If

End Sub

Private Sub ai_Awareness(ByVal a As Integer, ByRef bjustaware As Boolean)
Dim ch As Integer, b As Integer, odds As Integer

'vars for investigation
Dim checkscore As Integer, checkx As Integer, checky As Integer


e(a).checkscore = e(a).checkscore - 5 'abitrary number.
checkscore = e(a).checkscore

'======================
' CanSee the player
'======================
ch = -1
    If ph_cansee(p.x, p.y, e(a).x, e(a).y) = True Then
        If e(a).cansee(ch) < 0 Then e(a).cansee(ch) = 0
        If e(a).cansee(ch) < 3000 Then e(a).cansee(ch) = e(a).cansee(ch) + 10 / gamespeed
    Else
        If e(a).cansee(ch) > 0 Then e(a).cansee(ch) = 0
        If e(a).cansee(ch) > -3000 Then e(a).cansee(ch) = e(a).cansee(ch) - 10 / gamespeed
    End If
  
'======================
'CanSee enemies
'======================
'we do the check both ways each time, to half the work done.
If a < UBound(e) Then 'last enemy doesn't have to do any
    For ch = a + 1 To UBound(e) 'we don't start from 0 because those below us have already been done by others
        If (e(ch).live = True) And e(ch).x <> -1 Then 'he's real
            'checks for those on our team or allied or neutral are low priority
            'so only do them half the time (double the amount added to compensate)
            b = 0
            If e(ch).team <> e(a).team And team(e(a).team).rel(e(ch).team) = 0 Then b = 1 Else b = 3
            
            If b = 1 Or Rnd < 0.33 Then 'assumes b is 1 or 3.
                If ph_cansee(e(ch).x, e(ch).y, e(a).x, e(a).y) = True Then
                                        If e(a).cansee(ch) < 0 Then e(a).cansee(ch) = 0
                                        If e(a).cansee(ch) < 3000 Then e(a).cansee(ch) = e(a).cansee(ch) + (10 * b / gamespeed)
                                        'Do the same the other way, too
                                        If e(ch).cansee(a) < 0 Then e(ch).cansee(a) = 0
                                        If e(ch).cansee(a) < 3000 Then e(ch).cansee(a) = e(ch).cansee(a) + (10 * b / gamespeed)
                                      Else
                                        If e(a).cansee(ch) > 0 Then e(a).cansee(ch) = 0
                                        If e(a).cansee(ch) > -3000 Then e(a).cansee(ch) = e(a).cansee(ch) - (10 * b / gamespeed)
                                        'Do the same the other way, too
                                        If e(ch).cansee(a) > 0 Then e(ch).cansee(a) = 0
                                        If e(ch).cansee(a) > -3000 Then e(ch).cansee(a) = e(ch).cansee(a) - (10 * b / gamespeed)
                                End If
            End If
        End If
    Next ch
End If
                                                          

'======================
'= Alarm goes off    - all aware.
'======================
If alarm = True And e(a).x > -1 Then e(a).bAllAware = True

'======================
'= AWARENESS CHECKS
'======================

'''' IMPORTANT: I HAVEN'T BOTHERED USING THE FUNCTION AI_SUSPECT IN ALL SITUATIONS
''''            IN SOME PLACES I HAVE THE FULL AI_SUSPECT CODE WRITTEN OUT
'''             THIS SHOULD BE FIXED SOME TIME!
  
       'alternate checks each frame - different for each enemy
       'double odds of detection to compensate!
       
If e(a).bAllAware = False Then

       'first half of checks
       If Int(Int(timepast + e(a).randval) / 2) = (Int(timepast + e(a).randval) / 2) Then
       
       'lower suspicion
       For b = -1 To UBound(e)
         If e(a).bAware(b, 0) = False Then 'only if we're not FULLY aware
                e(a).suspicion(b) = e(a).suspicion(b) - 1 / gamespeed
                If e(a).suspicion(b) < 0 Then e(a).suspicion(b) = 0
         End If
       Next b
         
                e(a).suspiciong = e(a).suspiciong - 1 / gamespeed
         
         'Possibilities:
         'enemy aware - nothing
         'enemy unaware - become more suspicious
         'friend cansee - check target in same manner as before
         'friend can'tsee - nothing
        
         'check player
         If team(e(a).team).rel(-1) = 0 Then 'he is our enemy
                If (e(a).bAware(-1, 0) = False) And e(a).cansee(-1) > 0 Then 'not FULLY aware
                    
                    'increase suspicion
                    odds = Int(60 - ph_GetDist(e(a).x, e(a).y, p.x, p.y) * 5) '1 sq of dist subtracts about 40
                    If odds < 10 Then odds = 10
                    If ai_checkbehind(a, p.x, p.y) = True Then odds = odds * behindMult
                    e(a).suspicion(-1) = e(a).suspicion(-1) + odds / gamespeed
                    e(a).suspiciong = e(a).suspiciong + odds / gamespeed
                    ai_awareness_check a, odds, checkscore, p.x, p.y, -1, -1
                End If
            Else 'he is our friend\neutral, check his target though
                 'player has no target!
         End If
         
        
          
         'CHECK shots
         '
         For ch = 0 To UBound(s)
           If s(ch).live = True Then
               If s(ch).own = -1 Then 'player shot
                    If team(e(a).team).rel(-1) = 2 Or e(a).bAware(s(ch).own, 0) = True Then
                        'we FULLY know who's shooting - who's he shooting at?
                        'player has no target!
                    Else
                        'we can't see him and he's not on our team - become suspicious
                         If ph_cansee(s(ch).x, s(ch).y, e(a).x, e(a).y) Then
                           odds = Int(250 - ph_GetDist(s(ch).x, s(ch).y, e(a).x, e(a).y) * 40)
                           If odds < 30 Then odds = 30
                           odds = Int(odds * s(ch).stealth / 100)
                           If ai_checkbehind(a, s(ch).x, s(ch).y) = True Then odds = odds * behindMult
                           e(a).suspicion(s(ch).own) = e(a).suspicion(s(ch).own) + odds / gamespeed
                            e(a).suspiciong = e(a).suspiciong + odds / gamespeed
                        
                        'More likely to go to a shot when it's closer to the shooter
                        'rather than closer to us, as he normally would have
                        b = ph_GetDist(s(ch).x, s(ch).y, s(ch).shotfrom.x, s(ch).shotfrom.y)
                        If b < 10 Then odds = odds + (10 - b) * 41
                        ai_awareness_check a, odds, checkscore, s(ch).x, s(ch).y, s(ch).shotfrom.x, s(ch).shotfrom.y
                         End If
                    End If
               Else 'nonplayer shot
                    If (e(a).team = e(s(ch).own).team) Or (team(e(a).team).rel(e(s(ch).own).team) = 2) Or e(a).bAware(s(ch).own, 0) = True Then
                        'we FULLY know who's shooting - who's he shooting at?
                        b = e(s(ch).own).t
                        If b <> -10 Then
                        'check if the target is someone we want to detect
                            If b = -1 Then
                                If (team(e(a).team).rel(-1) = 0) And e(a).bAware(b, 0) = False Then
                                    If ph_cansee(s(ch).x, s(ch).y, e(a).x, e(a).y) Then ai_suspect a, b, s(ch).x, s(ch).y, 250, 30, checkscore
                                End If
                            Else
                                If (e(a).team <> e(b).team) And (team(e(a).team).rel(e(b).team) = 0) And e(a).bAware(b, 0) = False Then
                                    If ph_cansee(s(ch).x, s(ch).y, e(a).x, e(a).y) Then ai_suspect a, b, s(ch).x, s(ch).y, 250, 30, checkscore
                                End If
                            End If
                        End If
                    Else
                        'we can't see him and he's not on our team - become suspicious
                         If ph_cansee(s(ch).x, s(ch).y, e(a).x, e(a).y) Then
                           odds = Int(250 - ph_GetDist(s(ch).x, s(ch).y, e(a).x, e(a).y) * 40)
                           If odds < 30 Then odds = 30
                           odds = Int(odds * s(ch).stealth / 100)
                           If ai_checkbehind(a, s(ch).x, s(ch).y) = True Then odds = odds * behindMult
                           e(a).suspicion(s(ch).own) = e(a).suspicion(s(ch).own) + odds / gamespeed
                           e(a).suspiciong = e(a).suspiciong + odds / gamespeed
                           
                           'follow shot from where it's  closest to shooter
                            b = ph_GetDist(s(ch).x, s(ch).y, s(ch).shotfrom.x, s(ch).shotfrom.y)
                            If b < 10 Then odds = odds + (10 - b) * 41
                           
                           ai_awareness_check a, odds, checkscore, s(ch).x, s(ch).y, s(ch).shotfrom.x, s(ch).shotfrom.y
                         End If
                    End If
             
               End If
    
           End If
         Next ch
       
       
       Else ' second half of checks
       
       'Check for enemies
        For ch = 0 To UBound(e)
            If e(ch).live = True And e(ch).x <> -1 And e(a).cansee(ch) > 0 Then
                    If (e(a).team = e(ch).team) Or (team(e(a).team).rel(e(ch).team) = 2) Or e(a).bAware(ch, 0) = True Then
                        'we already FULLY know this enemy - who is he fighting, though?
                        b = e(ch).t
                        If b <> -10 Then
                        If e(ch).health <= 0 Or e(ch).bAware(b, 0) = True Then
                        'check if the target is an enemy we want to detect
                            If b = -1 Then
                                If (team(e(a).team).rel(-1) = 0) And e(a).bAware(b, 0) = False Then
                                     ai_suspect a, b, e(ch).x, e(ch).y, 250, 20, checkscore
                                End If
                            Else
                                If (e(a).team <> e(b).team) And (team(e(a).team).rel(e(b).team) = 0) And e(a).bAware(b, 0) = False Then
                                     ai_suspect a, b, e(ch).x, e(ch).y, 250, 20, checkscore
                                End If
                            End If
                        Else
                            'if he's checking, we copy - no aid to detection!
                            If e(ch).action = "check" And e(a).action <> "check" And e(ch).suspiciong > e(a).suspiciong Then
                            'the suspicion hack and 'checking' hack should stop it going both ways
                            
                            odds = Int(250 - ph_GetDist(e(ch).x, e(ch).y, e(a).x, e(a).y) * 40)
                            If odds < 10 Then odds = 10
                            If ai_checkbehind(a, e(ch).x, e(ch).y) = True Then odds = odds * behindMult
                            ai_awareness_check a, odds, checkscore, e(ch).checkpos(0).x, e(ch).checkpos(0).y, -1, -1
                        
                            End If
                        End If
                        End If
                    Else
                        'we can't see him and he's not on our team - become suspicious
                         
                           odds = Int(60 - ph_GetDist(e(ch).x, e(ch).y, e(a).x, e(a).y) * 40)
                           If odds < 10 Then odds = 10
                           If ai_checkbehind(a, e(ch).x, e(ch).y) = True Then odds = odds * behindMult
                           e(a).suspicion(ch) = e(a).suspicion(ch) + odds / gamespeed
                           e(a).suspiciong = e(a).suspiciong + odds / gamespeed
                           ai_awareness_check a, odds, checkscore, e(ch).x, e(ch).y, -1, -1
                    End If
          End If
          
        Next ch
       '''''''''''
   
        'and explosions - vision and sound
        ''Does not ignore friendly or look for targets
        For ch = 0 To UBound(ex)
          If ex(ch).live = True Then
'''
               If ex(ch).own = -1 Then 'player shot
                    If team(e(a).team).rel(-1) = 2 Or e(a).bAware(ex(ch).own, 0) = True Then
                        'we know who's shooting - who's he shooting at?
                        'player has no target!
                    Else
                        'we can't see him and he's not on our team - become suspicious
                         If ph_cansee(ex(ch).x, ex(ch).y, e(a).x, e(a).y) Then
                           odds = Int(250 - ph_GetDist(ex(ch).x, ex(ch).y, e(a).x, e(a).y) * 40)
                           If odds < 30 Then odds = 30
                           'odds = Int(odds * ex(ch).stealth / 100)
                           If ai_checkbehind(a, ex(ch).x, ex(ch).y) = True Then odds = odds * behindMult
                           e(a).suspicion(ex(ch).own) = e(a).suspicion(ex(ch).own) + odds / gamespeed
                           e(a).suspiciong = e(a).suspiciong + odds / gamespeed
                           
                            ai_awareness_check a, odds, checkscore, ex(ch).x, ex(ch).y, ex(ch).shotfrom.x, ex(ch).shotfrom.y
                         End If
                            'sound as well
                            odds = Int(350 - ph_GetDist(ex(ch).x, ex(ch).y, e(a).x, e(a).y) * 100)
                            If odds < 0 Then odds = 0
                            e(a).suspicion(ex(ch).own) = e(a).suspicion(ex(ch).own) + odds / gamespeed
                            e(a).suspiciong = e(a).suspiciong + odds / gamespeed
                            If odds > 0 Then ai_awareness_check a, odds, checkscore, ex(ch).x, ex(ch).y, -1, -1
                    End If
               Else 'nonplayer shot
                    If (e(a).team = e(ex(ch).own).team) Or (team(e(a).team).rel(e(ex(ch).own).team) = 2) Or e(a).bAware(ex(ch).own, 0) = True Then
                        'we know who's shooting - who's he shooting at?
                        b = e(ex(ch).own).t
                        If b <> -10 Then
                        'check if the target is an enemy we want to detect
                            If b = -1 Then
                                If (team(e(a).team).rel(-1) = 0) And e(a).bAware(b, 0) = False Then
                                    If ph_cansee(ex(ch).x, ex(ch).y, e(a).x, e(a).y) Then ai_suspect a, b, ex(ch).x, ex(ch).y, 250, 30, checkscore
                                    'sound as well
                                    odds = Int(350 - ph_GetDist(ex(ch).x, ex(ch).y, e(a).x, e(a).y) * 100)
                                    If odds < 0 Then odds = 0
                                    e(a).suspicion(b) = e(a).suspicion(b) + odds / gamespeed
                                    ai_awareness_check a, odds, checkscore, ex(ch).x, ex(ch).y, -1, -1
                                End If
                            Else
                                If (e(a).team <> e(b).team) And (team(e(a).team).rel(e(b).team) = 0) And e(a).bAware(b, 0) = False Then
                                    If ph_cansee(ex(ch).x, ex(ch).y, e(a).x, e(a).y) Then ai_suspect a, b, ex(ch).x, ex(ch).y, 250, 30, checkscore
                                    'sound as well
                                    odds = Int(350 - ph_GetDist(ex(ch).x, ex(ch).y, e(a).x, e(a).y) * 100)
                                    If odds < 0 Then odds = 0
                                    e(a).suspicion(b) = e(a).suspicion(b) + odds / gamespeed
                                    e(a).suspiciong = e(a).suspiciong + odds / gamespeed
                                    
                                    ai_awareness_check a, odds, checkscore, ex(ch).x, ex(ch).y, -1, -1
                                End If
                            End If
                        
  
                        End If
                    Else
                        'we can't see him and he's not on our team - become suspicious
                         If ph_cansee(ex(ch).x, ex(ch).y, e(a).x, e(a).y) Then
                           odds = Int(250 - ph_GetDist(ex(ch).x, ex(ch).y, e(a).x, e(a).y) * 40)
                           If odds < 30 Then odds = 30
                           'odds = Int(odds * ex(ch).stealth / 100)
                           If ai_checkbehind(a, ex(ch).x, ex(ch).y) = True Then odds = odds * behindMult
                           e(a).suspicion(ex(ch).own) = e(a).suspicion(ex(ch).own) + odds / gamespeed
                           e(a).suspiciong = e(a).suspiciong + odds / gamespeed
                           
                            ai_awareness_check a, odds, checkscore, ex(ch).x, ex(ch).y, ex(ch).shotfrom.x, ex(ch).shotfrom.y
                         End If
                        'sound
                        odds = Int(350 - ph_GetDist(ex(ch).x, ex(ch).y, e(a).x, e(a).y) * 100)
                        If odds < 0 Then odds = 0
                        e(a).suspicion(ex(ch).own) = e(a).suspicion(ex(ch).own) + odds / gamespeed
                        e(a).suspiciong = e(a).suspiciong + odds / gamespeed
                    
                        ai_awareness_check a, odds, checkscore, ex(ch).x, ex(ch).y, -1, -1
                    End If
             
               End If
                 
          End If
        Next ch
         
End If 'end of second half of awareness checks
         
'If e(a).bAllAware = False Then 'already in this one

' Become aware
' Total awareness is only allowed if we can actually see him
' Otherwise, we go for partial awareness.

      'as well as being aware of individuals, we have a global awareness
      'used to check for disturbances
                    
                    'the follow thing is a hack - following someone aware,
                    'you stay aware yourself.
                    If (e(a).following >= 0) Then If e(e(a).following).bAwareG = True Then e(a).suspiciong = 210 - e(a).skill * 2
      
                    If (e(a).suspiciong + e(a).skill * 2 > 210) Then
                        e(a).bAwareG = True
                        'Don't let suspicion get any higher - we want it to
                        'wear off immediately
                        e(a).suspiciong = 210 - e(a).skill * 2
                    Else
                        
                        e(a).bAwareG = False
                    End If


          For ch = -1 To UBound(e)
                b = 0
                'for player
                If ch < 0 Then If (team(e(a).team).rel(-1) = 0) Then b = 1
                'or for enemy
                If ch >= 0 Then If ch <> a And (e(a).team <> e(ch).team) And (team(e(a).team).rel(e(ch).team) = 0) Then b = 1
     
                If e(a).bAware(ch, 0) = True Then b = 0
                'never look if we already know
     
                If b = 1 Then 'wether p or e, we should continue
                
                    'Full awareness - req 300 suspect + cansee
                    'When startled, awareness is suspended
                    If (e(a).bStartled = False) And (e(a).suspicion(ch) + e(a).skill * 2 > 300) And (e(a).cansee(ch) > (101 - e(a).skill)) Then
                    If ai_awareness_justaware(a, bjustaware) = False Then e(a).bAware(ch, 0) = True
                    e(a).bAware(ch, 0) = True 'become aware when we are startled. For now.
                    'FIX THIS FIXME
                    End If
                    
                    'Mostly awareness - req 275 suspect
                    If (e(a).suspicion(ch) + e(a).skill * 2 > 275) Then
                    e(a).bAware(ch, 1) = True
                    End If
                    
                    'Suspicious awareness - req 210 suspect (skillful enemies start from 200)
                    If (e(a).suspicion(ch) + e(a).skill * 2 > 210) Then
                    e(a).bAware(ch, 2) = True
                    End If
                    
                End If
          Next ch
       
       
      ''''''''''''''''''END OF AWARENESS CHECKS


Else 'if we're always aware
    For ch = -1 To UBound(e)
    e(a).bAware(ch, 0) = True
    e(a).bAware(ch, 1) = True
    e(a).bAware(ch, 2) = True
    Next ch
    
End If

e(a).checkscore = checkscore

End Sub
'update the most suspicious position?
Private Sub ai_awareness_check(ByRef a As Integer, ByRef odds As Integer, ByRef checkscore As Integer, ByVal checkx As Integer, ByVal checky As Integer, ByVal check2x As Integer, ByVal check2y As Integer)
    
    If odds > checkscore Then
        checkscore = odds
        e(a).checktime = timepast
        e(a).checkpos(0).x = checkx
        e(a).checkpos(0).y = checky
    
        If check2x > -1 Then
          e(a).checkpos(1).x = check2x
          e(a).checkpos(1).y = check2y
        End If
    
    End If

End Sub

Private Function ai_awareness_justaware(ByRef a As Integer, ByRef bjustaware As Boolean) As Boolean

'startledt of 100 means you've been shocked before.
If ai_aware(a) = False And e(a).StartledT < 100 Then
   If bjustaware = False Then engine_addspeech a, 2, Int((UBound(SoundSeen) + 1) * Rnd), 10, True
   bjustaware = True
   e(a).bStartled = True
   e(a).StartledT = 0
   ai_awareness_justaware = True
End If

End Function

Private Sub ai_Target(ByVal a As Integer)
'copies from ai_checkenemystate
Dim dist As Integer, oldT As Integer, b As Integer, ch As Integer

If multimode = True Then
        '-new target selection-
        'With multicode: Select an enemy we are FULLY aware of as target
    dist = 999
    oldT = e(a).t
    e(a).t = -10
        'player
        If e(a).bAware(-1, 0) And p.health > 0 And team(e(a).team).rel(-1) = 0 Then
            dist = ph_GetDist(e(a).x, e(a).y, p.x, p.y)
            e(a).t = -1
        End If
    'other enemies
    For b = 0 To UBound(e)
        If e(b).live = True And e(a).bAware(b, 0) And e(b).x > -1 And a <> b And e(b).health >= 0 And e(a).team <> e(b).team And team(e(a).team).rel(e(b).team) = 0 Then
            ch = ph_GetDist(e(a).x, e(a).y, e(b).x, e(b).y)
            If e(b).t = a Then ch = ch - 4  'he's after me: More of a threat
                If ch < dist Then
                    dist = ch
                    e(a).t = b
                End If
        End If
    Next
    
    If e(a).t <> oldT Then
        e(a).bEngage = False
    End If
      'End -new target selection-

End If 'if no multimode -  stay with 1st target (the player)

'x = ai_tX(a)
'y = ai_tY(a)
'dist = ph_GetDist(e(a).x, e(a).y, x, y)


End Sub


Private Sub ai_shootAI(ByVal a As Integer)
Dim x As Integer, y As Integer, b As Integer
'from Game_Loop

e(a).face = 0
x = ai_tX(a)
y = ai_tY(a)

'target of -10 means no target
If e(a).t = -10 Then Exit Sub

'Don't bother firing if we're that far away
'unless we're a sniper - then we may fire from offscreen
'fix this - assumes shot type 4 is the only instant hit
If e(a).shottype <> 4 And ph_GetDist(e(a).x, e(a).y, x, y) > maxViewDist Then Exit Sub

'sometimes we hesitate for a frame or two
 For b = 1 To gamespeed
 If Rnd * 200 > e(a).skill Then Exit Sub
 Next b

If e(a).bEngage = False Then Exit Sub
If e(a).bAware(e(a).t, 0) = False Then Exit Sub
    
    If Abs(x - e(a).x) > 2 And Abs(y - e(a).y) > 2 Then
         e(a).face = 0
    Else
        If Abs(x - e(a).x) > Abs(y - e(a).y) Then
               If ph_cansee1d("y", e(a).x, x, e(a).y) = True And ph_cansee1d("x", e(a).y, y, x) = True Then
                  ' Y mode
                  If x > e(a).x Then
                                   e(a).face = 4
                                    Else
                                    e(a).face = 2
                                    End If
                Else: e(a).face = 0
                End If
               'check for clear shot.
          Else
          ' X mode
              If ph_cansee1d("x", e(a).y, y, e(a).x) = True And ph_cansee1d("y", e(a).x, x, y) = True Then
                               If y > e(a).y Then
                               e(a).face = 3
                               Else
                               e(a).face = 1
                               End If
              Else: e(a).face = 0
              End If
            ' Check to see if we have a clear shot.

        End If
     End If

    ' If we are really close, only fire when you have a direct shot.
    If e(a).face <> 0 And Abs(x - e(a).x) < 3 And Abs(y - e(a).y) < 3 Then
        If e(a).x <> x And e(a).y <> y Then e(a).face = 0
    End If
      
      
   If e(a).t = -1 Then 'only use clever stuff on player
   
   'If he's been dodging (moving sideways relative to us) and we just spotted em
   If (p.moved <> -1 Or Rnd > 0.6 / gamespeed) And p.lastmove <> 0 And p.lastmove <> e(a).face And p.lastmove <> e(a).face + 2 And p.lastmove <> e(a).face - 2 Then
    If e(a).cansee(e(a).t) < 100 - e(a).skill Then e(a).face = 0 'Don't shoot, we just seen 'em
   End If

    End If

  'If we are fighting and don't have a clear shot, start the timer - soon we'll move up.
  If e(a).state = "fighting" Then
   If e(a).face = 0 And (e(a).x = x Or e(a).y = y) And e(a).counter <= 0 Then e(a).counter = 20 Else e(a).counter = 0
  End If
  
End Sub
'Returns lowest awareness level (if that makes sense)
Private Function ai_AnyAware(ByRef a As Integer) As Integer
Dim b As Integer, c As Integer
Dim level As Integer
level = 3

For b = -1 To UBound(e)

    If b < 0 Then 'player
         If team(e(a).team).rel(-1) = 0 Then
            For c = 2 To 0 Step -1
            If c < level Then If e(a).bAware(b, c) = True Then level = c
            Next c
        End If
    Else 'enemy
        If e(b).live = True And b <> a And team(e(a).team).rel(e(b).team) = 0 Then
            For c = 2 To 0 Step -1
            If c < level Then If e(a).bAware(b, c) = True Then level = c
            Next c
        End If
    End If
Next b

ai_AnyAware = level

End Function

Private Function ai_GetEnemyRole(ByVal a As Integer) As eSuspect
'roles
'0      1       2       3        4       5       6       7       8      9
'stand  wander  patrol  command  check   gethelp hide    guard   ignore seek

ai_GetEnemyRole = ai_getEnemyRoleTy(a, ai_AnyAware(a))



End Function

Private Function ai_getEnemyRoleTy(a As Integer, b As Integer) As eSuspect
Dim c As eSuspect

Select Case b
    Case Is > 2, Is < 0: c = e(a).actUnaware
    Case 2: c = e(a).actSuspect
    Case 1: c = e(a).actAware
    Case 0: c = e(a).actFullAware
End Select

     '   Select Case c ' 1=wander,2=stand,3=patrol,4=hide,5=guard,6=command
     '       Case Cl_wander: ai_getEnemyRoleTy = 1
     '       Case Cl_stand: ai_getEnemyRoleTy = 2
     '       Case Cl_patrol: ai_getEnemyRoleTy = 3
     '       Case Cl_hide: ai_getEnemyRoleTy = 4
     '       Case Cl_guard: ai_getEnemyRoleTy = 5
     '       Case Cl_command: ai_getEnemyRoleTy = 6
     '   End Select
    
ai_getEnemyRoleTy = c

End Function

''''''''''''''''''''''''''''''''''''''''''''
' VISION, DISTANCE, AI STUFF '''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''

' Level 1 AI control
'DEPENDANCIES:  LOS and awareness
'SETS: enemy Role, Action
Private Sub ai_checkEnemyRole(ByRef a As Integer)
Dim oldrole As eSuspect
oldrole = e(a).role
e(a).role = ai_GetEnemyRole(a)


Select Case e(a).role
    Case cl_guard:
    
        If ph_GetDist(e(a).x, e(a).y, e(a).guard.x, e(a).guard.y) > 8 And e(a).state <> "return" Then
    
            e(a).action = "return"
            e(a).actionT = 0
            e(a).actionV = 0 'just set
        End If
    
End Select

' 1=wander,2=stand,3=patrol,4=hide,5=guard,6=command

End Sub

'Level 2 AI control
'DEPENDANCIES:  Role
Private Sub ai_checkEnemyAction(ByRef a As Integer)
Dim oldstate As String
Dim bNewAction As Boolean
Dim b As Integer, c As Integer, d As Integer, closest As Integer


e(a).x = e(a).x

'increase the action timer
e(a).actionT = e(a).actionT + 1

oldstate = e(a).state

'Already in an action
If e(a).action <> "" Then
    Select Case e(a).action
        Case "check"
        'check Vartypes:
        '0 look 1 wait 2 look further 3 wait more 4 go home
        'make us keep chasing the most recent, suspicious thing
            If e(a).actionV = 0 Then
                e(a).finaldest.x = e(a).checkpos(0).x
                e(a).finaldest.y = e(a).checkpos(0).y
                
             If e(a).actionT = 10 And e(a).bfollowed = False Then engine_addspeech a, 4, Int((UBound(SoundCheck) + 1) * Rnd), 10, True

                
            ElseIf e(a).actionV = 2 Then
                e(a).finaldest.x = e(a).checkpos(1).x
                e(a).finaldest.y = e(a).checkpos(1).y
            ElseIf e(a).actionV >= 3 And e(a).actionV < 20 Then 'mostly finished checking
                
                If e(a).checktime = timepast And e(a).bAwareG = True Then
                'another disturbance - start the search all over
                e(a).actionV = 0 'go back to first look state
                ai_Runto a, e(a).checkpos(0).x, e(a).checkpos(0).y, oldstate, 0
                End If
                
            ElseIf e(a).actionV >= 90 Then
            'finished checking
                
                'Go back to normal, for now.
                    bNewAction = True

            End If
            
        'checkers find friends
        If e(a).actionV <= 2 Then 'if we're still investigating, call for help
          For b = 0 To UBound(e)
            'is this a friend
            If e(b).live = True And e(b).health > 0 Then
            If (e(a).team = e(b).team) Or team(e(a).team).rel(e(b).team) = 2 Then
            'can we see him, are we more suspicous than he is?
                ai_CheckEnemyAction_follow a, b, 0
            End If
            End If
          Next b
            
        End If
            
        Case "follow"
        ' 0 follow,  > 90 gohome
        'make us keep chasing the most recent, suspicious thing
            If e(a).actionV = 0 And e(a).following > -10 Then
                
                'if he's dead, or
                'we're aware, or
                'he has stopped checking and still isn't aware, or
                'he has started to go home after checking, then abort.
                
                If e(a).following <> -1 Then
                'Gathers should be followed, still, since they ARE aware
                
                    If (e(e(a).following).health <= 0) Or (e(e(a).following).live = False) Or (ai_AnyAware(a) <= 0) Or (e(e(a).following).action <> "check" And ai_AnyAware(e(a).following) < 0) Or (e(e(a).following).action = "check" And (e(e(a).following).actionV > 4 Or (e(e(a).following).actionV > 3 And e(e(a).following).actionT > 10))) Then
                        
                 If (e(e(a).following).health <= 0) Then 'leader has been killed!
                        
                      bNewAction = True
                      e(a).action = ""   'This should allow us to Check
                                         'the shot that killed our leader
                      e(a).following = -10
                        
                        Else 'leader not killed
                    
                            'lets go home then
                            e(a).actionV = 1
                            If e(a).check.bHome = True Then
                                ai_Runto a, e(a).home.x, e(a).home.y, e(a).nextstate, 0
                            Else
                                bNewAction = True
                                e(a).following = -10
                            End If
                        End If
                        
                    Else
                        'Go where he is, or where he's going.
                        If e(e(a).following).state = "runto" Then
                            e(a).finaldest.x = e(e(a).following).finaldest.x
                            e(a).finaldest.y = e(e(a).following).finaldest.y
                        Else
                            e(a).finaldest.x = e(e(a).following).x
                            e(a).finaldest.y = e(e(a).following).y
                        
                        End If
                            e(a).checkpos(0).x = e(a).finaldest.x
                            e(a).checkpos(0).y = e(a).finaldest.y
                            e(a).checkpos(1).x = e(a).finaldest.x
                            e(a).checkpos(1).y = e(a).finaldest.y
                        
                        If e(a).state <> "runto" Then
                          ai_Runto a, e(a).finaldest.x, e(a).finaldest.y, e(a).nextstate, 0
                        End If
                    End If
                    
                
                Else 'following the player
                        e(a).finaldest.x = p.x
                        e(a).finaldest.y = p.y
                    
                    If e(a).state <> "runto" Then
                        'Following player has higher priority than an NPC
                      ai_Runto a, e(a).finaldest.x, e(a).finaldest.y, e(a).nextstate, 1
                    End If
                
                End If
                
            ElseIf e(a).actionV >= 90 Then
            'going back to normal
            bNewAction = True
            e(a).following = -10
            End If
            

            
        Case "patrol"
        ' if we're not patrolling, always abort.
        If e(a).role <> Cl_patrol Then bNewAction = True
            
        Case "return"
        
        If e(a).actionV = 0 Then 'it was just set. Let's go home
            e(a).actionV = 1 'going home
            ai_Runto a, e(a).guard.x, e(a).guard.y, oldstate, 1
        
        ElseIf e(a).actionV = 1 Then 'we are going home
            'abort if it's been too long
            b = ph_GetDist(e(a).x, e(a).y, e(a).guard.x, e(a).guard.y)
                If (b <= 2) Or (b <= 4 And e(a).actionT > 80) Then
                    bNewAction = True
                    'try to stop us immediately checking the same location!
                End If
            
        End If
            
        Case "seek"
        'seekers find help, similar code to 'checkers find friends
        
            For b = 0 To UBound(e)
            'is this a friend
            If e(b).live = True And e(b).health > 0 Then
            If (e(a).team = e(b).team) Or team(e(a).team).rel(e(b).team) = 2 Then
            'can we see him, is he unaware
                ai_CheckEnemyAction_follow a, b, 1
            End If
            End If
          Next b
        
        Case "gather"
        'Gatherers find help, similar code to 'checkers find friends
        
          For b = 0 To UBound(e)
            'is this a friend
            If e(b).live = True And e(b).health > 0 Then
            If (e(a).team = e(b).team) Or team(e(a).team).rel(e(b).team) = 2 Then
            'can we see him, NOT are we more suspicous than he is
                ai_CheckEnemyAction_follow a, b, 2
            End If
            End If
          Next b
            
          'Have we got enough friends?
         If e(a).gethelpNum >= e(a).gethelpMax Or e(a).actionV >= 99 Then
            e(a).gethelpb = False 'Never get help again
            'If e(a).state = "runto" Then e(a).state = e(a).nextstate
            e(a).action = ""
            bNewAction = True
         
            If e(a).gethelpNum > 0 And e(a).gethelpNum > e(a).gethelpMax / 2 Then
                    'gathering worked (more or less)
                    engine_addspeech a, 11, Int((UBound(soundGatherWork) + 1) * Rnd), 10, True
                Else
                    'gathering didnt.
                    engine_addspeech a, 10, Int((UBound(soundGatherFail) + 1) * Rnd), 10, True
            End If
         
         End If
        
            
    End Select
End If

'Check can override any other action except gather and follow!
    'should we check? If we smell something and aren't fully aware
    If (e(a).action <> "check") And (e(a).action <> "follow") And (e(a).action <> "gather") And (ai_AnyAware(a) > 0) And (e(a).bAwareG) And (e(a).following <= -10 Or e(a).following >= 0) Then
         e(a).action = "check"
         e(a).actionV = 0 'investigating
         e(a).actionT = 0
         e(a).bfollowed = False 'no-one is following us yet (for speech)
         
         If e(a).home.x < 0 Then e(a).home.x = e(a).x
         If e(a).home.y < 0 Then e(a).home.y = e(a).y
         ai_Runto a, e(a).checkpos(0).x, e(a).checkpos(0).y, oldstate, 0
                     

         bNewAction = False
    End If

'Follow can override any other action, just like check.
'Special condition for allies following player
    If (e(a).action <> "follow") And (ai_AnyAware(a) > 0 Or (e(a).following = -1 And ph_GetDist(e(a).x, e(a).y, p.x, p.y) >= 6)) And (e(a).following > -10) Then
         e(a).action = "follow"
         e(a).actionV = 0
         e(a).actionT = 0
         
         If e(a).following = -1 Then 'player
         
         ai_Runto a, p.x, p.y, oldstate, 0
         
         Else 'non-player leader
         
         If e(e(a).following).action = "gather" Then
            'We've been gathered - don't gather for ourselves
            'unless we're the first he found,
            'then we can daisychain
            If e(e(a).following).gethelpNum <> 0 Then
                'we won't gather
                e(a).gethelpb = False
            End If
            
           e(e(a).following).gethelpNum = e(e(a).following).gethelpNum + 1
         
         
         End If
         
         ai_Runto a, e(e(a).following).x, e(e(a).following).y, oldstate, 0
         
         End If
         
         e(a).bfollowed = False 'no-one is following us yet (for speech)
         
         If e(a).home.x < 0 Then e(a).home.x = e(a).x
         If e(a).home.y < 0 Then e(a).home.y = e(a).y
         
         bNewAction = False
    End If

'Seek can override any other action except return and gather
'Special provision for those following the player
    If (e(a).action <> "seek") And (e(a).action <> "gather") And (e(a).action <> "return") And (ai_AnyAware(a) = 0) And (e(a).t > -10) And (e(a).following <> -1 Or ph_GetDist(p.x, p.y, e(a).x, e(a).y) < 5) Then
        
        e(a).action = "seek"
         e(a).actionV = 0 'just seeking
         e(a).actionT = 0
         e(a).state = "seeking"

        bNewAction = False
    End If

'Gather can override any other action except return and follow
    If (e(a).action <> "gather") And (e(a).action <> "return") And (e(a).action <> "follow") And (ai_AnyAware(a) = 0) And (e(a).gethelpb = True) And (e(a).gethelpNum < e(a).gethelpMax) Then
         e(a).action = "gather"
         e(a).actionV = 0 'going home
         e(a).actionT = 0
         If e(a).home.x < 0 Then e(a).home.x = e(a).x
         If e(a).home.y < 0 Then e(a).home.y = e(a).y
         ai_Runto a, e(a).guard.x, e(a).guard.y, oldstate, 1 'priority 1
         bNewAction = False
    End If

'Select a default action
If e(a).action = "" Or bNewAction = True Then

' 1=wander,2=stand,3=patrol,4=hide,5=guard,6=command
    Select Case e(a).role
        Case 1: e(a).action = "wander": e(a).state = "waiting"
        Case 2: e(a).action = "stand": e(a).state = "standing"
        
        Case 3: e(a).action = "patrol"
            If e(a).patrolIndex < 0 Then
                'select nearest patrol point
                d = 9999 'starting dist
                closest = -1
                For b = 0 To UBound(psq)
                    If psq(b).live = True And psq(b).group = e(a).patrolRoute Then
                        c = ph_GetDist(psq(b).x, psq(b).y, e(a).x, e(a).y)
                        If c < d Then d = c: closest = b
                    End If
                Next b
            
                e(a).patrolIndex = closest
            End If
            
            If e(a).patrolIndex <= -1 Then
                e(a).action = ""
            Else
            e(a).actionV = 0
            e(a).actionT = 0
            ai_Runto a, psq(e(a).patrolIndex).x, psq(e(a).patrolIndex).y, oldstate, 0
            End If
        
        
        Case 4: e(a).action = "stand": e(a).state = "standing" 'hide!
        Case 5: e(a).action = "stand": e(a).state = "standing" 'guard!
        Case 6: e(a).action = "stand": e(a).state = "standing"  'Command!

        End Select

End If

If e(a).state <> oldstate Then
    ai_newstate a
End If

End Sub
'followtype: 0 = check, 1 = seek, 2 = gather
Private Sub ai_CheckEnemyAction_follow(ByVal a As Integer, ByVal b As Integer, ByRef followtype As Integer)
Dim bDoit As Boolean, dist As Integer

    dist = ph_GetDist(e(a).x, e(a).y, e(b).x, e(b).y) - 3
    If dist < 0 Then dist = 0

'manage the different criteria for the 3 types of following
Select Case followtype
    Case 0:
        If e(a).cansee(b) > dist * 40 And dist < 10 - 3 And e(a).cansee(b) > 0 And e(a).suspiciong > e(b).suspiciong + 20 And (ai_AnyAware(b) > 0) And (e(b).following = -10) Then bDoit = True
    Case 1:
        If e(a).cansee(b) > dist * 40 And dist < 10 - 3 And e(a).cansee(b) > 0 And (ai_AnyAware(b) > ai_AnyAware(a)) And (e(b).following = -10) Then bDoit = True
    Case 2:
        If e(a).cansee(b) > dist * 40 And dist < 10 - 3 And e(a).cansee(b) > 0 And (ai_AnyAware(b) > 0) And (e(b).following = -10) Then bDoit = True
End Select

If bDoit = True Then
    
    If e(b).following = -10 Then
    
    e(b).following = a
    e(b).bAwareG = True
    
    If e(a).t > -10 Then
        e(b).bAware(e(a).t, 1) = True 'We recieve 'aware' awareness
    End If                        'of this enemy (not full aware though)
    
    If followtype = 0 Or followtype = 2 Then e(a).bfollowed = True 'only for checkers
            
    Select Case followtype
        Case 0:
            engine_addspeech a, 5, Int((UBound(SoundCheckF) + 1) * Rnd), 10, True
            'make him reply, too
            engine_addspeech b, 6, Int((UBound(SoundYesCheck) + 1) * Rnd), 10, True
        Case 1:
            engine_addspeech a, 8, Int((UBound(soundSeekF) + 1) * Rnd), 10, True
            engine_addspeech b, 9, Int((UBound(soundSeekYes) + 1) * Rnd), 10, True
        Case 2:
            engine_addspeech a, 12, Int((UBound(soundGatherF) + 1) * Rnd), 10, True
            engine_addspeech b, 13, Int((UBound(soundGatherYes) + 1) * Rnd), 10, True
    End Select
        
    End If
End If
               
End Sub

'higher gamespeed = lower odds of stuff changing.
Private Sub ai_CheckEnemyState(ByVal a As Integer, bjustaware As Boolean)
Dim oldstate As String
Dim dist As Integer
Dim ch As Integer
'Dim odds As Integer
Dim b As Integer
'Dim bjustaware As Boolean
Dim x As Integer, y As Integer
'Dim oldT As Integer

x = ai_tX(a)
y = ai_tY(a)
dist = ph_GetDist(e(a).x, e(a).y, x, y)

oldstate = e(a).state

If e(a).state = "" Then MsgBox "No state!": e(a).state = "seeking"

Select Case LCase$(oldstate)

 Case "runto"
       'If patrolling, attack player on sight
         If (e(a).orderpriority = 0 And ai_tAware(a)) Or (e(a).orderpriority = 1 And alarm = True) Then
           'If (bjustaware) Then e(a).state = "startled" Else
           e(a).state = "seeking"
         End If
       If e(a).orderpriority > 0 And ai_tAware(a) = True Then
            If e(a).cansee(e(a).t) > 0 Then e(a).bEngage = True Else e(a).bEngage = False
       End If
       
       'ch = ai_PathTo(e(a).finaldest.x, e(a).finaldest.y)
       b = ph_GetDist(e(a).finaldest.x, e(a).finaldest.y, e(a).x, e(a).y)
       
       'If we have arrived
       If b = 0 Or (ph_canmove(e(a).finaldest.x, e(a).finaldest.y) = False And b = 1 And e(a).orderpriority < 2) Then
           Select Case e(a).action
           Case "check" '0 - investigating. 1 - waiting. 2 - look closer? 3 waiting. 4 - returning.
                Select Case e(a).actionV
                    Case 0, 2: 'got to the investigate spot
                             'If we don't wanna go home, maybe end here.
                            If e(a).actionV = 2 And e(a).check.bHome = False Then
                                e(a).state = e(a).nextstate
                                e(a).actionV = 99 'finished
                            Else
                            
                            e(a).state = "standing"
                            e(a).actionV = e(a).actionV + 1
                            e(a).actionT = 0 'reset Action Timer.
                            End If
                            
                    Case 4: 'We've got back home.
                            e(a).state = e(a).nextstate
                            e(a).actionV = 99 'finished
                            
                    Case Else
                End Select
                
           Case "follow"
                Select Case e(a).actionV
                    Case 0:
                    'e(a).actionV = 1
                    'ai_Runto a, e(a).home.x, e(a).home.y, e(a).nextstate, 0
                    'e(a).actionT = 0
                    'arriving at the guy we're following doesn't change anything
                    'we just keep following
                    Case 1:
                    'this means we've returned home
                            e(a).state = e(a).nextstate
                            e(a).actionV = 99 'finished
                End Select
                
           Case "patrol" ' 0 = running to next spot
                Select Case e(a).actionV
                    Case 0: 'got to the patrol point
                            e(a).state = "standing"
                            e(a).actionV = e(a).actionV + 1
                            e(a).actionT = 0 'reset Action Timer.
                            
                End Select
            
            
           Case "gather"
                            e(a).state = e(a).nextstate
                            e(a).actionV = 99 'finished
           
            
           Case Else 'normal runto
                            If e(a).nextstate = "" Or e(a).nextstate = "runto" Then
                                 e(a).state = "seeking"
                              Else
                                e(a).state = e(a).nextstate
                            End If
                                e(a).nextstate = ""
               
            End Select
       End If
        
       Case "seeking"
       
       If e(a).t = -10 Then
        e(a).state = "waiting"
       Else
        If e(a).cansee(e(a).t) > 0 Then
              If dist > e(a).fightDisMax Then
              e(a).state = "charging"
              Else
              e(a).state = "fighting"
              End If
        Else
        'fix this - pursuit distace, 7, sound be a const
            If e(a).Attitude = At_Cautious And alarm = False And e(a).cansee(e(a).t) < -300 And dist > 7 Then e(a).state = "waiting"
            If e(a).Attitude = at_defensive And e(a).cansee(e(a).t) < -300 And dist > 7 Then e(a).state = "standing"
        End If
       End If
       
       Case "charging"
       
       If e(a).t = -10 Then
            e(a).state = "waiting"
        Else
          If e(a).cansee(e(a).t) < -200 Then e(a).state = "seeking"
          If e(a).cansee(e(a).t) > 50 And dist <= e(a).fightDisMax Then e(a).state = "fighting"
       End If
  
       Case "fighting"
       If e(a).t = -10 Then
        e(a).state = "waiting"
       Else
       If dist > e(a).fightDisMax Then
         If e(a).Attitude = at_cowardly Then e(a).state = "fleeing" Else e(a).state = "charging"
       ElseIf e(a).cansee(e(a).t) < -200 And e(a).Attitude <> at_cowardly Then e(a).state = "seeking"
       ElseIf dist < e(a).fightDisMin Then e(a).state = "retreating"
       ElseIf dist < e(a).fightDisMin + 2 Then If Rnd > 0.5 Then e(a).state = "surrounding" Else e(a).state = "retreating"
       ElseIf e(a).tactictime <= 0 Then e(a).state = "surrounding"
       ElseIf e(a).counter > 0 And e(a).counter < 5 Then e(a).state = "seeking"
       ElseIf e(a).Attitude = at_cowardly And e(a).cansee(e(a).t) <= 0 Then e(a).state = "fleeing"
       End If
       End If
       
       
       Case "camping"
       If y = e(a).y And ph_cansee1d("y", e(a).x, x, e(a).y) Then e(a).state = "fighting"
       If x = e(a).x And ph_cansee1d("x", e(a).y, y, e(a).x) Then e(a).state = "fighting"
       If alarm = True And (e(a).Attitude = At_Agressive Or e(a).Attitude = At_Cautious) Then e(a).state = "seeking"
               
 Case "standing", "waiting"

       'Just became aware, shock, horror!
       If (bjustaware) Then
       '     e(a).state = "startled"
       Else
         'If e(a).t > -10 Then 'we have a target
         If ai_tAware(a) Then
           'If we're agressive, get going
           If e(a).Attitude = At_Agressive Then e(a).state = "seeking"
           'If we're cautious and the alarm is off, get going
           If e(a).Attitude = At_Cautious And alarm = True Then e(a).state = "seeking"
           'If we're defensive (or cautious) seek when we see him
           If (e(a).Attitude = at_defensive Or e(a).Attitude = At_Cautious) And e(a).cansee(e(a).t) > 0 Then e(a).state = "seeking"
         End If
         'End If
       
       'if nothing happened there
          If e(a).state = "standing" Or e(a).state = "waiting" Then
            Select Case e(a).action
                Case "check"
                Select Case e(a).actionV
                    Case 1, 3: 'secondary investigation or go home
                            
                          If e(a).actionV = 1 And e(a).checkpos(1).x > -1 And e(a).actionT > (110 - e(a).skill) / 2 Then
                                ai_Runto a, e(a).checkpos(1).x, e(a).checkpos(1).y, e(a).nextstate, 0
                                e(a).actionV = 2
                                e(a).actionT = 0
                           ElseIf e(a).actionT > 40 Then
                                ai_Runto a, e(a).home.x, e(a).home.y, e(a).nextstate, 0
                                e(a).actionV = 4
                                e(a).actionT = 0
                                
                                'Say we have finished.
                                engine_addspeech a, 7, Int((UBound(soundCheckStop) + 1) * Rnd), 10, True
                                
                           End If
                        
                End Select
                
                Case "patrol"
                    Select Case e(a).actionV
                    Case 1: 'waiting at a patrol spot
                
                        If e(a).actionT > 25 Then 'move on
                            e(a).actionT = 0
                            e(a).actionV = 0
                            e(a).patrolIndex = e(a).patrolIndex + 1
                            
                            ch = -1
                            
                            
                            For b = 0 To UBound(psq)
                                If psq(b).live = True And (psq(b).group = e(a).patrolRoute) And (psq(b).Index = e(a).patrolIndex) Then ch = b
                            Next b
                            
                            
                            If ch = -1 Then
                                e(a).patrolIndex = 0 'end of patrol route, restart it
                                e(a).patrolbReport = False
                                
                                For b = 0 To UBound(psq)
                                    If psq(b).live = True And (psq(b).group = e(a).patrolRoute) And (psq(b).Index = e(a).patrolIndex) Then ch = b
                                Next b
                            End If
                            
                            ai_Runto a, psq(ch).x, psq(ch).y, oldstate, 0
                        End If
                    End Select
            End Select
          End If
       End If
        
      ' Case "startled"
      ' If e(a).counter <= 0 Or (e(a).counter <= 10 And e(a).cansee(e(a).t) + e(a).skill * 5 > 0) Then
      '     If e(a).Attitude = at_cowardly Then
      '     e(a).state = "fleeing"
      '     Else
      '          If (e(a).Attitude = At_Agressive) Or (e(a).Attitude = At_Cautious And alarm = True) Or ((e(a).Attitude = at_defensive Or e(a).Attitude = At_Cautious) And e(a).cansee(e(a).t) > 0) Then
      '          If dist > e(a).fightDisMax Or e(a).cansee(e(a).t) < 0 Then
      '          e(a).state = "seeking"
      '          Else
      '          e(a).state = "fighting"
      '          End If
      '        End If
      '     End If
      ' End If
      '
      ' 'When we cease being startled, we become aware 'FIX THIS FIXME - shouldn't go fully aware yet
      ' If e(a).state <> "startled" Then e(a).bAware(e(a).t, 0) = True
      '
       Case "surrounding"
       
       If e(a).t = -10 Then
         e(a).state = "waiting"
       Else
            If e(a).tactictime <= 0 Then e(a).state = "fighting"
            If e(a).cansee(e(a).t) < -300 Then e(a).state = "charging"
       'If dist < 3 Then e(a).state = "retreating"
       End If
       
       Case "retreating"
         If e(a).t = -10 Then
            e(a).state = "waiting"
         Else
            If e(a).Attitude = at_cowardly Then
                If dist > 6 Or e(a).cansee(e(a).t) < 0 Then e(a).state = "fleeing"
            Else
                If dist > e(a).fightDisMin * 2 Or e(a).cansee(e(a).t) < 0 Then e(a).state = "fighting"
            End If
        End If
       Case "fleeing"
       'Never stop fleeing
       'If e(a).cansee > 300 Then e(a).bEngage = True
       
End Select
                                    'FIX THIS FIXME - maybe?
'If bjustaware And e(a).state <> "startled" Then e(a).bAware(e(a).t, 0) = True

If e(a).state <> oldstate Then
    ai_newstate a
End If

End Sub
'clear variables for when our state changes
Private Sub ai_newstate(ByRef a As Integer)
      
    e(a).lastmove = 0 'allow reverse moves after a state change
    e(a).counter = 0
    e(a).bEngage = False
    e(a).tactictime = 0
    e(a).substate = -1
    Select Case LCase$(e(a).state)
    Case "seeking", "charging", "fighting", "surrounding", "retreating"
        e(a).bEngage = True
        If e(a).t <> -10 Then e(a).bAware(e(a).t, 0) = True 'FIX THIS FIXME Maybe
        If e(a).state = "surrounding" Then e(a).tactictime = 5: e(a).substate = -1
        If e(a).state = "seeking" Then e(a).tactictime = 3: e(a).substate = -1
        If e(a).state = "fighting" Then e(a).tactictime = 15 - Int(Rnd * e(a).skill / 10)
    
    'Case "startled"
    '    e(a).counter = 20 - (e(a).skill / 10)
    Case Else

    End Select

End Sub

Private Sub ai_suspect(ByVal a As Integer, ByVal who As Integer, ByVal x As Integer, ByVal y As Integer, ByVal max As Integer, ByVal min As Integer, ByVal checkscore As Integer, Optional ByVal bstealth As Boolean, Optional ByVal stealth As Integer)
Dim odds As Integer
'if you edit this: it hasn't been used everywhere it should in the awareness sub.
'so you'll have to change the versions in there too
    
    odds = Int(max - ph_GetDist(x, y, e(a).x, e(a).y) * 40)
    If odds < min Then odds = min
    If bstealth = True Then odds = Int(odds * stealth / 100)
    If ai_checkbehind(a, x, y) = True Then odds = odds * behindMult
    e(a).suspicion(who) = e(a).suspicion(who) + odds / gamespeed
    e(a).suspiciong = e(a).suspiciong + odds / gamespeed

    ai_awareness_check a, odds, checkscore, x, y, -1, -1

End Sub

Private Function ai_tX(ByRef a As Integer)

    If e(a).t = -1 Then
        ai_tX = p.x
    ElseIf e(a).t >= 0 And e(a).t <= UBound(e) Then
        If e(e(a).t).live = True Then ai_tX = e(e(a).t).x Else ai_tX = -1
    Else
        ai_tX = -1
    End If
End Function
Private Function ai_tY(ByRef a As Integer)

    If e(a).t = -1 Then
        ai_tY = p.y
    ElseIf e(a).t >= 0 And e(a).t <= UBound(e) Then
        If e(e(a).t).live = True Then ai_tY = e(e(a).t).y Else ai_tY = -1
    Else
        ai_tY = -1
    End If
End Function

Private Function ai_tAware(ByRef a As Integer) As Boolean
    If e(a).t = -10 Then Exit Function
    If e(a).bAware(e(a).t, 0) = True Then ai_tAware = True
End Function

Private Function ai_checkbehind(ByVal a As Integer, ByVal x As Integer, ByVal y As Integer) As Boolean
Select Case e(a).face
    Case 1
        If y > e(a).y Then ai_checkbehind = True
    Case 2
        If x > e(a).x Then ai_checkbehind = True
    Case 3
        If y < e(a).y Then ai_checkbehind = True
    Case 4
        If x < e(a).x Then ai_checkbehind = True
End Select
End Function

Private Sub ai_moveAI(ByVal a As Integer)  'Move and face the right direction.
Dim diditwork As Boolean
Dim tacticface As Integer
Dim checktype As String
Dim checkx As Integer, checky As Integer
Dim x As Integer, y As Integer, backcount As Integer
Dim moveScore(0 To 4) As Integer, b As Integer, c As Integer
'Dim pathrate As Single

checkx = ai_tX(a) 'these are the target's position in the target-related
checky = ai_tY(a) 'states, but will be changed in other states. messy.

If e(a).bStartled = True Then
    If Rnd < 0.5 Then
    e(a).face = Int(Rnd * 5)
    checktype = "rand"
    GoSub checkblocked
    If e(a).face < 1 Then e(a).face = 1
    End If
Else

Select Case LCase$(e(a).state)
    Case "waiting"
    If e(a).counter <= 0 Then 'If the counter is on, stay still. Otherwise:
    If Rnd > 0.5 Then e(a).counter = 100 + Rnd * 100 Else If Rnd > 0.1 Then e(a).face = 0 Else If Rnd < 0.5 Then e(a).face = Int(Rnd * 4) + 1
    Else: e(a).face = 0
    End If
    checktype = "rand"
    GoSub checkblocked
    action_moveE a
    
Case "standing"
         If Rnd < 0.1 Then
        If Rnd > 0.5 Then e(a).face = e(a).face + 1 Else e(a).face = e(a).face - 1
    Else: e(a).face = e(a).oldface
    End If
    If e(a).face < 1 Then e(a).face = 4 Else If e(a).face > 4 Then e(a).face = 1
    
Case "camping"
       If e(a).t > -10 Then
         If e(a).cansee(e(a).t) > -10 Then
            If Abs(checky - e(a).y) > Abs(checkx - e(a).x) Then
            If checky > e(a).y Then e(a).face = 3 Else e(a).face = 1
            Else
               If Abs(checky - e(a).y) < Abs(checkx - e(a).x) Then
               If checkx > e(a).x Then e(a).face = 4 Else e(a).face = 2
               Else
               e(a).face = e(a).oldface
               End If
          End If
        End If
       End If
Case "seeking"

    If e(a).t > -10 Then

        'find who we're seeking
     If e(a).t = -1 Then c = -1 'player - nice and simple
     If e(a).t >= 0 And e(a).t <= UBound(e) Then
        If e(e(a).t).x <> -1 Then
            'x = e(e(a).t).x
            'y = e(e(a).t).y
            c = game_pathtoXY(e(e(a).t).x, e(e(a).t).y)
        End If
     End If

     'substate = next pathnode
     'tactictime = time until change of pathnode
     diditwork = False
     e(a).tactictime = e(a).tactictime - 1
     
     'Move on if we are at the current node, or if someone else is blocking it
     If e(a).substate > -1 Then
        b = ph_GetDist(e(a).x, e(a).y, path(e(a).substate).x, path(e(a).substate).y)
        If b = 0 Then
           e(a).substate = -1
         Else
            If ph_canmove(path(e(a).substate).x, path(e(a).substate).y) = False And b = 1 Then e(a).substate = -1
         End If
     End If
     
     If e(a).tactictime <= 0 Then e(a).substate = -1
     
     'if we're lost and we do have a trail, find the next node
     If e(a).substate <= -1 Then e(a).substate = ai_GetNextPath(a, c): e(a).tactictime = 4
     
     'Move
       If e(a).substate > -1 Then
         ai_Movexy a, path(e(a).substate).x, path(e(a).substate).y, , False
         Else
         'navagation has failed.
         ai_Movexy a, checkx, checky, , True
       End If
       
    checktype = "seek"
    
    Else
    e(a).face = Int(Rnd * 4) + 1
    
    End If 'we skip the whole function if we have no target
    
    GoSub checkblocked
    action_moveE a


Case "charging"

    If e(a).t > -10 Then
    ai_Movexy a, checkx, checky, , True
    checktype = "seek"
    GoSub checkblocked
    action_moveE a
    
    End If
    
Case "fighting", "retreating"

    If e(a).t > -10 Then

     e(a).tactictime = e(a).tactictime - 1

    'only retreat if not in firing range
     If LCase$(e(a).state) = "retreating" And checkx <> e(a).x And checky <> e(a).y Then
  
        If Abs(checkx - e(a).x) > Abs(checky - e(a).y) Then
        If checkx < e(a).x Then e(a).face = 4 Else If checkx > e(a).x Then e(a).face = 2 Else If Rnd > 0.5 Then e(a).face = 2 Else e(a).face = 4
        Else ' X mode
        If checky < e(a).y Then e(a).face = 3 Else If checky > e(a).y Then e(a).face = 1 Else If Rnd > 0.5 Then e(a).face = 1 Else e(a).face = 3
        End If
     
       
     
     Else
        
        If Abs(checkx - e(a).x) > Abs(checky - e(a).y) Then ' Y mode
             If (Rnd > 0.75 Or checky = e(a).y) Then
             If Rnd > 0.5 Then e(a).face = 1 Else e(a).face = 3
           Else
             If checky > e(a).y Then e(a).face = 3 Else e(a).face = 1
           End If
        'End If
        
        ElseIf Abs(checkx - e(a).x) < Abs(checky - e(a).y) Then ' X mode
           If Rnd > 0.75 Or checkx = e(a).x Then
           If Rnd > 0.5 Then e(a).face = 2 Else e(a).face = 4
           Else
           If checkx > e(a).x Then e(a).face = 4 Else e(a).face = 2
           End If
        'End If
        
        ElseIf Abs(checkx - e(a).x) = Abs(checky - e(a).y) Then
        e(a).face = Int(Rnd * 4) + 1
        End If
     End If
     checktype = "seek"
     GoSub checkblocked
     action_moveE a
  

    End If
  
Case "surrounding"
    If e(a).t > -10 Then
    If e(a).substate > 0 Then tacticface = e(a).substate

        Do While tacticface = 0 Or tacticface = e(a).face - 2 Or tacticface = e(a).face + 2
          Do
          tacticface = Int(Rnd * 4) + 1
          Loop While tacticface = e(a).face
        'e(a).tactictime = 3
        Loop
        
        'If e(a).tactictime = 0 Then e(a).substate = ""
        'If tacticface = e(a).face Then e(a).substate = "" 'We've probably finished
        
        x = checkx
        y = checky
        backcount = 0
        Do While ph_canmovedir(x, y, tacticface) = True And backcount < e(a).fightDisMax
               Select Case tacticface
               Case 1: y = y - 1
               Case 2: x = x - 1
               Case 3: y = y + 1
               Case 4: x = x + 1
               'If ph_cansee(e(a).x, e(a).y, x, y) = True Then seex = x: seey = y:
               End Select
               backcount = backcount + 1
        Loop

        If backcount < 2 Then e(a).tactictime = 0  'Don't bother if its too close.
      ai_Movexy a, x, y, diditwork, False  'Make us look the right way to move to our new tactical position.
      If diditwork = False And e(a).tactictime > 0 Then e(a).tactictime = e(a).tactictime - 1
      If ph_GetDist(e(a).x, e(a).y, x, y) < 1 Or e(a).tactictime <= 0 Then e(a).tactictime = 0
      e(a).substate = tacticface
     checkx = x 'no longer targets position, now is something else
     checky = y 'so don't use as targets position from here on
     checktype = "seek"
     GoSub checkblocked
     action_moveE a

    End If
    
    Case "fleeing"
    'assumes target is player
    
    
    If e(a).cansee(-1) > -200 Then
    'c = 19999
    'x = -1
    'For b = 0 To UBound(path)
    'If path(b).live = True And path(b).rating(-1) < c Then x = b: c = path(b).rating(-1)
    'Next b
    
    'y = ai_GetNextPath(a, x)
    'ai_Movexy a, path(y).x, path(y).y, , False
    
        If e(a).face <= 0 Then
        e(a).face = -1
        checkx = path(y).x
        checky = path(y).y
        checktype = "seek"
        GoSub checkblocked
        End If
        
        action_moveE a
    
    Else
        If e(a).face <= 0 Then
        e(a).face = -1
        checktype = "rand"
        GoSub checkblocked
        End If
        
        action_moveE a
    End If
    
Case "runto"
    x = e(a).finaldest.x
    y = e(a).finaldest.y
    c = ai_PathTo(x, y)
    diditwork = False
    
    'tactic time from 10 - 5 means we are running straight for
    ' 4 to 0 is normal navagation
    
    If e(a).tactictime >= 5 Or ph_cansee(e(a).x, e(a).y, x, y, True) Then
      If e(a).tactictime <= 4 Then e(a).tactictime = 9 Else e(a).tactictime = e(a).tactictime - 1
      'reset timer to high values
      checkx = x
      checky = y
      ai_Movexy a, x, y, , False
      
    Else
      'Update our next path
         If e(a).substate >= 0 Then
                b = ph_GetDist(e(a).x, e(a).y, path(e(a).substate).x, path(e(a).substate).y)
                If b = 0 Or (ph_canmove(path(e(a).substate).x, path(e(a).substate).y) = False And b = 1) Then
                e(a).substate = ai_GetNextPath(a, c)
                e(a).tactictime = 4
                End If
         Else
                e(a).substate = ai_GetNextPath(a, c)
                e(a).tactictime = 4
         End If
         
      If e(a).substate > -1 Then
          ai_Movexy a, path(e(a).substate).x, path(e(a).substate).y, diditwork, False
          checkx = path(e(a).substate).x
          checky = path(e(a).substate).y
      End If
      If diditwork = False Then e(a).tactictime = e(a).tactictime - 1
      

      
         If e(a).tactictime <= 0 Then
            e(a).substate = -1
         End If
    End If
    checktype = "seek"
    GoSub checkblocked
    action_moveE a



End Select

End If

e(a).moved = e(a).mspeed * gamespeed + Int(Rnd * 3 * gamespeed)
If e(a).face <= 0 Then
   If e(a).oldface <> 0 Then e(a).face = e(a).oldface Else e(a).face = Int(Rnd * 4) + 1
   Else
   e(a).oldface = e(a).face
End If

checkx = ai_tX(a)
checky = ai_tY(a)

If e(a).t > -10 And e(a).bEngage = True Then
If e(a).cansee(e(a).t) > -100 Then
            'Look towards player, always, when fighting
            If Abs(checky - e(a).y) > Abs(checkx - e(a).x) Then
            If checky > e(a).y Then e(a).face = 3 Else e(a).face = 1
            Else
            If checkx > e(a).x Then e(a).face = 4 Else e(a).face = 2
        End If
End If
End If

Exit Sub

checkblocked:
    
    For b = 0 To 4
    ' If we can't move in that direction, don't try...
    If ph_canmovedir(e(a).x, e(a).y, b) = False Then moveScore(b) = -1000
    
    'when seeking, discourage standing still and moving away
    If checktype = "seek" Then
     If b = 0 Then moveScore(b) = moveScore(b) - 2
      If b <> e(a).face Then
        If checky > e(a).y And b = 1 Then moveScore(b) = moveScore(b) - 2
        If checky < e(a).y And b = 3 Then moveScore(b) = moveScore(b) - 2
        If checkx > e(a).x And b = 2 Then moveScore(b) = moveScore(b) - 2
        If checkx < e(a).x And b = 4 Then moveScore(b) = moveScore(b) - 2
      End If
    End If
    
      If b = e(a).face Then
        moveScore(b) = moveScore(b) + 4
      Else
      End If
    
    'aware enemies avoid danger
    'an enemy can miscalulate
        c = Rnd * 130
        'if we are fully aware, AnyAware will return 0. Otherwise a higher number
        'so we use that value to decrease our chance of dodging.
        'BUT: enemies who are checking things out will dodge better
        '(unless they only just started checking)
        'this is to stop the player from luring enemies into a spot and killing them
        c = c + ai_AnyAware(a) * 30
        If c > 0 And (e(a).action = "check" And (e(a).actionV > 0 Or e(a).actionT > 25)) Then c = c - 1
        
        If Rnd * 130 > e(a).skill Then
            'forget totally
        Else 'we saw it coming
            'dangers can be up to 100 for a shot
            'or 1 for just being beside the player
            moveScore(b) = moveScore(b) - ai_dangerdir(e(a).x, e(a).y, b) * 2
        End If
    
    'don't move fowards and back
    If ai_checkreversed(a, b) = True Then moveScore(b) = moveScore(b) - 4
    
    
    'make it very slightly random
    moveScore(b) = moveScore(b) + Int(Rnd * 3)
    Next b
    
    
    c = 0
    For b = 1 To 4
    If moveScore(b) > moveScore(c) Then c = b
    Next b
    
    e(a).face = c
    
Return


End Sub
Private Function ai_checkreversed(ByVal a As Integer, ByVal face As Integer) As Boolean
' Are we facing the exact opposite of the way we were last time?
'use to prevent backwards and fowards looping movement
Dim reversedir As Integer
        reversedir = face - 2
        If reversedir < 1 Then reversedir = reversedir + 4
        If e(a).lastmove = reversedir Then ai_checkreversed = True Else ai_checkreversed = False

End Function

Private Function ai_PathTo(ByVal x As Integer, ByVal y As Integer) As Integer
Dim depth As Integer, a As Integer, dist As Integer
ai_PathTo = -1
depth = 0
Do
  For a = 0 To UBound(path)
    If path(a).live = True Then
    dist = ph_GetDist(path(a).x, path(a).y, x, y)
        If dist <= depth And dist > depth - 2 Then
            If ph_cansee(path(a).x, path(a).y, x, y) = True Then ai_PathTo = a: Exit Function
        End If
    End If
  Next a
depth = depth + 2
Loop While ai_PathTo = -1 And depth < 16

End Function

'Move towards an xy point
' 'threat' is not currently implimented
Private Sub ai_Movexy(ByVal a As Integer, ByVal x As Integer, ByVal y As Integer, Optional ByRef straight As Boolean, Optional ByVal threat As Boolean)
Dim tries As Integer
straight = True
If x = e(a).x And y = e(a).y Then e(a).face = 0: Exit Sub

        If Abs(y - e(a).y) > Abs(x - e(a).x) Then
            If y > e(a).y Then e(a).face = 3 Else e(a).face = 1
            Else
               If Abs(y - e(a).y) < Abs(x - e(a).x) Then
               If x > e(a).x Then e(a).face = 4 Else e(a).face = 2
               Else
               'If we are equal distace both ways (x and y)
               e(a).face = Int(Rnd * 4) + 1
               If x > e(a).x And e(a).face = 2 Then e(a).face = 4
               If x < e(a).x And e(a).face = 4 Then e(a).face = 2
               If y > e(a).y And e(a).face = 1 Then e(a).face = 3
               If y < e(a).y And e(a).face = 3 Then e(a).face = 1
               
               'If x > e(a).x And e(a).face = 3 Then e(a).face = 1
               'If x < e(a).x And e(a).face = 1 Then e(a).face = 3
               'If y > e(a).y And e(a).face = 2 Then e(a).face = 4
               'If y < e(a).y And e(a).face = 4 Then e(a).face = 2
               End If
        End If
        
        tries = 0
        Do While ph_canmovedir(e(a).x, e(a).y, e(a).face) = False And tries < 8
        If tries = 0 Then straight = False
        tries = tries + 1
               e(a).face = Int(Rnd * 4) + 1
               'If x > e(a).x And e(a).face = 3 And Rnd < 0.75 Then e(a).face = 1
               'If x < e(a).x And e(a).face = 1 And Rnd < 0.75 Then e(a).face = 3
               'If y > e(a).y And e(a).face = 2 And Rnd < 0.75 Then e(a).face = 4
               'If y < e(a).y And e(a).face = 4 And Rnd < 0.75 Then e(a).face = 2
               If y > e(a).y And e(a).face = 1 And Rnd < 0.75 Then e(a).face = 3
               If y < e(a).y And e(a).face = 3 And Rnd < 0.75 Then e(a).face = 1
               If x > e(a).x And e(a).face = 2 And Rnd < 0.75 Then e(a).face = 4
               If x < e(a).x And e(a).face = 4 And Rnd < 0.75 Then e(a).face = 2
        Loop

End Sub

Private Sub ai_Runto(a As Integer, x As Integer, y As Integer, nextstate As String, priority As Integer)
    e(a).state = "runto"
    e(a).finaldest.x = x
    e(a).finaldest.y = y
    
    e(a).nextstate = nextstate
    e(a).counter = 0
    e(a).substate = -1
    e(a).tactictime = 0
    e(a).orderpriority = priority
End Sub

'finds an  enemy who can see this enemy to comment on him, or returns false.
Private Function action_comment(a As Integer, comment As Integer, which As Integer, priority As Integer) As Boolean
Dim b As Integer
Dim c As Integer
For b = 0 To UBound(e)
            'is this a friend                       'And game_onscreen(e(b).x, e(b).y, 1, 1) < 3
            If e(b).live = True And e(b).health > 0 Then
            If (e(a).team = e(b).team) Or team(e(a).team).rel(e(b).team) = 2 Then
            'can the commenter see?
                c = ph_GetDist(e(a).x, e(a).y, e(b).x, e(b).y) - 3
                If c < 0 Then c = 0
                If e(b).cansee(a) > c * 40 And c < 10 - 3 And e(b).cansee(a) > 0 Then
                    engine_addspeech b, comment, which, priority, True
                    action_comment = True
                    Exit Function
                End If
            End If
            End If
          Next b

End Function

Private Function ph_FindAngle(ByVal intX1, ByVal intY1, ByVal intX2, ByVal intY2) As Single

Dim sngXComp As Single
Dim sngYComp As Single

    'sngXComp = intX2 - intX1  'x of triangle
    'sngYComp = intY1 - intY2  'y of triangle
    'If sngYComp > 0 Then ph_FindAngle = Atn(sngXComp / sngYComp)
    'If sngYComp < 0 Then ph_FindAngle = Atn(sngXComp / sngYComp) + pi

'   -1,-1   0  +1,-1          'y-axis is reversed
'      90       270
'   -1, +1 180 +1, +1

If intX2 = intX1 Then
   If intY2 > intY1 Then ph_FindAngle = 0 Else ph_FindAngle = 180
   Exit Function
ElseIf intY1 = intY2 Then
   If intX2 > intX1 Then ph_FindAngle = 270 Else ph_FindAngle = 90
   Exit Function
End If


    sngXComp = intX2 - intX1  'x of triangle
    sngYComp = intY1 - intY2  'y of triangle
    If sngXComp > 0 Then
            If sngYComp > 0 Then
              'ph_FindAngle = 270 - (Atn(Abs(sngXComp) / Abs(sngYComp)) * 180 / pi)
            'Else: ph_FindAngle = 270 + (Atn(Abs(sngXComp) / Abs(sngYComp)) * 180 / pi)
              ph_FindAngle = 180 + (Atn(Abs(sngXComp) / Abs(sngYComp)) * 180 / pi)
            Else: ph_FindAngle = 360 - (Atn(Abs(sngXComp) / Abs(sngYComp)) * 180 / pi)
            End If
    Else
    If sngXComp < 0 Then
        If sngYComp > 0 Then
        'ph_FindAngle = 90 + (Atn(Abs(sngXComp) / Abs(sngYComp)) * 180 / pi)
         ph_FindAngle = 180 - (Atn(Abs(sngXComp) / Abs(sngYComp)) * 180 / pi)
        Else
        'ph_FindAngle = 90 - (Atn(Abs(sngXComp) / Abs(sngYComp)) * 180 / pi)
        ph_FindAngle = 0 + (Atn(Abs(sngXComp) / Abs(sngYComp)) * 180 / pi)
        End If
      End If
    End If


End Function

Private Function ph_cansee(ByVal Xfrom, ByVal Yfrom, ByVal Xto, ByVal Yto, Optional ByVal clear As Boolean) As Boolean

'to speed it up - we can never see more than maxviewdist
If ph_GetDist(Xfrom, Yfrom, Xto, Yto) > maxViewDist Then ph_cansee = False: Exit Function

Dim block As positionType
Dim vAngle As Single, viewdist As Integer
Dim xDir As Integer, yDir As Integer
Dim a As Integer, b As Integer, c As Integer
Dim high As Boolean, low As Boolean
Dim highest As Single 'highest angle in the block
Dim lowest As Single 'lowest  angle in the block
Dim inway As Boolean

Dim fixangle As Single

Dim repeats As Integer 'for use with clear
Dim rec As Integer

Dim xFromOld As Integer, yFromOld As Integer ' Viewer and Viewed's real positions
Dim xToOld As Integer, yToOld As Integer 'Where Viewer are Viewed are looking
                                   'or being seen from (middle of square)



If Xfrom = Xto Then
  ph_cansee = ph_cansee1d("x", Yfrom, Yto, Xfrom)
  Exit Function
ElseIf Yfrom = Yto Then
  ph_cansee = ph_cansee1d("y", Xfrom, Xto, Yfrom)
  Exit Function
Else



xDir = Sgn(Xto - Xfrom)
yDir = Sgn(Yto - Yfrom)


xFromOld = Xfrom
yFromOld = Yfrom
xToOld = Xto
yToOld = Yto

ph_cansee = True

If clear = True Then repeats = 2 Else repeats = 1

    Xfrom = xFromOld + 0.5
    Yfrom = yFromOld + 0.5

For rec = 1 To repeats
  


'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  If clear = False Then  'Can we see it in the middle?
    Xto = Xto + 0.5
    Yto = Yto + 0.5
    
  ElseIf rec = 1 Then   'Can we see it fully?
                        'Check the two hardest-to-see corners
    If Xto > Xfrom Then
        If Yto > Yfrom Then 'F''''''''''-from'
        Xto = xToOld + 0    ''''''''''''''''''
        Yto = yToOld + 1    '''''''''T'''-To''
        Else
        Xto = xToOld + 0   ''''''''''T''''''''
        Yto = yToOld + 0   ''F''''''''''''''''
        End If
    Else
        If Yto > Yfrom Then '''''''''''''F''''
        Xto = xToOld + 0    ''''''''''''''''''
        Yto = yToOld + 0    ''T'''''''''''''''
        Else
        Xto = xToOld + 0    'T''
        Yto = yToOld + 1    ''F'
        End If              ''''
    End If
    
  ElseIf rec = 2 Then
   If Xto > Xfrom Then
        If Yto > Yfrom Then 'F''''''''''-from'
        Xto = xToOld + 1    ''''''''''''''''''
        Yto = yToOld + 0    '''''''''T'''-To''
        Else
        Xto = xToOld + 1   ''''''''''T''''''''
        Yto = yToOld + 1   ''F''''''''''''''''
        End If
    Else
        If Yto > Yfrom Then '''''''''''''F''''
        Xto = xToOld + 1    ''''''''''''''''''
        Yto = yToOld + 1    ''T'''''''''''''''
        Else
        Xto = xToOld + 1    'T''
        Yto = yToOld + 0    ''F'
        End If              ''''
    End If
  End If


  vAngle = ph_FindAngle(Xfrom, Yfrom, Xto, Yto)
  'vAngle = vAngle * 180 / pi
  fixangle = vAngle - 180
  'If O(a).x = p.x Or O(a).y = p.y
  
  viewdist = ph_GetDist(xFromOld, yFromOld, xToOld, yToOld)


  For a = 0 To UBound(O)

  inway = False
    '
    If (O(a).live = True) And (O(a).bDrawOnly = False) Then
      For b = O(a).x To O(a).x + O(a).xw - 1
      If inway = True Then Exit For
      For c = O(a).y To O(a).y + O(a).yw - 1
      If inway = True Then Exit For
      'Is it within checking range
        
       If ph_GetDist(b, c, xFromOld, yFromOld) < viewdist Then
        If (Sgn(xToOld - b) = xDir Or Sgn(xToOld - b) = 0) And (Sgn(Int(yToOld) - c) = yDir Or Sgn(Int(yToOld) - c) = 0) Then
         
         If (xToOld > xFromOld And b < xFromOld) Or (xToOld < xFromOld And b > xFromOld) Or (yToOld > yFromOld And c < yFromOld) Or (yToOld < yFromOld And c > yFromOld) Then
         Else
       inway = True
       
       End If
       End If
       End If
      Next c
      Next b


  If inway = True Then
  
  block = ph_corners(a, Xfrom, Yfrom)
  
  highest = -1 'these values will (must) be replaced
  lowest = 361
  'vAngle = vAngle - fixangle
  
  For b = 1 To 4
  block.angle(b) = block.angle(b) - fixangle 'center around 180; 180 = fowards
  If block.angle(b) >= 360 Then block.angle(b) = block.angle(b) - 360
  If block.angle(b) < 0 Then block.angle(b) = block.angle(b) + 360
  
  If block.angle(b) > highest Then highest = block.angle(b)
  If block.angle(b) < lowest Then lowest = block.angle(b)

  Next b


   If highest >= 180 And lowest <= 180 And (highest - lowest) <= 180 Then
       ph_cansee = False: Exit Function
    End If
  
  End If 'if it is in the way
  End If 'if o(a).live = true
  Next a

Next rec

End If


End Function

Private Function ph_GetDist(ByVal intX1, ByVal intY1, ByVal intX2, ByVal intY2) As Integer

ph_GetDist = Abs(intX1 - intX2) + Abs(intY1 - intY2)
'Or, to be more accurate, (Not for a tile based game)
'ph_GetDist = Sqr((intX1 - intX2) ^ 2 + (intY1 - intY2) ^ 2)

End Function

Private Function ph_offMapDir(ByVal x As Integer, ByVal y As Integer, ByVal face As Integer) As Boolean
        Select Case face
                Case 0:
                Case 1: y = y - 1
                Case 3:  y = y + 1
                Case 2: x = x - 1
                Case 4: x = x + 1
        End Select
        If x < 0 Or y < 0 Or x > gamewidth Or y > gameheight Then ph_offMapDir = True Else ph_offMapDir = False
End Function

Private Function ph_corners(ByVal c, ByVal Xfrom, ByVal Yfrom) As positionType
Dim b As Integer ', x As Integer, y As Integer
'Corners
' 1  2
'
' 3  4
ph_corners.x(1) = O(c).x
ph_corners.x(2) = O(c).x + O(c).xw
ph_corners.x(3) = O(c).x
ph_corners.x(4) = O(c).x + O(c).xw
ph_corners.y(1) = O(c).y
ph_corners.y(2) = O(c).y
ph_corners.y(3) = O(c).y + O(c).yw
ph_corners.y(4) = O(c).y + O(c).yw

'If X2 >= 0 And Y2 >= 0 Then
For b = 1 To 4
ph_corners.angle(b) = (ph_FindAngle(Xfrom, Yfrom, ph_corners.x(b), ph_corners.y(b)))
Next b
'End If
End Function

Private Function ph_cansee1d(ByVal XorY, ByVal scan1 As Integer, ByVal scan2 As Integer, ByVal other As Integer) As Boolean
Dim i As Integer
Dim a As Integer
Dim b As Integer
ph_cansee1d = True

If scan1 < scan2 Then a = scan1: b = scan2 Else a = scan2: b = scan1
            If LCase$(XorY) = "x" Then
            
             For i = a To b
               If walkable(other, i) = False Then ph_cansee1d = False:   Exit For
             Next i
            
            'For i = 0 To UBound(o)
            'If o(i).live = True And o(i).x = other And o(i).y >= a And o(i).y <= b Then ph_cansee1d = False
            'Next i
            
            Else
            
             For i = a To b
               If walkable(i, other) = False Then ph_cansee1d = False: Exit For
             Next i
            'For i = 0 To UBound(o)
            'If o(i).live = True And o(i).y = other And o(i).x >= a And o(i).x <= b Then ph_cansee1d = False
            'Next i
            End If
            
            
End Function

Function ph_canmove(ByVal x As Integer, ByVal y As Integer, Optional ByVal movertype As String) As Boolean
ph_canmove = True
Dim a As Integer

'edge of map
If x > gamewidth Or x < 0 Or y < 0 Or y > gameheight Then ph_canmove = False: Exit Function

' Check for terrain objects
  'For a = 0 To UBound(o)
  'If o(a).live = True And o(a).x = x And o(a).y = y Then ph_canmove = False: Exit Function
  'Next a
  If walkable(x, y) = False Then ph_canmove = False: Exit Function

'Shots don't need any further collision checks, so exit
If LCase$(movertype) = "s" Or LCase$(movertype) = "shot" Then Exit Function

'check for enemies in the way.
For a = 0 To UBound(e)
If e(a).live = True And e(a).x = x And e(a).y = y Then ph_canmove = False: Exit Function
Next a

'Check for player in the way.
If p.x = x And p.y = y Then ph_canmove = False: Exit Function

End Function



Function ph_canmovedir(ByVal x As Integer, ByVal y As Integer, ByVal face As Integer, Optional ByVal movertype As String) As Boolean
        Select Case face
                Case 0: ph_canmovedir = True
                Case 1: If ph_canmove(x, y - 1, movertype) = True Then ph_canmovedir = True
                Case 3: If ph_canmove(x, y + 1, movertype) = True Then ph_canmovedir = True
                Case 2: If ph_canmove(x - 1, y, movertype) = True Then ph_canmovedir = True
                Case 4: If ph_canmove(x + 1, y, movertype) = True Then ph_canmovedir = True
        End Select

End Function

'Does this enemy know that any opponents are present?
Function ai_aware(ByVal a As Integer) As Boolean
Dim b As Integer

    For b = -1 To UBound(e)
        If b = -1 Then                      'FIX THIS FIXME - should be a lower level of awareness - 1, not 0
            If team(e(a).team).rel(-1) = 0 And e(a).bAware(-1, 0) = True Then ai_aware = True: Exit Function
        Else
            If (e(b).live = True) And (e(a).team <> e(b).team) And (team(e(a).team).rel(e(b).team) = 0) And (e(a).bAware(b, 0) = True) Then ai_aware = True: Exit Function
        End If
    Next b

End Function

Function ai_dangerdir(ByVal x As Integer, ByVal y As Integer, ByVal face As Integer) As Integer
        Select Case face
                Case 0: ai_dangerdir = danger(x, y)
                Case 1: ai_dangerdir = danger(x, y - 1)
                Case 3: ai_dangerdir = danger(x, y + 1)
                Case 2: ai_dangerdir = danger(x - 1, y)
                Case 4: ai_dangerdir = danger(x + 1, y)
        End Select
End Function

'Move the enemy the way he is facing.
Private Function action_moveE(ByVal a As Integer)

        If e(a).face > 0 And e(a).face <= 4 Then
          Select Case e(a).face
                Case 1: If ph_canmove(e(a).x, e(a).y - 1) = True Then e(a).y = e(a).y - 1
                Case 3: If ph_canmove(e(a).x, e(a).y + 1) = True Then e(a).y = e(a).y + 1
                Case 2: If ph_canmove(e(a).x - 1, e(a).y) = True Then e(a).x = e(a).x - 1
                Case 4: If ph_canmove(e(a).x + 1, e(a).y) = True Then e(a).x = e(a).x + 1
          End Select
          e(a).lastmove = e(a).face
        Else
            e(a).lastmove = 0
            If e(a).oldface > 0 And e(a).oldface <= 4 Then e(a).face = e(a).oldface Else e(a).face = Int(Rnd * 4) + 1 ' We decided not to move this turn.
        End If
        e(a).moved = e(a).mspeed * gamespeed


End Function

'''' PROGRAM STUFF

Private Sub cmdExit_Click()
If exiting = True Then Exit Sub
If MsgBox("Exit mission?", vbOKCancel, "Exit mission") = vbOK Then
    exiting = True
    cmdExit.Enabled = False
End If
End Sub




Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)

exiting = True
If UnloadMode <> 1 Then Cancel = 1
End Sub

' GRAPHICS STUFF
Private Sub game_moveimages()
Dim x As Integer, y As Integer, a As Integer, b As Integer
Dim frame As Integer
Dim offset As Single

'scrolling
If screenX < 0 Then screenX = 0
If screenY < 0 Then screenY = 0
If screenX + screenWidth > gamewidth Then screenX = gamewidth - screenWidth
If screenY + screenHeight > gameheight Then screenY = gameheight - screenHeight

'Order
'grass, Patches, Objects, Decorations, tripwires, player, enemies, explosions, shots


  For a = Int(screenX) To Int(screenX) + screenWidth + 1
  For b = Int(screenY) To Int(screenY) + screenHeight + 1
    game_putimage a, b, 1, 1, pic_ground, groundstyle, 0, 2
    Next b, a

For a = 0 To UBound(patch)
    If patch(a).live = True Then
        b = patch(a).type
        offset = patch(a).offset
            For x = patch(a).x(0) To patch(a).x(1)
            For y = patch(a).y(0) To patch(a).y(1)
                game_putimage x + offset, y + offset, 1, 1, pic_ground, b, 0, 2
            Next y, x
            
        End If
Next a

' if cheating - draw keysquares in a different shade
If Cheatmode = True Then
  'For a = 0 To UBound(keysq)
     '   If keysq(a).live = True Then
     '         x = keysq(a).x
     '         y = keysq(a).y
     '           game_putimage x, y, 1, 1, pic_groundm, groundstyle + 1, 0, 0
     '           game_putimage x, y, 1, 1, pic_ground, groundstyle + 1, 0, 1
     '   End If
     '   Next a
        
   For a = 0 To UBound(psq) 'and patrol squares in another
        If psq(a).live = True Then
              x = psq(a).x
              y = psq(a).y
                game_putimage x, y, 1, 1, pic_groundm, groundstyle + 2, 0, 0
                game_putimage x, y, 1, 1, pic_ground, groundstyle + 2, 0, 1
        End If
   Next a
End If

  For a = 0 To UBound(O)
        If O(a).live = True Then
            'If O(a).bDrawOnly = False Then 'draw its full dimensions
            ''
            'For x = O(a).x To O(a).x + O(a).xw - 1
            '     For y = O(a).y To O(a).y + O(a).yw - 1
            '    game_putimage x, y, 1, 1, pic_groundm, O(a).type + 6, 0, 0
            '    game_putimage x, y, 1, 1, pic_ground, O(a).type + 6, 0, 1
            ' Next
            ' Next
            
            'Else    'don't draw its full dimensions (always used at present)
                game_putimage O(a).x, O(a).y, 1, 1, pic_groundm, O(a).type + 6, 0, 0
                game_putimage O(a).x, O(a).y, 1, 1, pic_ground, O(a).type + 6, 0, 1
            'End If
        End If
        Next a

  For a = 0 To UBound(Dec)
        If Dec(a).live = True Then
                          'BitBlt PicScreen.hDC, Dec(a).x * TileSize, Dec(a).y * TileSize, TileSize, TileSize, Pic_decM.hDC, TileSize * (Dec(a).type), 0, vbSrcAnd
                          'BitBlt PicScreen.hDC, Dec(a).x * TileSize, Dec(a).y * TileSize, TileSize, TileSize, Pic_dec.hDC, TileSize * (Dec(a).type), 0, vbSrcPaint
                          game_putimage Dec(a).x, Dec(a).y, 1, 1, Pic_decM, Dec(a).type, 0, 0
                          game_putimage Dec(a).x, Dec(a).y, 1, 1, Pic_dec, Dec(a).type, 0, 1
                          End If
        Next a

    
For a = 0 To UBound(tripwire)
    If tripwire(a).live = True Then
       game_putimage tripwire(a).x, tripwire(a).y, 1, 1, pic_mechm, tripwire(a).face - 1, 0, 0
       game_putimage tripwire(a).x, tripwire(a).y, 1, 1, pic_mech, tripwire(a).face - 1, 0, 1
    End If
Next a
    
    game_putimage p.x, p.y, 1, 1, pic_humanm, p.face - 1, 0, 0
    game_putimage p.x, p.y, 1, 1, pic_human, p.face - 1, 0, 1

For a = 0 To UBound(e)
   If e(a).live = True And e(a).x <> -1 Then
   x = e(a).x
   y = e(a).y
'   If e(a).moved > 0 Then
'        b = e(a).moved / e(a).mspeed
'        Select Case e(a).lastmove
'            Case 1: y = y + b
'            Case 2: x = x + b
'            Case 3: y = y - b
'            Case 4: x = x - b
'            Case Else
'        End Select
'   End If
   
   
  ' If e(a).skin > 0 Then If timepast / 4 = Int(timepast / 4) Then e(a).skin = e(a).skin + 1  'skin reset fix this here now fix me fixme
  ' If e(a).skin = 0 And timepast / 4 = Int(timepast / 4) Then If Rnd > 0.7 Then e(a).skin = 1
  ' If e(a).skin >= 10 Then e(a).skin = 0
   
          If e(a).health > 0 Then
          'BitBlt PicScreen.hDC, x, y, TileSize, TileSize, pic_humanm.hDC, TileSize * (e(a).face - 1), 0, vbSrcAnd
          'BitBlt PicScreen.hDC, x, y, TileSize, TileSize, pic_human.hDC, TileSize * (e(a).face - 1), TileSize * e(a).skin, vbSrcPaint
          game_putimage x, y, 1, 1, pic_humanm, e(a).face - 1, 0, 0
          game_putimage x, y, 1, 1, pic_human, e(a).face - 1, e(a).skin, 1
          'game_putimage x, y, 1, 1, pic_humanm, e(a).skin * 4 + e(a).face - 1, 1, 0
          'game_putimage x, y, 1, 1, pic_human, e(a).skin * 4 + e(a).face - 1, 1, 1
          Else
          If e(a).counter < 5 Then frame = Int(e(a).counter) Else frame = 4
          game_putimage x, y, 1, 1, pic_deadm, 4 - frame, 0, 0
          game_putimage x, y, 1, 1, pic_dead, 4 - frame, 0, 1
          End If
          
    If Cheatmode = True Then
            If e(a).state = "runto" And e(a).substate > -1 Then
                game_putimage path(e(a).substate).x + 0.1, path(e(a).substate).y + 0.1, 1, 1, Pic_decM, 9, 0, 0
                game_putimage path(e(a).substate).x + 0.1, path(e(a).substate).y + 0.1, 1, 1, Pic_dec, 9, 0, 1
                
                game_putimage e(a).finaldest.x + 0.1, e(a).finaldest.y + 0.1, 1, 1, Pic_decM, 10, 0, 0
                game_putimage e(a).finaldest.x + 0.1, e(a).finaldest.y + 0.1, 1, 1, Pic_dec, 10, 0, 1
             
             ElseIf e(a).state = "seeking" And e(a).substate > -1 Then
                game_putimage path(e(a).substate).x + 0.1, path(e(a).substate).y + 0.1, 1, 1, Pic_decM, 10, 0, 0
                game_putimage path(e(a).substate).x + 0.1, path(e(a).substate).y + 0.1, 1, 1, Pic_dec, 10, 0, 1
            End If
    
        If e(a).cansee(-1) > 0 Then
        game_putimage e(a).x, e(a).y, 1, 1, Pic_decM, 12, 0, 0
        game_putimage e(a).x, e(a).y, 1, 1, Pic_dec, 12, 0, 1
        End If
    End If
   


   
        'display box around speaker - make it flashing, though - every second frame
        If a = lastSpeaker And LastSpeakTime + speakDur >= timepast And timepast / 2 = Int(timepast / 2) Then
        game_putimage e(a).x, e(a).y, 1, 1, Pic_decM, 13, 0, 0
        game_putimage e(a).x, e(a).y, 1, 1, Pic_dec, 13, 0, 1
        End If
   
   End If
   
Next a

For a = 0 To UBound(ex)
   If ex(a).live = True Then
     frame = game_image_ex(a)
          'BitBlt PicScreen.hDC, ex(a).x * TileSize, ex(a).y * TileSize, TileSize, TileSize, pic_effectm.hDC, TileSize * frame, 0, vbSrcAnd
          'BitBlt PicScreen.hDC, ex(a).x * TileSize, ex(a).y * TileSize, TileSize, TileSize, pic_effect.hDC, TileSize * frame, 0, vbSrcPaint
          game_putimage ex(a).x, ex(a).y, 1, 1, pic_effectm, frame, 0, 0
          game_putimage ex(a).x, ex(a).y, 1, 1, pic_effect, frame, 0, 1
   End If
Next a

For a = 0 To UBound(s)
   If s(a).live = True Then
          frame = game_image_s(a)
          'BitBlt PicScreen.hDC, s(a).x * TileSize, s(a).y * TileSize, TileSize, TileSize, pic_shotm.hDC, TileSize * frame, 0, vbSrcAnd
          'BitBlt PicScreen.hDC, s(a).x * TileSize, s(a).y * TileSize, TileSize, TileSize, Pic_shot.hDC, TileSize * frame, 0, vbSrcPaint
          game_putimage s(a).x, s(a).y, 1, 1, pic_shotm, frame, 0, 0
          game_putimage s(a).x, s(a).y, 1, 1, Pic_shot, frame, 0, 1
   End If
Next a

If Cheatmode = True Then 'debug info
For a = 0 To UBound(path)
          If path(a).live = True Then
             Select Case path(a).range
                Case 2: b = 0
                Case 4: b = 1
                Case 7: b = 2
                Case 14: b = 3
                Case Else: b = 6
             End Select
            game_putimage path(a).x, path(a).y, 1, 1, pic_effectm, b, 0, 0
            game_putimage path(a).x, path(a).y, 1, 1, pic_effect, b, 0, 1
            
          End If
Next a

End If


PicScreen.Refresh

'health bar
If p.health > 0 Then
If p.health * 30 / 20 - 5 > healthbar.width Then
   healthbar.width = healthbar.width + 2 / gamespeed
ElseIf p.health * 30 / 20 + 5 < healthbar.width Then healthbar.width = healthbar.width - 2 / gamespeed
Else: healthbar.width = 1 + 30 / 20 * p.health
End If
Else
healthbar.width = 1
End If

'mission text
For a = 0 To 2
lblMis(a).Caption = RecentText(a).txt
    If RecentText(a).time > -1 Then
        If timepast - RecentText(a).time < misTxtDelay Then
            lblMis(a).ForeColor = RGB(255, 255, 255) 'new, white
            Else
            lblMis(a).ForeColor = RGB(255, 255, 200)    'old, yellow
        End If
    Else
    lblMis(a).ForeColor = RGB(255, 255, 255)  'probably a blank text.
    End If
Next a

'gun indicator
If p.heat > 100 Then
shootlight.BackColor = &HFF&
Else
If p.shot <= 0 Then shootlight.BackColor = &HFF00FF Else shootlight.BackColor = &HC0C0C0
End If

Exit Sub

End Sub

Sub game_putimage(ByVal x As Single, ByVal y As Single, ByVal width As Integer, ByVal height As Integer, ByVal Source As PictureBox, ByVal sx As Integer, ByVal sy As Integer, ByVal mask As Integer)
Dim dif As Integer

'if he's off the screen, exit sub
If game_onscreen(x, y, width, height) > 0 Then Exit Sub

'turn all values into real pixel values
x = x * TileSize
y = y * TileSize
width = width * TileSize
height = height * TileSize
sx = sx * TileSize
sy = sy * TileSize

'X min clip
    If x < screenX * TileSize Then
    dif = screenX * TileSize - x
    x = x + dif
    sx = sx + dif
    width = width - dif  'trim the edge off
End If

'X max clip
If x + width >= (screenX + screenWidth + 1) * TileSize Then
    dif = x + width - (screenX + screenWidth + 1) * TileSize
    width = width - dif  'trim the edge off
End If

'Y min clip
    If y < screenY * TileSize Then
    dif = screenY * TileSize - y
    y = y + dif
    sy = sy + dif
    height = height - dif  'trim the edge off
End If

'Y max clip
If y + height >= (screenY + screenHeight + 1) * TileSize Then
    dif = y + height - (screenY + screenHeight + 1) * TileSize
    height = height - dif  'trim the edge off
End If

'adjust variables for painting
x = x - screenX * TileSize
y = y - screenY * TileSize

Select Case mask
    Case 0: BitBlt PicScreen.hDC, x, y, width, height, Source.hDC, sx, sy, vbSrcAnd
    Case 1: BitBlt PicScreen.hDC, x, y, width, height, Source.hDC, sx, sy, vbSrcPaint
    Case 2: BitBlt PicScreen.hDC, x, y, width, height, Source.hDC, sx, sy, vbSrcCopy
End Select
End Sub

Function game_onscreen(ByVal x As Single, ByVal y As Single, ByVal width As Single, ByVal height As Single) As Single
    Dim offDist As Single
    
    If x + width <= screenX Or y + height <= screenY Or x > screenX + screenWidth + 1 Or y > screenY + screenHeight + 1 Then
        If x + width <= screenX Then offDist = offDist + (screenX - (x + width)) + 1
        If x > screenX + screenWidth + 1 Then offDist = offDist + x - (screenX + screenWidth + 1) + 1
        If y + height <= screenY Then offDist = offDist + (screenY - (y + height)) + 1
        If y > screenY + screenHeight + 1 Then offDist = offDist + y - (screenY + screenHeight + 1) + 1
        game_onscreen = offDist
    Else
        game_onscreen = 0
    End If
End Function

Function game_image_ex(ByVal a As Integer)
Dim addamount As Integer
'Dim maxadd As Integer
Select Case ex(a).skin
       Case 0: addamount = 0
       Case 1: addamount = 10
       Case 2: addamount = 5
       Case 3: addamount = 15
End Select
game_image_ex = addamount + Int(ex(a).frame)

End Function

Function game_image_s(ByVal a As Integer)
Dim addamount As Integer
Select Case s(a).skin
       Case 0: addamount = 0
       Case 1: addamount = 4
       Case 2: addamount = 8
       Case 3: addamount = 12
End Select
game_image_s = addamount + s(a).face - 1

End Function


Sub action_Pfire(ByVal key As Integer)
Dim b As Integer, c As Integer, shottype As Integer


c = p.cGun(key)

If p.heat >= 100 Then
  p.shot = 10 * gamespeed
  engine_playsound soundoverheat, engine_NextSlot
  Exit Sub
End If

shottype = p.gun(c).projtype

b = action_basicfire(p.x, p.y, p.face, shottype)
If b = -1 Then Exit Sub
s(b).own = -1
        
s(b).special = p.gun(c).special
s(b).stealth = p.gun(c).stealth
        
p.heat = p.heat + p.gun(c).heatinc + Int(Rnd * 3)
p.shot = p.gun(c).sspeed

If p.moved < p.gun(c).kick Then p.moved = p.gun(c).kick
If p.gun(c).selfhurt > 0 Then action_hurt "p", p.gun(c).selfhurt

End Sub

Private Sub action_efire(ByVal c As Integer)
Dim b As Integer

b = action_basicfire(e(c).x, e(c).y, e(c).face, e(c).shottype)
If b = -1 Then Exit Sub

s(b).own = c
e(c).shot = e(c).sspeed * gamespeed + (Rnd * 3 * gamespeed)

End Sub
Private Function action_basicfire(ByVal x As Integer, ByVal y As Integer, ByVal face As Integer, ByVal shottype As Integer) As Integer
Dim a As Integer, b As Integer

b = -1
For a = 0 To UBound(s)  'Find an unused bullet
If s(a).live = False Then b = a: Exit For
Next a
If b = -1 Then action_basicfire = -1: Exit Function

s(b).shotfrom.x = x
s(b).shotfrom.y = y

s(b).x = x
s(b).y = y
s(b).face = face
s(b).oldx = -1
s(b).oldy = -1
s(b).moved = 0
s(b).live = True
s(b).bHasHurt = False
s(b).stealth = 100

'if it's a special edition shot
    If shottype >= 5 Then
    s(b).special = 100
    shottype = shottype - 5 'apart from this, make it a normal shot
    Else
    s(b).special = 0
    End If

s(b).shottype = shottype


Select Case shottype
    Case 0: s(b).damage = 40: s(b).mspeed = 1: s(b).skin = 0
    Case 1: s(b).damage = 20: s(b).mspeed = 1: s(b).skin = 2
    Case 2: s(b).damage = 50: s(b).mspeed = 0: s(b).skin = 3
    Case 3: s(b).damage = 60: s(b).mspeed = 0: s(b).skin = 1
    Case 4: s(b).damage = 20: s(b).mspeed = -1: s(b).skin = 2
    Case Else: MsgBox "Unknown shot type"
End Select

If game_onscreen(x, y, 1, 1) < 3 Then
    engine_playsound SoundShot(shottype), engine_NextSlot
End If

action_basicfire = b

End Function


'make a shot explode
Private Sub action_sExp(ByVal a As Integer, ByVal sound As Byte)
Dim b As Integer, c As Integer
Dim xOffSet As Single, yOffSet As Single


    'assumes sound 0 means we hit a wall

'die, unless it's a special
    If sound = 0 Or s(a).special < 1 Then
        s(a).live = False
    Else
    s(a).bHasHurt = True
        If s(a).special > 0 Then
            s(a).damage = Int(s(a).damage * s(a).special / 100)
            'too weak, kill it
            If s(a).damage < 20 Then s(a).live = False
        End If
    End If

    'make the explosion position right

    Select Case s(a).face
        Case 1: xOffSet = xOffSet - (1 / TileSize * Int(TileSize / 4))
            If sound = 0 Then yOffSet = yOffSet - (1 / TileSize * Int(TileSize / 2))
        Case 2: yOffSet = yOffSet + (1 / TileSize * Int(TileSize / 4))
            If sound = 0 Then xOffSet = xOffSet - (1 / TileSize * Int(TileSize / 2))
        Case 3: xOffSet = xOffSet + (1 / TileSize * Int(TileSize / 4))
            If sound = 0 Then yOffSet = yOffSet + (1 / TileSize * Int(TileSize / 2))
        Case 4: yOffSet = yOffSet - (1 / TileSize * Int(TileSize / 4))
            If sound = 0 Then xOffSet = xOffSet + (1 / TileSize * Int(TileSize / 2))
    End Select


'Find unused explosion
c = -1
  For b = 0 To UBound(ex)
  If ex(b).live = False Then c = b: Exit For
  Next b

If c <> -1 Then
    'Set the explosion
    ex(c).live = True: ex(c).x = s(a).x + xOffSet: ex(c).y = s(a).y + yOffSet: ex(c).frame = 0
    ex(c).endframe = 5
    ex(c).skin = s(a).skin
    ex(c).own = s(a).own

    ex(c).shotfrom.x = s(a).shotfrom.x
    ex(c).shotfrom.y = s(a).shotfrom.y

    'play explosion sound
    If game_onscreen(ex(c).x, ex(c).y, 1, 1) < 3 Then
        If sound = 0 And s(a).shottype <= UBound(SoundExp) Then engine_playsound SoundExp(s(a).shottype), engine_NextSlot 'hit wall
        If sound = 1 Then engine_playsound SoundThud(0), engine_NextSlot 'hit enemy
        If sound = 2 Then engine_playsound SoundThud(1), engine_NextSlot 'hit player
        If sound = 3 Then engine_playsound SoundDead(Int(Rnd * (UBound(SoundDead) + 1))), engine_NextSlot 'kill enemy
    End If
End If


If scorchDec <= UBound(Dec) Then
    'set the scorchmark
    Dec(scorchDec).live = True
    
    'a little more random for the scorchmarks
    'so they don't overlap perfectly when on top of each other
    xOffSet = xOffSet - Int(Rnd * Int(TileSize / 6)) / TileSize + Int(Rnd * Int(TileSize / 6)) / TileSize
    yOffSet = yOffSet - Int(Rnd * Int(TileSize / 6)) / TileSize + Int(Rnd * Int(TileSize / 6)) / TileSize
    
    Dec(scorchDec).x = s(a).x + xOffSet
    Dec(scorchDec).y = s(a).y + yOffSet
    
    Dec(scorchDec).type = 15 + Int(Rnd * 3) 'dec image change
    scorchDec = scorchDec + 1
    If scorchDec > UBound(Dec) Then scorchDec = lowestFreeDec
End If
    
End Sub

Sub game_checkhit(ByVal x As Integer, ByVal y As Integer, ByVal b As Integer)
''''''''''''''''''''''''
'See if a shot is in contact with player or enemy
''''''''''''''''''''''''
Dim soundType As Integer
Dim a As Integer
Dim bool As Boolean

'special shots only hurt once in each square
If s(b).special > 0 And s(b).mspeed > -1 And s(b).bHasHurt = True Then Exit Sub

'Enemy collisions
    For a = 0 To UBound(e)
    If e(a).live = True And e(a).x = x And e(a).y = y Then
        s(b).bHasHurt = True
        If e(a).health > 0 Then
          If s(b).own = -1 And team(e(a).team).rel(-1) <> 2 Then ' player can't hurt his allies
          soundType = 1
           action_hurt a, s(b).damage
            ''' He's dead, Jim.
            If e(a).health <= 0 Then
            e(a).t = s(b).own 'dead body targets it's killer
            
            'Someone yells 'Man Down!
            If Rnd > 0.75 Then bool = action_comment(a, 14, Int((UBound(soundManDown) + 1) * Rnd), 10)
          
            soundType = 3
            
            Else 'he survived
                'Make comments
                    If Rnd > 0.75 Then bool = action_comment(a, 16, Int((UBound(soundGotHurtF) + 1) * Rnd), 10)
                                'Then If game_onscreen(e(a).x, e(a).y, 1, 1) < 3
                    If bool = False And Rnd > 0.75 Then engine_addspeech a, 15, Int(Rnd * UBound(soundGotHurt) + 1), 10, True
                                
            
            End If
            action_sExp b, soundType
         
                        'Attackers make comment
                If s(b).own >= 0 Then
                    If e(s(b).own).live = True Then
                    
                    If Rnd > 0.75 Then bool = action_comment(s(b).own, 17, Int((UBound(soundGoodShotF) + 1) * Rnd), 10)
                                'Then If game_onscreen(e(s(b).own).x, e(s(b).own).y, 1, 1) < 3
                    If bool = False And Rnd > 0.75 Then engine_addspeech val(s(b).own), 3, Int(Rnd * UBound(soundGoodShot) + 1), 10, True
                    
                    End If
                End If
         
         End If
             'hack for enemy fighting
            If s(b).own <> -1 Then
                If e(s(b).own).team <> e(a).team And team(e(s(b).own).team).rel(e(a).team) <> 2 Then
                    soundType = 1
                    action_hurt a, s(b).damage
                    'if we're alive, fight back!
                    If e(a).health <= 0 Then soundType = 3 Else e(a).t = s(b).own
                    action_sExp b, soundType
                End If
            End If
            'end hack
        End If
    End If
    Next

'Player collisions

If p.x = x And p.y = y And p.health > 0 And s(b).own <> -1 Then
    If team(e(s(b).own).team).rel(-1) <> 2 Then 'friendly enemies don't hurt you
            s(b).bHasHurt = True
            action_hurt "p", s(b).damage
            p.heat = p.heat + 20 + 4 * s(b).damage / 20
            action_sExp b, 2
                    
                    'If p.health <= 40 And p.health > 0 And Rnd > 0.75 And e(s(b).own).live = True Then
                    
                    'Make a comment
                    If e(s(b).own).live = True Then
                    
                    If Rnd > 0.75 Then bool = action_comment(s(b).own, 17, Int((UBound(soundGoodShotF) + 1) * Rnd), 10)
                                    'Then If game_onscreen(e(s(b).own).x, e(s(b).own).y, 1, 1) < 3
                    If bool = False And Rnd > 0.75 Then engine_addspeech val(s(b).own), 3, Int(Rnd * UBound(soundGoodShot) + 1), 10, True
                    
                    End If
       

    End If
End If


End Sub

Sub game_newlev()
Dim a As Integer

gameon = False
timepast = 0
gamespeed = 1 '2

editorX = -1: editorY = -1

'HUD
For a = 0 To 2
lblMis(a).Caption = ""
Next a
labheat.Caption = Str$(0) + "% Heat"
labheat.ForeColor = RGB(0, 0, 255)
labheat.Font.Size = 12
healthbar.width = 1

multimode = False
bFailed = False

'PicScreen = LoadPicture(App.path + "\" + modpath + "resources\3x3.bmp")

Me.Show
Labinit.Visible = True
PicScreen.BackColor = RGB(0, 0, 0)
PicScreen.Picture = Nothing

Dim tempobj(0 To 999) As objtype
Dim x As Integer
Dim y As Integer
Dim b As Integer, i As Variant
Dim terrow As String
Dim E_type(EnemyTop) As Integer
Dim missiontext(0 To 2) As String
Dim t_type() As Integer

Dim pathnum As Integer, tnum As Integer, decNum As Integer, keysqNum As Integer
Dim psqnum As Integer, tripwireNum As Integer, ptNum As Integer, patchNum As Integer

Dim text As String
Dim tersquare As String
Dim healamount As Integer
Dim ptRoller(0 To 9) As String, ptRoute(0 To 9) As String, ptIndex(0 To 9) As Integer
Dim prange As Integer


'Path generation
Dim depth As Integer
Dim bExausted As Boolean

'O_chance = odds of each object appearing.
'E_type - type of a particular enemy.

countdown = 0
nextmission = save.mission

alarm = False

'Clean up from last time
For a = 0 To UBound(cdTimer)
    cdTimer(a).bActive = False
    cdTimer(a).bDown = True
    cdTimer(a).val = 0
Next
  
screenX = 0
screenY = 0
  
For a = 0 To UBound(RecentText)
RecentText(a).txt = ""
RecentText(a).time = -1
Next a
  
  
  For a = 0 To UBound(O)
  O(a).live = False
  O(a).bDrawOnly = False
  O(a).bVisOnly = False
  Next a

For a = 0 To UBound(Dec)
Dec(a).live = False
Next a

For a = 0 To UBound(patch)
patch(a).live = False
Next a


For a = 0 To UBound(keysq)
keysq(a).live = False
Next a

For a = 0 To UBound(psq) 'patrol square
psq(a).live = False
Next a

For a = 0 To UBound(s)
s(a).live = False
Next a

For a = 0 To UBound(ex)
ex(a).live = False
Next a

For a = 0 To UBound(tripnet) 'trip wire networks
    tripnet(a).live = False
    tripnet(a).triggered = False
    
    For b = -1 To UBound(team)    'all beams detect player and his allies only
    tripnet(a).rel(b) = 2 'friendly
    Next b
    tripnet(a).rel(2) = 0
    tripnet(a).rel(-1) = 0
    tripnet(a).tag = ""
Next a

For a = 0 To UBound(tripwire)
    tripwire(a).live = False
    tripwire(a).face = 1
    tripwire(a).group = -1
    tripwire(a).net = -1
    tripwire(a).x = -1
    tripwire(a).y = -1
Next a

'default - all teams hostile to each other, but 2 is friendly to player
For a = 0 To UBound(team)
    For b = -1 To UBound(team)
    team(a).rel(b) = 0
    Next b
    team(a).rel(a) = 2 'teams are friendly to themselves
Next a
team(2).rel(-1) = 2

For a = 0 To UBound(t)
t(a).live = False
Next a

speakTime = -1
lastSpeaker = -1
LastSpeakTime = -100

For a = 0 To UBound(speech)
speech(a).live = False
Next a

For a = 0 To UBound(path)
path(a).live = False
    For b = 0 To UBound(path)
    path(a).rating(b) = 0
    Next b
    
    For b = 0 To pathlinktop
    path(a).links(b) = -10
    Next b
    
Next a

pathnum = 0
i = 0
Open App.path & "\" & save.episode & ".tdm" For Input As #1
     Do
          
     Input #1, text
     If EOF(1) = True Then exiting = True: Close #1: Exit Sub 'FIX THIS
     If Mid$(LCase$(text), 1, 8) = "[mission" Then i = i + 1
     Loop While i < save.mission
     
     ' LOAD TERRAIN OBJECTS
     Input #1, gamewidth, gameheight
     
ReDim walkable(gamewidth, gameheight)
ReDim danger(-1 To gamewidth + 1, -1 To gameheight + 1)

For a = 0 To gamewidth
For b = 0 To gameheight
walkable(a, b) = True
Next b, a
     
     
    ReDim t_type(gamewidth, gameheight)
     
     tnum = 0
     For y = 0 To gameheight
     Input #1, terrow
     For x = 0 To gamewidth
     tersquare = Mid$(terrow, x + 1, 1)
     i = Asc(tersquare)
     If Chr(i) = " " Or Chr(i) = "*" Or Chr(i) = "~" Or Chr(i) = "!" Or Chr(i) = "`" Then i = 0
     '" "space means empty
     '"*"star means pathnode (handled below)
     
     
     If i <> 0 Then
        If tnum > UBound(tempobj) Then MsgBox "too much terrain": Exit For
        tempobj(tnum).live = True
        tempobj(tnum).x = x: tempobj(tnum).y = y: tempobj(tnum).type = i - 48
        tempobj(tnum).xw = 1: tempobj(tnum).yw = 1
        tnum = tnum + 1
     ElseIf tersquare = "*" Or tersquare = "~" Or tersquare = "!" Or tersquare = "`" Then
        If pathnum > UBound(path) Then MsgBox "Too many paths, f00!": pathnum = 0
        path(pathnum).live = True
        path(pathnum).x = x: path(pathnum).y = y
        Select Case tersquare
            Case "*": path(pathnum).range = 7
            Case "~": path(pathnum).range = 4
            Case "!": path(pathnum).range = 14
            Case "`": path(pathnum).range = 2
        End Select
        pathnum = pathnum + 1
     End If
     
     Next x, y
     
     
  Input #1, groundstyle
  
  Do
  Input #1, i 'gap after groundstyle
  Loop While i = "" Or Mid$(i, 1, 1) = "'"
  'Input #1, i
  If i <> -1 Then p.x = i Else p.x = save.x ' Player x and y, -1 to keep from previous mission.
  Input #1, i
  If i <> -1 Then p.y = i Else p.y = save.y
  Input #1, i: If i <> -1 Then p.face = i Else p.face = save.face


   ' game_moveimages
  
  'trignum = 0
  'pathnum = 0
  
  Do
  Input #1, i
  
     If i = "[enemy]" Then ' baddies
    Do
      Do
     Input #1, i
     Loop While Mid$(i, 1, 1) = "'"
       
       If Mid$(i, 1, 1) <> "[" And val(i) >= 0 And val(i) <= UBound(e) Then
       
        Input #1, e(i).x: Input #1, e(i).y: Input #1, E_type(i): Input #1, e(i).state
        Input #1, a
        e(i).goaldie = a
        Input #1, e(i).tag
        'ennum = ennum + 1
       End If
     Loop While Mid$(i, 1, 1) <> "["
     
     ElseIf i = "[trigger]" Then ' Trigger
     Do
        Do
     Input #1, i
     Loop While Mid$(i, 1, 1) = "'"
     
       If Mid$(i, 1, 1) <> "[" And val(i) >= 0 And val(i) <= UBound(t) Then
       
     
        t(i).live = True
        Input #1, t(i).repeating: Input #1, t(i).actwhen
        For a = 0 To 1
          Input #1, t(i).Condtype(a): Input #1, t(i).CondVal(a, 0): Input #1, t(i).CondVal(a, 1): Input #1, t(i).CondVal(a, 2)
        Next a
        For a = 0 To 1
          Input #1, t(i).ActType(a): Input #1, t(i).ActVal(a, 0): Input #1, t(i).ActVal(a, 1): Input #1, t(i).ActVal(a, 2)
        Next a

       End If
     Loop While Mid$(i, 1, 1) <> "["
 
     ElseIf i = "dec" Then
     If decNum > UBound(Dec) Then MsgBox "Too many Decorations!": decNum = 0
     Input #1, Dec(decNum).x
     Input #1, Dec(decNum).y
     Input #1, Dec(decNum).type
     Input #1, a
     If a >= 0 Then Dec(decNum).live = True
     decNum = decNum + 1
     
     ElseIf i = "patch" Then
     If patchNum > UBound(patch) Then MsgBox "Too many patches!": patchNum = 0
     Input #1, patch(patchNum).x(0)
     Input #1, patch(patchNum).y(0)
     Input #1, patch(patchNum).x(1)
     Input #1, patch(patchNum).y(1)
     Input #1, patch(patchNum).type
     Input #1, patch(patchNum).offset
     patch(patchNum).live = True
     patchNum = patchNum + 1
     
     ElseIf i = "keysq" Then
     If keysqNum > UBound(keysq) Then MsgBox "Too many keysquares!": keysqNum = 0
     Input #1, keysq(keysqNum).x
     Input #1, keysq(keysqNum).y
     Input #1, keysq(keysqNum).nametag
     keysq(keysqNum).live = True
     keysqNum = keysqNum + 1
     
     ElseIf i = "psq" Then
     If psqnum > UBound(psq) Then MsgBox "Too many patrol squares!": psqnum = 0
     Input #1, psq(psqnum).x
     Input #1, psq(psqnum).y
     Input #1, psq(psqnum).group
     Input #1, psq(psqnum).Index
     Input #1, psq(psqnum).report
     psq(psqnum).live = True
     psqnum = psqnum + 1
     
     ElseIf i = "tripwire" Then
     If tripwireNum > UBound(tripwire) Then MsgBox "Too many tripwires!": tripwireNum = 0
     Input #1, tripwire(tripwireNum).x
     Input #1, tripwire(tripwireNum).y
     Input #1, tripwire(tripwireNum).face
     Input #1, tripwire(tripwireNum).group
     Input #1, tripwire(tripwireNum).net
     Input #1, a
     If a >= 0 Then tripwire(tripwireNum).live = True

     tripnet(tripwire(tripwireNum).net).live = True
     tripwireNum = tripwireNum + 1
     
     ElseIf i = "tripnet" Then
     Input #1, a
     If a > UBound(tripnet) Then MsgBox "invalid tripnet number!": a = 0
     'For b = 0 To TeamsTop
     Input #1, b
     tripnet(a).rel(-1) = CByte(b)
     Input #1, b
     tripnet(a).rel(0) = CByte(b)
     Input #1, b
     tripnet(a).rel(1) = CByte(b)
     Input #1, b
     tripnet(a).rel(2) = CByte(b)
     Input #1, tripnet(a).tag
     tripnet(a).live = True
     
     
     ElseIf i = "patrol" Then 'patrol,tag,route,index
     
        Input #1, ptRoller(ptNum)
        Input #1, ptRoute(ptNum)
        Input #1, ptIndex(ptNum)
     
     ptNum = ptNum + 1
     If ptNum > UBound(ptRoller) Then ptNum = 0: MsgBox "Too many patrol orders"
     
     Else
     End If
     
  Loop While i <> "[brief]"
  
  
  Input #1, missiontext(0), missiontext(1), missiontext(2)
  Input #1, healamount
Close #1

lowestFreeDec = decNum
scorchDec = lowestFreeDec

'If killgoal = 0 And countdowntime >= 0 Then countdown = countdowntime
p.shot = 10
p.mspeed = 4 '* gamespeed
p.kills = 0
p.moved = 0
p.cmd = 0

p.health = save.health + healamount
If p.health < 0 Then p.health = 0
If p.health > 100 Then p.health = 100

screenX = (p.x - screenWidth / 2) + 0.5
screenY = (p.y - screenHeight / 2) + 0.5

For a = 0 To UBound(flag)
flag(a) = save.flag(a)
Next a

'load gun mods
For a = 0 To wepTop
For b = 0 To upgTop
p.gunMod(a, b) = save.gunMod(a, b)
Next b
Next a

game_RefreshGun (0) 'fix this now, the gunprops stuff
game_RefreshGun (1)
game_RefreshGun (2)
p.cGun(0) = 0
p.cGun(1) = 1
p.heat = 0

'game_moveimages

For a = 0 To UBound(e)
   If E_type(a) = 0 Then
       e(a).live = False
       e(a).health = 0
   Else
       game_setupenemy a, E_type(a)
       e(a).guard.x = e(a).x
       e(a).guard.y = e(a).y
   End If
Next a

For b = 0 To UBound(ptRoller)
If ptRoller(b) <> "" Then
    For a = 0 To UBound(e)
        If (ptRoller(b) = "any") Or ((e(a).live = True) And (e(a).tag = ptRoller(b))) Then
            e(a).patrolRoute = ptRoute(b)
            e(a).patrolIndex = ptIndex(b)
            
            'don't replace already assigned traits (they won't be Cl_wander)
            If e(a).actUnaware = Cl_wander Then e(a).actUnaware = Cl_patrol
            If e(a).actSuspect = Cl_wander Then e(a).actSuspect = Cl_patrol
            If e(a).actAware = Cl_wander Then e(a).actAware = Cl_patrol
            If e(a).actFullAware = Cl_wander Then e(a).actFullAware = Cl_patrol
            'e(a).state = ""
        End If
    Next a
End If
Next b

'compress objects!
For a = 0 To UBound(tempobj)
If tempobj(a).live = True And tempobj(a).bDrawOnly = False And a < UBound(tempobj) Then
    
    
    
    'Look for someone to the right
    x = tempobj(a).x
    b = a
    Do While tempobj(b + 1).x = (x + 1) And tempobj(b + 1).y = tempobj(a).y And tempobj(b + 1).bDrawOnly = False  ' And tempobj(b + 1).type = tempobj(a).type
      tempobj(a).xw = tempobj(a).xw + 1 'enlarge key object
      'tempobj(a).bVisOnly = True 'This only needs to be done once actually
      
      '''tempobj(b + 1).live = False ' destroy assimilated object
      tempobj(b + 1).bDrawOnly = True 'remove LOS from assimilated object - still draw it
      x = x + 1             'move accross again, to check for more
      b = b + 1
      If b >= UBound(tempobj) Then Exit Do
    Loop
    
    'look for ranks below
    'x = tempobj(a).x
    y = tempobj(a).y
    'Do
      For b = a To UBound(tempobj)
      'DoEvents
      x = tempobj(a).x 'x must be (re)set inside the loop because it gets changed inside the loop (messy)
 
      If tempobj(b).y > (y + 1) Or tempobj(b).y < y Then y = -100: Exit For 'gone too far, or are using obselite objects
      
          'we've found one directly below us                        'And tempobj(b).type = tempobj(a).type
          If tempobj(b).y = y + 1 And tempobj(b).x = tempobj(a).x And tempobj(b).bDrawOnly = False Then
        
            For x = 0 To tempobj(a).xw - 1  'go accross rows, probably just 1
                If tempobj(b + x).type <> tempobj(a).type Or tempobj(b + x).y <> y + 1 Or tempobj(b + x).x <> tempobj(a).x + x Then y = -100: Exit For
            Next
            If y <> -100 Then 'we've got a full row below us
                For x = 0 To tempobj(a).xw - 1  'destroy the assimilated ones
                    'tempobj(b + x).live = False
                     tempobj(b + x).bDrawOnly = True 'actually, just non-LOS it
                Next
                tempobj(a).yw = tempobj(a).yw + 1 'add a row to the key object
                'tempobj(a).bVisOnly = True 'This only needs to be done once actually
                y = y + 1 'y will be added to to check for the next row in a moment
            Else
                'incomplete row, exit this game
                Exit For
            End If
          'we've done a row, we'll loop and try for more
            
          Else 'just loop, try again
        
          End If
        Next
    'Loop While y <> -100
    
End If
Next a

'Transfer settings to the _real_ objects
b = 0
For a = 0 To UBound(tempobj)
    If tempobj(a).live = True Then
       If b > UBound(O) Then
            MsgBox "Too much terrain - after compression"
       Else
        O(b).live = tempobj(a).live
        O(b).type = tempobj(a).type
        O(b).x = tempobj(a).x
        O(b).y = tempobj(a).y
        O(b).xw = tempobj(a).xw
        O(b).yw = tempobj(a).yw
        O(b).bDrawOnly = tempobj(a).bDrawOnly
        O(b).bVisOnly = tempobj(a).bVisOnly
        b = b + 1
       End If
    End If
Next a

'game_moveimages

'set up walkable array
For a = 0 To UBound(O)
If O(a).live = True Then
    For x = O(a).x To O(a).x + O(a).xw - 1
    For y = O(a).y To O(a).y + O(a).yw - 1
    walkable(x, y) = False
    Next
    Next
  End If
Next a


For a = 0 To UBound(path)
   If path(a).live = True Then
   depth = 0
   bExausted = True
   Do
     depth = depth + 1
     For b = 0 To UBound(path)
     DoEvents
     
       If path(b).live = True Then
       prange = ph_GetDist(path(a).x, path(a).y, path(b).x, path(b).y)
         If prange <= path(a).range * depth And prange <= path(b).range * depth Then
            If ph_path_link(a, b) = False And ph_cansee(path(a).x, path(a).y, path(b).x, path(b).y) = True Then ph_path_makelink a, b: bExausted = False
         End If
       End If
     Next b
   Loop While bExausted = True And depth < 3
   End If
Next a

game_PathsUpdate


Labinit.Visible = False

If missiontext(0) <> "" Or missiontext(1) <> "" Or missiontext(2) <> "" Then
   frm_game_brief.givebrief missiontext(0), missiontext(1), missiontext(2)
   frm_game_brief.Show 1
End If


game_checktrigs "newlev"

If p.health <= 20 Then a = 4 Else If p.health <= 60 Then a = 3 Else a = 0
If bMusic = True Then engine_playsound SoundMusic(a), 0, 101 ' > 100 makes it loop forever.

gameon = True
cmdExit.Enabled = True

PicScreen.BackColor = vbButtonFace


End Sub

Private Sub ph_path_makelink(ByVal a As Integer, ByVal b As Integer)
Dim c As Integer
Dim bworked As Boolean

If a = b Then Exit Sub 'don't link to ourselves, please

'make a link, each way

    bworked = False
    For c = 0 To pathlinktop
    If path(a).links(c) < 0 Or path(a).links(c) = b Then path(a).links(c) = b: bworked = True: Exit For
    Next c
    If bworked = False Then MsgBox "Too many paths at pathnode" + Str$(a) + ", pos " + Str$(path(a).x) + "," + Str$(path(a).y)

    bworked = False
    For c = 0 To pathlinktop
    If path(b).links(c) < 0 Or path(b).links(c) = a Then path(b).links(c) = a: bworked = True: Exit For
    Next c
    If bworked = False Then MsgBox "Too many paths at pathnode" + Str$(a) + ", pos " + Str$(path(b).x) + "," + Str$(path(b).y)


End Sub

Private Function ph_path_link(ByVal a As Integer, ByVal b As Integer) As Boolean
Dim c As Integer
ph_path_link = False
'check for a link
    For c = 0 To pathlinktop
    If path(a).links(c) = b Then ph_path_link = True: Exit Function
    Next c

End Function

Sub game_setupenemy(ByVal a As Integer, ByVal E_type As Integer)
Dim b As Integer
' 1,2 = grunt
' 3,4 = armoured
' 5,6 = minigunner
' 7,8 = commando
' 9,10 = Elite commandos - Very tough!
' 11, 12 = Snipers
' 13 = PLAYER ALLY
' 14 = ROUGE elite commandos
' 15 = technician
' 16 = Officer (heaps of armour, good weapon, low skill)


    e(a).actUnaware = Cl_wander
    e(a).actSuspect = Cl_wander
    e(a).actAware = Cl_wander
    e(a).actFullAware = Cl_wander

    e(a).action = ""
    e(a).actionT = 0
    e(a).actionV = 0

    e(a).bStartled = False
    e(a).StartledT = -1

    e(a).checkpos(0).x = -1
    e(a).checkpos(0).y = -1
    e(a).checkpos(1).x = -1
    e(a).checkpos(1).y = -1
    e(a).following = -10
    e(a).bfollowed = False
    
    e(a).gethelpb = False
    e(a).gethelpMax = 2
    e(a).gethelpNum = 0
    e(a).gethelpWho = ""
    
    e(a).check.bCheck = True
    e(a).check.bFriends = False
    e(a).check.bHome = True
    e(a).check.FriendNum = 0
    e(a).check.FriendTag = ""
    
    e(a).patrolbReport = False
    e(a).patrolIndex = -1
    e(a).patrolRoute = ""
    
    e(a).checkscore = -1
    e(a).checktime = -1

    e(a).fightDisMax = 7
    e(a).fightDisMin = 2
    e(a).t = -1
    e(a).team = 0

    e(a).home.x = -1
    e(a).home.y = -1
    e(a).guard.x = -1
    e(a).guard.y = -1


Select Case E_type
  Case 0:  'e(a).live = False
           e(a).health = 0
           e(a).material = 0
           e(a).skill = 0
           Return
           'Basic grunts
  Case 1: e(a).health = 40: e(a).sspeed = 40
          e(a).mspeed = 8: e(a).skin = 1: e(a).shottype = 1
          e(a).skill = 50: e(a).material = 10
          
  Case 2: e(a).health = 40: e(a).sspeed = 30
          e(a).mspeed = 6: e(a).skin = 1: e(a).shottype = 1
          e(a).skill = 65: e(a).material = 10
          
          ' Armoured troopers
  Case 3: e(a).health = 100: e(a).sspeed = 40
          e(a).mspeed = 8: e(a).skin = 2: e(a).shottype = 1
          e(a).skill = 50: e(a).material = 20
          
  Case 4: e(a).health = 100: e(a).sspeed = 60
          e(a).mspeed = 6: e(a).skin = 2: e(a).shottype = 3
          e(a).skill = 65: e(a).material = 20
          
          'Rapid gunners
  Case 5: e(a).health = 40: e(a).sspeed = 15
          e(a).mspeed = 8: e(a).skin = 3: e(a).shottype = 1
          e(a).skill = 50: e(a).material = 20
         
  Case 6: e(a).health = 50: e(a).sspeed = 20
          e(a).mspeed = 6: e(a).skin = 3: e(a).shottype = 3
          e(a).skill = 65: e(a).material = 20
          
  'Commandos
  Case 7: e(a).health = 100: e(a).sspeed = 30
          e(a).mspeed = 8: e(a).skin = 4: e(a).shottype = 0
          e(a).skill = 70: e(a).material = 50
    e(a).fightDisMax = 9

  Case 8: e(a).health = 100: e(a).sspeed = 30
          e(a).mspeed = 6: e(a).skin = 4: e(a).shottype = 2
          e(a).skill = 85: e(a).material = 50
    e(a).fightDisMax = 9
  
  'Elite Commandos
  Case 9: e(a).health = 120: e(a).sspeed = 20
          e(a).mspeed = 4: e(a).skin = 5: e(a).shottype = 2
          e(a).skill = 85: e(a).material = 90
    e(a).fightDisMax = 10
    e(a).fightDisMin = 3

  Case 10: e(a).health = 120: e(a).sspeed = 10
          e(a).mspeed = 4: e(a).skin = 5: e(a).shottype = 2
          e(a).skill = 95: e(a).material = 120
    e(a).fightDisMax = 10
    e(a).fightDisMin = 3
          
  'snipers
  Case 11: e(a).health = 50: e(a).sspeed = 20
          e(a).mspeed = 8: e(a).skin = 6: e(a).shottype = 4
          e(a).skill = 65: e(a).material = 50
    e(a).fightDisMax = 20
    e(a).fightDisMin = 4
          
  Case 12: e(a).health = 60: e(a).sspeed = 15
          e(a).mspeed = 5: e(a).skin = 7: e(a).shottype = 4
          e(a).skill = 85: e(a).material = 50
    e(a).fightDisMax = 20
    e(a).fightDisMin = 4
          
  'special characters:
  'PLAYER ALLY
  Case 13: e(a).health = 100: e(a).sspeed = 30
          e(a).mspeed = 8: e(a).skin = 8: e(a).shottype = 0
          e(a).skill = 100: e(a).material = 30
    e(a).fightDisMax = 9
    e(a).team = 2
    e(a).t = -10 'don't initally target the player!
  
  multimode = True 'this is more than player vs enemies
  
  'ROUGE elite commando
  Case 14:  e(a).health = 120: e(a).sspeed = 20
          e(a).mspeed = 4: e(a).skin = 5: e(a).shottype = 2
          e(a).skill = 85: e(a).material = 90
    e(a).fightDisMax = 10
    e(a).fightDisMin = 3
    e(a).team = 1
    e(a).t = -10 'don't initally target the player!
  
  multimode = True 'this is more than player vs enemies
    
  'Technician
  Case 15: e(a).health = 20: e(a).sspeed = 60
          e(a).mspeed = 10: e(a).skin = 8: e(a).shottype = 1
          e(a).skill = 30: e(a).material = 25
  'Officer
  Case 16: e(a).health = 120: e(a).sspeed = 60
          e(a).mspeed = 8: e(a).skin = 8: e(a).shottype = 0
          e(a).skill = 30: e(a).material = 40
          
End Select
   
  e(a).shot = e(a).sspeed
  e(a).moved = e(a).mspeed
  e(a).face = Int(Rnd * 4) + 1
  e(a).live = True
  e(a).counter = 0
  e(a).substate = -1
  e(a).lastmove = 0
  e(a).oldface = 0
  e(a).tactictime = 0
  
  
  For b = -1 To UBound(e)
    e(a).cansee(b) = -1000
    e(a).bAware(b, 0) = False
    e(a).bAware(b, 1) = False
    e(a).bAware(b, 2) = False
    e(a).suspicion(b) = 0
    e(a).suspiciong = 0
    e(a).bAwareG = False
  Next b

  e(a).Attitude = At_Agressive
  'e(a).bAware = False
  e(a).nextstate = ""
  'e(a).suspicion = 0
  e(a).finaldest.x = -1
  e(a).finaldest.y = -1
  e(a).orderpriority = 0
  If randval = 0 Then randval = 1 Else randval = 0
  e(a).randval = randval
  
  Select Case e(a).state
  Case "seeking", "charging", "fighting", "surrounding", "camping":
            e(a).bAllAware = True
  Case Else: e(a).bAllAware = False
  End Select
  
  Select Case e(a).state
  Case "seeking", "charging", "fighting", "surrounding", "retreating":
            e(a).bEngage = True
            If e(a).state <> "retreating" Then e(a).bAllAware = True
  Case Else:  e(a).bEngage = False
  End Select



  'e(a).oldx = -1
  'e(a).oldy = -1

  
  End Sub

Sub game_exitmission()

On Error Resume Next

gameon = False
exiting = False

WaveMixFlushChannel Session, 0, WMIX_ALL Or WMIX_NOREMIX


If save.mission > 0 Then
       frm_menu.cmdContinue.Enabled = True
       frm_menu.changetext 2
Else
    frm_menu.cmdContinue.Enabled = False
    frm_menu.changetext 4
End If
    
frm_menu.Show
Me.Hide
'Unload Me

End Sub

Sub Form_Load()
'Initilize images

On Error Resume Next

Set pic_ground = LoadPicture(App.path + "\" + modpath + "resources\ground.bmp")
Set Pic_dec = LoadPicture(App.path + "\" + modpath + "resources\dec.bmp")
Set pic_dead = LoadPicture(App.path + "\" + modpath + "resources\dead.bmp")
Set pic_effect = LoadPicture(App.path + "\" + modpath + "resources\effects.bmp")
Set Pic_shot = LoadPicture(App.path + "\" + modpath + "resources\shots.bmp")
Set pic_human = LoadPicture(App.path + "\" + modpath + "resources\human.bmp")
Set pic_mech = LoadPicture(App.path + "\" + modpath + "resources\mech.bmp")


Set pic_groundm = LoadPicture(App.path + "\" + modpath + "resources\ground_mask.bmp")
Set Pic_decM = LoadPicture(App.path + "\" + modpath + "resources\dec_mask.bmp")
Set pic_deadm = LoadPicture(App.path + "\" + modpath + "resources\dead_mask.bmp")
Set pic_effectm = LoadPicture(App.path + "\" + modpath + "resources\effects_mask.bmp")
Set pic_shotm = LoadPicture(App.path + "\" + modpath + "resources\shots_mask.bmp")
Set pic_humanm = LoadPicture(App.path + "\" + modpath + "resources\human_mask.bmp")
Set pic_mechm = LoadPicture(App.path + "\" + modpath + "resources\mech_mask.bmp")



engine_initsound

End Sub

Sub game_startup()
exiting = False
frm_menu.Hide
game_newlev
End Sub

Sub engine_initsound()
Dim a As Integer
Dim themixconfig As MIXCONFIG

With themixconfig
         .Size = Len(themixconfig) 'is it MIXCONFIGTYPE?
         .Channels = 1
         .Flags = WMIX_CONFIG_CHANNELS Or WMIX_CONFIG_SAMPLINGRATE
         .SamplingRate = 44
End With

On Error Resume Next

'Start the session
Session = WaveMixConfigureInit(themixconfig)

If Session = 0 Then 'The session could be created
    MsgBox "Unable to create session"
    Exit Sub
    Unload Me
End If

'Load the wave files

For a = 0 To UBound(SoundShot)
SoundShot(a) = WaveMixOpenWave(Session, ByVal (App.path + "\" + modpath + "sounds\shot" & LTrim$(Str$(a)) & ".wav"), 0, WMIX_FILE) 'App.Path & "\1.wav", 0, WMIX_FILE)
Next

For a = 0 To UBound(SoundSeen)
SoundSeen(a) = WaveMixOpenWave(Session, ByVal (App.path + "\" + modpath + "sounds\seen" & LTrim$(Str$(a)) & ".wav"), 0, WMIX_FILE)
Next

'For a = 0 To UBound(SoundTaunt)
'SoundTaunt(a) = WaveMixOpenWave(Session, ByVal (App.path + "\" + modpath + "sounds\taunt" & LTrim$(Str$(a)) & ".wav"), 0, WMIX_FILE)
'Next

For a = 0 To UBound(SoundCheck)
SoundCheck(a) = WaveMixOpenWave(Session, ByVal (App.path + "\" + modpath + "sounds\check" & LTrim$(Str$(a)) & ".wav"), 0, WMIX_FILE)
Next

For a = 0 To UBound(SoundCheckF)
SoundCheckF(a) = WaveMixOpenWave(Session, ByVal (App.path + "\" + modpath + "sounds\checkf" & LTrim$(Str$(a)) & ".wav"), 0, WMIX_FILE)
Next

For a = 0 To UBound(SoundYesCheck)
SoundYesCheck(a) = WaveMixOpenWave(Session, ByVal (App.path + "\" + modpath + "sounds\yescheck" & LTrim$(Str$(a)) & ".wav"), 0, WMIX_FILE)
Next

For a = 0 To UBound(soundCheckStop)
soundCheckStop(a) = WaveMixOpenWave(Session, ByVal (App.path + "\" + modpath + "sounds\checkstop" & LTrim$(Str$(a)) & ".wav"), 0, WMIX_FILE)
Next

For a = 0 To UBound(soundSeekF)
soundSeekF(a) = WaveMixOpenWave(Session, ByVal (App.path + "\" + modpath + "sounds\seekf" & LTrim$(Str$(a)) & ".wav"), 0, WMIX_FILE)
Next

For a = 0 To UBound(soundSeekYes)
soundSeekYes(a) = WaveMixOpenWave(Session, ByVal (App.path + "\" + modpath + "sounds\seekyes" & LTrim$(Str$(a)) & ".wav"), 0, WMIX_FILE)
Next


For a = 0 To UBound(soundGatherFail)
soundGatherFail(a) = WaveMixOpenWave(Session, ByVal (App.path + "\" + modpath + "sounds\gatherfail" & LTrim$(Str$(a)) & ".wav"), 0, WMIX_FILE)
Next

For a = 0 To UBound(soundGatherWork)
soundGatherWork(a) = WaveMixOpenWave(Session, ByVal (App.path + "\" + modpath + "sounds\gatherwork" & LTrim$(Str$(a)) & ".wav"), 0, WMIX_FILE)
Next

For a = 0 To UBound(soundGatherF)
soundGatherF(a) = WaveMixOpenWave(Session, ByVal (App.path + "\" + modpath + "sounds\gatherf" & LTrim$(Str$(a)) & ".wav"), 0, WMIX_FILE)
Next

For a = 0 To UBound(soundGatherYes)
soundGatherYes(a) = WaveMixOpenWave(Session, ByVal (App.path + "\" + modpath + "sounds\gatheryes" & LTrim$(Str$(a)) & ".wav"), 0, WMIX_FILE)
Next

''''''''
For a = 0 To UBound(soundManDown)
soundManDown(a) = WaveMixOpenWave(Session, ByVal (App.path + "\" + modpath + "sounds\mandown" & LTrim$(Str$(a)) & ".wav"), 0, WMIX_FILE)
Next

For a = 0 To UBound(soundGotHurt)
soundGotHurt(a) = WaveMixOpenWave(Session, ByVal (App.path + "\" + modpath + "sounds\gothurt" & LTrim$(Str$(a)) & ".wav"), 0, WMIX_FILE)
Next

For a = 0 To UBound(soundGotHurtF)
soundGotHurtF(a) = WaveMixOpenWave(Session, ByVal (App.path + "\" + modpath + "sounds\gothurtf" & LTrim$(Str$(a)) & ".wav"), 0, WMIX_FILE)
Next

For a = 0 To UBound(soundGoodShot)
soundGoodShot(a) = WaveMixOpenWave(Session, ByVal (App.path + "\" + modpath + "sounds\goodshot" & LTrim$(Str$(a)) & ".wav"), 0, WMIX_FILE)
Next

For a = 0 To UBound(soundGoodShotF)
soundGoodShotF(a) = WaveMixOpenWave(Session, ByVal (App.path + "\" + modpath + "sounds\goodshotf" & LTrim$(Str$(a)) & ".wav"), 0, WMIX_FILE)
Next


''''''

For a = 0 To UBound(SoundExp)
SoundExp(a) = WaveMixOpenWave(Session, ByVal (App.path + "\" + modpath + "sounds\exp" & LTrim$(Str$(a)) & ".wav"), 0, WMIX_FILE)
Next

For a = 0 To UBound(SoundThud)
SoundThud(a) = WaveMixOpenWave(Session, ByVal (App.path + "\" + modpath + "sounds\thud" & LTrim$(Str$(a)) & ".wav"), 0, WMIX_FILE)
Next

For a = 0 To UBound(SoundDead)
SoundDead(a) = WaveMixOpenWave(Session, ByVal (App.path + "\" + modpath + "sounds\dead" & LTrim$(Str$(a)) & ".wav"), 0, WMIX_FILE) 'App.Path & "\1.wav", 0, WMIX_FILE)
Next

For a = 0 To UBound(SoundMusic)
SoundMusic(a) = WaveMixOpenWave(Session, ByVal (App.path + "\" + modpath + "sounds\music" & LTrim$(Str$(a)) & ".wav"), 0, WMIX_FILE) 'App.Path & "\1.wav", 0, WMIX_FILE)
Next



soundTrip = WaveMixOpenWave(Session, ByVal (App.path + "\" + modpath + "sounds\trip0" & ".wav"), 0, WMIX_FILE)

soundmsg = WaveMixOpenWave(Session, ByVal (App.path + "\" + modpath + "sounds\msg0" & ".wav"), 0, WMIX_FILE)
soundoverheat = WaveMixOpenWave(Session, ByVal (App.path + "\" + modpath + "sounds\overheat0" & ".wav"), 0, WMIX_FILE)

For a = 0 To UBound(soundMis)
    If dir(App.path + "\" + modpath + "sounds\mis" & LTrim$(Str$(a)) & ".wav") <> "" Then
    soundMis(a) = WaveMixOpenWave(Session, ByVal (App.path + "\" + modpath + "sounds\mis" & LTrim$(Str$(a)) & ".wav"), 0, WMIX_FILE)
    End If
Next a

'Open the channels 0 to 7
Debug.Print WaveMixOpenChannel(Session, 7, WMIX_ALL)

'Activate the channels
Debug.Print WaveMixActivate(Session, WMIX_ACTIVATE)


End Sub

Private Sub engine_playsound(ByVal sound As Long, ByVal slot As Integer, Optional ByVal loops As Integer)
Dim soundType As MIXPLAYPARAMS

On Error Resume Next

If loops > 99 Then loops = &HFFFF

'Set the structure
With soundType
    .Size = Len(soundType)
    .ChannelHi = HighWord(slot)
    .ChannelLo = LowerWord(slot)
    .hWndNotifyHi = HighWord(0)
    .hWndNotifyLo = LowerWord(0)
    .MixSessionHi = HighWord(Session)
    .MixSessionLo = LowerWord(Session)
    '.FlagsHi = HighWord(WMIX_CLEARQUEUE Or WMIX_HIGHPRIORITY) 'these clear current sound, if the slot is full
    '.FlagsLo = LowerWord(WMIX_CLEARQUEUE Or WMIX_HIGHPRIORITY)
    .FlagsHi = HighWord(WMIX_USELRUCHANNEL Or WMIX_HIGHPRIORITY Or WMIX_CLEARQUEUE) 'these bypass my sound slot allocation and use the default one
    .FlagsHi = LowerWord(WMIX_USELRUCHANNEL Or WMIX_HIGHPRIORITY Or WMIX_CLEARQUEUE)  'use empty channel, play immediately
    .MixWaveHi = HighWord(sound)
    .MixWaveLo = LowerWord(sound)
    .wLoops = loops ' 0 = no
   ' .hWndNotifyHi = HighWord(window handle)
   ' .hWndNotifyLo = LowerWord(window handle)
End With

If slot = 0 Then 'it's a music file, set to overwrite and don't autoassign slot
    With soundType
    .FlagsHi = HighWord(WMIX_CLEARQUEUE Or WMIX_HIGHPRIORITY)
    .FlagsLo = LowerWord(WMIX_CLEARQUEUE Or WMIX_HIGHPRIORITY)
    End With
End If

'Play it
WaveMixPlay soundType

End Sub

Sub engine_clearupsound()
Dim a As Integer

On Error Resume Next

'Close all the channels
WaveMixCloseChannel Session, 0, WMIX_ALL

'Free the wave resources

For a = 0 To UBound(SoundSeen)
WaveMixFreeWave Session, SoundSeen(a)
Next

'For a = 0 To UBound(SoundTaunt)
'WaveMixFreeWave Session, SoundTaunt(a)
'Next

For a = 0 To UBound(SoundCheck)
WaveMixFreeWave Session, SoundCheck(a)
Next

For a = 0 To UBound(SoundCheckF)
WaveMixFreeWave Session, SoundCheckF(a)
Next

For a = 0 To UBound(SoundYesCheck)
WaveMixFreeWave Session, SoundYesCheck(a)
Next

For a = 0 To UBound(soundCheckStop)
WaveMixFreeWave Session, soundCheckStop(a)
Next

For a = 0 To UBound(soundSeekF)
WaveMixFreeWave Session, soundSeekF(a)
Next

For a = 0 To UBound(soundSeekYes)
WaveMixFreeWave Session, soundSeekYes(a)
Next

For a = 0 To UBound(soundGatherFail)
WaveMixFreeWave Session, soundGatherFail(a)
Next

For a = 0 To UBound(soundGatherWork)
WaveMixFreeWave Session, soundGatherWork(a)
Next

For a = 0 To UBound(soundGatherF)
WaveMixFreeWave Session, soundGatherF(a)
Next

For a = 0 To UBound(soundGatherYes)
WaveMixFreeWave Session, soundGatherYes(a)
Next

'''''

For a = 0 To UBound(soundManDown)
WaveMixFreeWave Session, soundManDown(a)
Next

For a = 0 To UBound(soundGotHurt)
WaveMixFreeWave Session, soundGotHurt(a)
Next

For a = 0 To UBound(soundGotHurtF)
WaveMixFreeWave Session, soundGotHurtF(a)
Next

For a = 0 To UBound(soundGoodShot)
WaveMixFreeWave Session, soundGoodShot(a)
Next

For a = 0 To UBound(soundGoodShotF)
WaveMixFreeWave Session, soundGoodShotF(a)
Next

''''''

For a = 0 To UBound(SoundShot)
WaveMixFreeWave Session, SoundShot(a)
Next

For a = 0 To UBound(SoundExp)
WaveMixFreeWave Session, SoundExp(a)
Next

For a = 0 To UBound(SoundThud)
WaveMixFreeWave Session, SoundThud(a)
Next

For a = 0 To UBound(SoundDead)
WaveMixFreeWave Session, SoundDead(a)
Next

For a = 0 To UBound(SoundMusic)
WaveMixFreeWave Session, SoundMusic(a)
Next

WaveMixFreeWave Session, soundTrip
WaveMixFreeWave Session, soundmsg
WaveMixFreeWave Session, soundoverheat

For a = 0 To UBound(soundMis)
    If dir(App.path + "\" + modpath + "sounds\mis" & LTrim$(Str$(a)) & ".wav") <> "" Then
    WaveMixFreeWave Session, soundMis(a)
    End If
Next a

'and close the session
WaveMixCloseSession Session

End Sub

Function engine_NextSlot() As Integer
'This function is obselete - I now use Wavemix's internal fuction to choose
                                ' a slot
SoundSlot = SoundSlot + 1
If SoundSlot >= 8 Then SoundSlot = 1 ' Don't use slot 0, its for special stuff.
engine_NextSlot = SoundSlot
End Function


Private Sub Form_Unload(Cancel As Integer)
engine_clearupsound
End Sub

Sub engine_playintromusic()
engine_playsound SoundMusic(2), 0 ' > 100 makes it loop forever.
End Sub

'Player has won the mission.
Sub game_winmission()
Dim a As Integer, b As Integer
                'Me.Visible = False
                engine_playsound SoundMusic(2), 0, 0
                game_checktrigs "win"
                save.mission = nextmission
                
                save.face = p.face
                save.x = p.x
                save.y = p.y
                save.health = p.health

                'save gun mods
        For a = 0 To wepTop
        For b = 0 To upgTop
            save.gunMod(a, b) = p.gunMod(a, b)
        Next b
        Next a

            For a = 0 To UBound(flag)
            save.flag(a) = flag(a)
            Next a

                'fix this now
                'save.shottype = p.gun.shottype
                'save.heatinc = p.gun.heatinc
                'save.sspeed = p.gun.sspeed
                
                game_newlev
End Sub

' Called with the cond of  Win, Loop, or NewLev
Private Sub game_checktrigs(ByVal cond As String)
Dim a As Integer

For a = 0 To UBound(t)
If t(a).live = True Then game_trig a, cond
Next a

End Sub

Private Sub game_trig(ByVal a As Integer, ByVal cond As String)
Dim b As Integer
Dim c As Integer
Dim d As Integer, f As Integer
Dim num As Integer
Dim tempstr As String

Dim condTrue(0 To 1) As Boolean
Dim condsTrue As Integer
Dim bTriggered As Boolean

For num = 0 To 1 'go through both conditions

Select Case LCase$(t(a).Condtype(num))
    Case "true", "always", "yes", "matthew"
            condTrue(num) = True
            condsTrue = condsTrue + 1

    Case "win"
         If cond = "win" Then
            condTrue(num) = True
            condsTrue = condsTrue + 1
         End If

    Case "newlev"
         If cond = "newlev" Then
            condTrue(num) = True
            condsTrue = condsTrue + 1
         End If
         
    Case "delay"
         If timepast > t(a).CondVal(num, 0) Then
            condTrue(num) = True
            condsTrue = condsTrue + 1
         End If
         
    Case "wireset"
        If tripnet(t(a).CondVal(num, 0)).live = True And tripnet(t(a).CondVal(num, 0)).triggered = True Then
            condTrue(num) = True
            condsTrue = condsTrue + 1
        End If
        
    Case "flag"
       b = 0
       For c = 0 To 1
        If Mid$(t(a).CondVal(num, 2), c + 1, 1) = "+" Then If flag(t(a).CondVal(num, c)) <= 0 Then b = 1
        If Mid$(t(a).CondVal(num, 2), c + 1, 1) = "-" Then If flag(t(a).CondVal(num, c)) > 0 Then b = 1
        Next c
       If b = 0 Then
        condTrue(num) = True
        condsTrue = condsTrue + 1
       End If
       
    Case "kills"
      If p.kills >= t(a).CondVal(num, 0) Then
        condTrue(num) = True
        condsTrue = condsTrue + 1
      End If

    Case "playerxy"
      If p.x = t(a).CondVal(num, 0) And p.y = t(a).CondVal(num, 1) Then
        condTrue(num) = True
        condsTrue = condsTrue + 1
      End If
    
    Case "playerside"
      If (t(a).CondVal(num, 0) = "n" And p.y = 0) Or (t(a).CondVal(num, 0) = "s" And p.y = gameheight) Or (t(a).CondVal(num, 0) = "w" And p.x = 0) Or (t(a).CondVal(num, 0) = "e" And p.x = gamewidth) Then
        condTrue(num) = True
        condsTrue = condsTrue + 1
      End If

    Case "playerhealth"
      If p.health > t(a).CondVal(num, 0) And p.health <= t(a).CondVal(num, 1) Then
        condTrue(num) = True
        condsTrue = condsTrue + 1
      End If

    Case "timer_ch"
     If cdTimer(t(a).CondVal(num, 0)).bActive = True Then
       If (cdTimer(t(a).CondVal(num, 0)).bDown = True And cdTimer(t(a).CondVal(num, 0)).val <= t(a).CondVal(num, 1)) Or (cdTimer(t(a).CondVal(num, 0)).bDown = False And cdTimer(t(a).CondVal(num, 0)).val >= t(a).CondVal(num, 1)) Then
        condTrue(num) = True
        condsTrue = condsTrue + 1
      End If
     End If
     
    Case "enemyxy"
    For c = 0 To UBound(e)
      If e(c).live = True And e(c).x = t(a).CondVal(num, 0) And e(c).y = t(a).CondVal(num, 1) Then
        If t(a).CondVal(num, 2) = "any" Or e(c).tag = t(a).CondVal(num, 2) Then
          condTrue(num) = True
          condsTrue = condsTrue + 1
        Exit For
        End If
      End If
    Next c
     
    Case "enemylives"
    '"enemylives", group, how many, 0
    c = 0
    For b = 0 To UBound(e)
        If e(b).live = True And e(b).x > -1 And (e(b).tag = t(a).CondVal(num, 0) Or t(a).CondVal(num, 0) = "any") Then
        c = c + 1
        End If
    Next b
    
    If c >= t(a).CondVal(num, 1) Then
         condTrue(num) = True
         condsTrue = condsTrue + 1
    End If
     
        ' enemy at keysq  - "enemysq", groupname, keysq title, how many
     Case "enemysq"
      c = 0
        For b = 0 To UBound(e)
        
          If e(b).live = True And (e(b).tag = t(a).CondVal(num, 0)) Or t(a).CondVal(num, 0) = "any" Then
            For d = 0 To UBound(keysq)
            If keysq(d).live = True And keysq(d).nametag = t(a).CondVal(num, 1) And keysq(d).x = e(b).x And keysq(d).y = e(b).y Then c = c + 1: Exit For
            Next d
          'c = c + 1 what the hell is this here for?
          If c >= t(a).CondVal(num, 2) Then Exit For
          End If
         
        Next b
        
        If c > 0 And c >= t(a).CondVal(num, 2) Then c = 1 Else c = 0
       
       If c = 1 Then
         condTrue(num) = True
         condsTrue = condsTrue + 1
       End If
     
    Case "aware"
    c = 0
    If t(a).CondVal(num, 0) = "num" Then If ai_aware(t(a).CondVal(num, 1)) = True Then c = 1
    If t(a).CondVal(num, 0) = "group" Or t(a).CondVal(num, 0) = "any" Then
        For b = 0 To UBound(e)
        If e(b).x > -1 And (e(b).live = True) And (e(b).bStartled = False) And (ai_aware(b) = True) Then If (t(a).CondVal(num, 0) = "group" And e(b).tag = t(a).CondVal(num, 1)) Or t(a).CondVal(num, 0) = "any" Then c = c + 1
        Next b
        If c > 0 And c >= t(a).CondVal(num, 2) Then c = 1 Else c = 0
    End If
     If c = 1 Then
        condTrue(num) = True
        condsTrue = condsTrue + 1
     End If
          'aware of player - "aware", "num" or "group" or "any", value, how many
     
     Case "playersq" ', keysq nametag, 0, 0
     For b = 0 To UBound(keysq)
        If keysq(b).live = True And keysq(b).nametag = t(a).CondVal(num, 0) And keysq(b).x = p.x And keysq(b).y = p.y Then
        condTrue(num) = True
        condsTrue = condsTrue + 1
        End If
     Next b
     
End Select

Next num 'Check the next condition

'check for triggering

Select Case t(a).actwhen
    Case "and"
      If condsTrue = 2 Then bTriggered = True
    Case "or"
      If condsTrue > 0 Then bTriggered = True
    Case "xor"
      If condsTrue = 1 Then bTriggered = True
    Case "none"
      If condsTrue = 0 Then bTriggered = True
    Case "+-"
      If condTrue(0) = True And condTrue(1) = False Then bTriggered = True

End Select

If bTriggered = True Then 'ACTIONS

If t(a).repeating = 0 Then t(a).live = False

' increase delay on delay trigger, in case it is repeating
For num = 0 To 1
 If t(a).Condtype(num) = "delay" Then
     If t(a).CondVal(num, 2) > 0 Then t(a).CondVal(num, 0) = timepast + t(a).CondVal(num, 1)
 End If
Next num


'XXXXXXXXXXXXXXXXXXXXXXXXXXX ACTIONS XXXXXXXXXXXXXXXXXXXXXXXXXX
For num = 0 To 1

Select Case t(a).ActType(num)


    Case "upgscreen"
    
    frm_upgrade.Show 1

    Case "briefing"
   frm_game_brief.givebrief t(a).ActVal(num, 0), t(a).ActVal(num, 1), t(a).ActVal(num, 2)
   frm_game_brief.Show 1

    Case "screenxy"
    screenX = t(a).ActVal(num, 0)
    screenY = t(a).ActVal(num, 1)

    Case "mistxt"
    If t(a).ActVal(num, 1) >= 0 Then
        save.misTxt(t(a).ActVal(num, 0)) = True
        notesPage = t(a).ActVal(num, 0)
        
    Else
        save.misTxt(t(a).ActVal(num, 0)) = False
    End If

     'CLONE OFFSCREEN ENEMY
    Case "enemy"
   c = -1
   For b = UBound(e) To 0 Step -1 'Find highest empty enemy slot
   If e(b).live = False Then c = b: Exit For
   Next b
   If c <> -1 Then               'Clone an enemy
   b = t(a).ActVal(num, 0) 'the donor
   
   
    e(c).home.x = -1
    e(c).home.y = -1
    e(c).guard.x = e(b).guard.x
    e(c).guard.y = e(b).guard.y
   
    e(c).checkpos(0).x = -1
    e(c).checkpos(0).y = -1
    e(c).checkpos(1).x = -1
    e(c).checkpos(1).y = -1
    e(c).following = -10
    e(c).bfollowed = False
    

    e(c).gethelpb = e(b).gethelpb
    e(c).gethelpMax = e(b).gethelpMax
    e(c).gethelpNum = 0
    e(c).gethelpWho = e(b).gethelpWho
    
    e(c).checkscore = -1
    e(c).checktime = -1
   
    e(c).bStartled = False
    e(c).StartledT = -1
   
    e(c).check.bCheck = e(b).check.bCheck
    e(c).check.bFriends = e(b).check.bFriends
    e(c).check.bHome = e(b).check.bHome
    e(c).check.FriendNum = e(b).check.FriendNum
    e(c).check.FriendTag = e(b).check.FriendTag
   
    e(c).patrolbReport = False
    e(c).patrolIndex = e(b).patrolIndex
    e(c).patrolRoute = e(b).patrolRoute
   
    e(c).live = True
    e(c).face = Int(Rnd * 4) + 1
    e(c).x = t(a).ActVal(num, 1)
    e(c).y = t(a).ActVal(num, 2)
    
    e(c).bEngage = e(b).bEngage
    e(c).fightDisMax = e(b).fightDisMax
    e(c).fightDisMin = e(b).fightDisMin
    e(c).material = e(b).material
    
    e(c).state = e(b).state
    e(c).goaldie = e(b).goaldie
    e(c).tag = e(b).tag
     
    e(c).health = e(b).health
    e(c).sspeed = e(b).sspeed
    e(c).mspeed = e(b).mspeed
    e(c).skin = e(b).skin
    e(c).shottype = e(b).shottype
    e(c).skill = e(b).skill
     
    e(c).counter = 0
    e(c).substate = 0
    e(c).lastmove = 0
    e(c).oldface = 0
    e(c).tactictime = 0
  '  e(c).cansee = -1000
    e(c).shot = e(b).sspeed
    e(c).moved = e(b).mspeed
    
    e(c).action = ""
    e(c).actionV = 0
    e(c).actionT = 0
    
    e(c).actUnaware = e(b).actUnaware
    e(c).actSuspect = e(b).actSuspect
    e(c).actAware = e(b).actAware
    e(c).actFullAware = e(b).actFullAware

    e(c).Attitude = e(b).Attitude
   ' e(c).bAware = e(b).bAware
    e(c).nextstate = ""
   ' e(c).suspicion = 0
    e(c).finaldest.x = -1
    e(c).finaldest.y = -1
    e(c).orderpriority = 0
    
    e(c).t = e(b).t
    e(c).team = e(b).team
    e(c).bAllAware = e(b).bAllAware
    
   For d = -1 To UBound(e)
    e(c).cansee(d) = -1000
    e(c).bAware(d, 0) = e(b).bAware(d, 0)
    e(c).bAware(d, 1) = e(b).bAware(d, 1)
    e(c).bAware(d, 2) = e(b).bAware(d, 2)
    e(c).suspicion(d) = 0
   Next d
    
    e(c).suspiciong = 0
    e(c).bAwareG = False
    
    If randval = 0 Then randval = 1 Else randval = 0
    e(c).randval = randval
    
   End If
   
   'Timernumber, timervalue, count up or down
    Case "timer_set"
     If LCase$(t(a).ActVal(num, 2)) = "down" Or LCase$(t(a).ActVal(num, 2)) = "d" Or LCase$(t(a).ActVal(num, 2)) = "true" Then cdTimer(t(a).ActVal(num, 0)).bDown = True Else cdTimer(t(a).ActVal(num, 0)).bDown = False
     cdTimer(t(a).ActVal(num, 0)).val = t(a).ActVal(num, 1)
     cdTimer(t(a).ActVal(num, 0)).bActive = True
     If cdTimer(t(a).ActVal(num, 0)).bDown = True And cdTimer(t(a).ActVal(num, 0)).val = 0 Then cdTimer(t(a).ActVal(num, 0)).bActive = False

    Case "e_breach" ' group\num\any, value, interior patch

        d = t(a).ActVal(num, 2) 'd is the interior patch

      If t(a).ActVal(num, 0) = "num" Then
        b = t(a).ActVal(num, 1)
      Else
       For c = 0 To UBound(e)
       If t(a).ActVal(num, 1) = "any" Or t(a).ActVal(num, 1) = e(c).tag Then b = c: Exit For
       Next c
      End If
        'b is the _first_ enemy we're thinking about.
        'we use him to determine who's presence we consider a breach

       'player first

       f = -1
        If team(e(b).team).rel(-1) = 0 Then
            If p.x >= patch(d).x(0) And p.x <= patch(d).x(1) And p.y >= patch(d).y(0) And p.y <= patch(d).y(1) Then
            'the player is a breacher
                If t(a).ActVal(num, 0) = "num" Then
                  If e(t(a).ActVal(num, 1)).bAware(f, 0) = True Then e(t(a).ActVal(num, 1)).actFullAware = Cl_wander
                Else
                 For c = 0 To UBound(e)
                    If t(a).ActVal(num, 1) = "any" Or t(a).ActVal(num, 1) = e(c).tag Then
                        If e(c).bAware(f, 0) = True Then e(c).actFullAware = Cl_wander
                    End If
                 Next c
                End If
            End If
        End If

        'And enemies
       For f = 0 To UBound(e) 'F is each potential threat, breacher.
         If (e(f).live = True) And team(e(b).team).rel(e(f).team) = 0 Then
           If e(f).x >= patch(d).x(0) And e(f).x <= patch(d).x(1) And e(f).y >= patch(d).y(0) And e(f).y <= patch(d).y(1) Then
             'he is a breacher, so make everyone who sees him stop guarding (and wander)
       
                If t(a).ActVal(num, 0) = "num" Then
                  If e(t(a).ActVal(num, 1)).bAware(f, 0) = True Then e(t(a).ActVal(num, 1)).actFullAware = Cl_wander
                Else
                 For c = 0 To UBound(e)
                    If t(a).ActVal(num, 1) = "any" Or t(a).ActVal(num, 1) = e(c).tag Then
                        If e(c).bAware(f, 0) = True Then e(c).actFullAware = Cl_wander
                    End If
                 Next c
                End If
           End If
         End If
       Next f





    Case "e_attitude"
      If t(a).ActVal(num, 0) = "num" Then
        e(t(a).ActVal(num, 1)).Attitude = t(a).ActVal(num, 2)
      Else
       For c = 0 To UBound(e)
       If t(a).ActVal(num, 1) = "any" Or t(a).ActVal(num, 1) = e(c).tag Then e(c).Attitude = t(a).ActVal(num, 2)
       Next c
      End If

    Case "e_skill"
      If t(a).ActVal(num, 0) = "num" Then
        e(t(a).ActVal(num, 1)).skill = t(a).ActVal(num, 2)
      Else
       For c = 0 To UBound(e)
       If t(a).ActVal(num, 1) = "any" Or t(a).ActVal(num, 1) = e(c).tag Then e(c).skill = t(a).ActVal(num, 2)
       Next c
      End If

    Case "e_destroy"
      If t(a).ActVal(num, 0) = "num" Then
        e(t(a).ActVal(num, 1)).live = False
      Else
       For c = 0 To UBound(e)
       If e(c).x > -1 And e(c).live = True And (t(a).ActVal(num, 1) = "any" Or t(a).ActVal(num, 1) = e(c).tag) Then e(c).live = False
       Next c
      End If
      
      'move commands (runto) goto patrolto mustto
    Case "e_patrolto", "e_goto", "e_mustto"
     
        c = -1
        d = 9999
        For b = 0 To UBound(keysq)
            If keysq(b).live = True And keysq(b).nametag = t(a).ActVal(num, 1) Then
                If ph_GetDist(keysq(b).x, keysq(b).y, e(t(a).ActVal(num, 0)).x, e(t(a).ActVal(num, 0)).y) < d Then
                    c = b
                    d = ph_GetDist(keysq(b).x, keysq(b).y, e(t(a).ActVal(num, 0)).x, e(t(a).ActVal(num, 0)).y)
                End If
            End If
        Next b
  
     'abort if  no keysquare
     If c <> -1 Then
               
     e(t(a).ActVal(num, 0)).state = "runto"
     ai_newstate a
     
     e(t(a).ActVal(num, 0)).finaldest.x = keysq(c).x
     e(t(a).ActVal(num, 0)).finaldest.y = keysq(c).y
     e(t(a).ActVal(num, 0)).nextstate = t(a).ActVal(num, 2)
     
     If t(a).ActType(num) = "e_patrolto" Then e(t(a).ActVal(num, 0)).orderpriority = 0
     If t(a).ActType(num) = "e_goto" Then e(t(a).ActVal(num, 0)).orderpriority = 1
     If t(a).ActType(num) = "e_mustto" Then e(t(a).ActVal(num, 0)).orderpriority = 2
    Else
        MsgBox "error: Keysquare not found: " + t(a).ActVal(num, 1)
    End If
    
    Case "e_checkhome"

      If t(a).ActVal(num, 0) = "num" Then
        c = t(a).ActVal(num, 1)
        e(c).check.bHome = t(a).ActVal(num, 2)
      Else
       For c = 0 To UBound(e)
        If t(a).ActVal(num, 1) = "any" Or t(a).ActVal(num, 1) = e(c).tag Then
        e(c).check.bHome = t(a).ActVal(num, 2)
        End If
       Next c
      End If
    
    'with a number - this awareness or more only
    'with a dash - this awareness only
    Case "e_wander", "e_wander2", "e_wander1", "e_wander0", "e_wander--", "e_wander-3", "e_wander-2", "e_wander-1", "e_wander-0" 'e_wander,name\num\any,namenum,0
    b = 3
    If Mid$(t(a).ActType(num), Len(t(a).ActType(num)), 1) = "2" Then b = 2
    If Mid$(t(a).ActType(num), Len(t(a).ActType(num)), 1) = "1" Then b = 1
    If Mid$(t(a).ActType(num), Len(t(a).ActType(num)), 1) = "0" Then b = 0
    
    If Mid$(t(a).ActType(num), Len(t(a).ActType(num)) - 1, 1) = "-" Then d = 0 Else d = 1
    'if d = 1, count down
    
    
      If t(a).ActVal(num, 0) = "num" Then
        c = t(a).ActVal(num, 1)

        If ((b >= 3) And (d = 1)) Or (b = 3 And d = 0) Then e(c).actUnaware = Cl_wander
        If ((b >= 2) And (d = 1)) Or (b = 2 And d = 0) Then e(c).actSuspect = Cl_wander
        If ((b >= 1) And (d = 1)) Or (b = 1 And d = 0) Then e(c).actAware = Cl_wander
        If (d = 1) Or (b = 0 And d = 0) Then e(c).actFullAware = Cl_wander
      Else
       For c = 0 To UBound(e)
        If t(a).ActVal(num, 1) = "any" Or t(a).ActVal(num, 1) = e(c).tag Then

        If ((b >= 3) And (d = 1)) Or (b = 3 And d = 0) Then e(c).actUnaware = Cl_wander
        If ((b >= 2) And (d = 1)) Or (b = 2 And d = 0) Then e(c).actSuspect = Cl_wander
        If ((b >= 1) And (d = 1)) Or (b = 1 And d = 0) Then e(c).actAware = Cl_wander
        If (d = 1) Or (b = 0 And d = 0) Then e(c).actFullAware = Cl_wander
        End If
       Next c
      End If
        
    
    'with a number - this awareness or more only
    'with a dash - this awareness only
    Case "e_stand", "e_stand2", "e_stand1", "e_stand0", "e_stand--", "e_stand-3", "e_stand-2", "e_stand-1", "e_stand-0" 'e_stand,name\num\any,namenum,0
    b = 3
    If Mid$(t(a).ActType(num), Len(t(a).ActType(num)), 1) = "2" Then b = 2
    If Mid$(t(a).ActType(num), Len(t(a).ActType(num)), 1) = "1" Then b = 1
    If Mid$(t(a).ActType(num), Len(t(a).ActType(num)), 1) = "0" Then b = 0
    
    If Mid$(t(a).ActType(num), Len(t(a).ActType(num)) - 1, 1) = "-" Then d = 0 Else d = 1
    'if d = 1, count down
    
    
      If t(a).ActVal(num, 0) = "num" Then
        c = t(a).ActVal(num, 1)

        If ((b >= 3) And (d = 1)) Or (b = 3 And d = 0) Then e(c).actUnaware = Cl_stand
        If ((b >= 2) And (d = 1)) Or (b = 2 And d = 0) Then e(c).actSuspect = Cl_stand
        If ((b >= 1) And (d = 1)) Or (b = 1 And d = 0) Then e(c).actAware = Cl_stand
        If (d = 1) Or (b = 0 And d = 0) Then e(c).actFullAware = Cl_stand
      Else
       For c = 0 To UBound(e)
        If t(a).ActVal(num, 1) = "any" Or t(a).ActVal(num, 1) = e(c).tag Then

        If ((b >= 3) And (d = 1)) Or (b = 3 And d = 0) Then e(c).actUnaware = Cl_stand
        If ((b >= 2) And (d = 1)) Or (b = 2 And d = 0) Then e(c).actSuspect = Cl_stand
        If ((b >= 1) And (d = 1)) Or (b = 1 And d = 0) Then e(c).actAware = Cl_stand
        If (d = 1) Or (b = 0 And d = 0) Then e(c).actFullAware = Cl_stand
        End If
       Next c
      End If
    
    
    'with a number - this awareness or more only
    'with a dash - this awareness only
    Case "e_patrol", "e_patrol2", "e_patrol1", "e_patrol0", "e_patrol--", "e_patrol-3", "e_patrol-2", "e_patrol-1", "e_patrol-0" 'e_patrol,name\num\any,namenum,patrol route
    b = 3
    If Mid$(t(a).ActType(num), Len(t(a).ActType(num)), 1) = "2" Then b = 2
    If Mid$(t(a).ActType(num), Len(t(a).ActType(num)), 1) = "1" Then b = 1
    If Mid$(t(a).ActType(num), Len(t(a).ActType(num)), 1) = "0" Then b = 0
    
    If Mid$(t(a).ActType(num), Len(t(a).ActType(num)) - 1, 1) = "-" Then d = 0 Else d = 1
    'if d = 1, count down
    
    tempstr = t(a).ActVal(num, 2) 'patrol route
    
      If t(a).ActVal(num, 0) = "num" Then
        c = t(a).ActVal(num, 1)
        e(c).patrolRoute = tempstr
        e(c).patrolIndex = -1
        If ((b >= 3) And (d = 1)) Or (b = 3 And d = 0) Then e(c).actUnaware = Cl_patrol
        If ((b >= 2) And (d = 1)) Or (b = 2 And d = 0) Then e(c).actSuspect = Cl_patrol
        If ((b >= 1) And (d = 1)) Or (b = 1 And d = 0) Then e(c).actAware = Cl_patrol
        If (d = 1) Or (b = 0 And d = 0) Then e(c).actFullAware = Cl_patrol
      Else
       For c = 0 To UBound(e)
        If t(a).ActVal(num, 1) = "any" Or t(a).ActVal(num, 1) = e(c).tag Then
        e(c).patrolRoute = tempstr
        e(c).patrolIndex = -1
        If ((b >= 3) And (d = 1)) Or (b = 3 And d = 0) Then e(c).actUnaware = Cl_patrol
        If ((b >= 2) And (d = 1)) Or (b = 2 And d = 0) Then e(c).actSuspect = Cl_patrol
        If ((b >= 1) And (d = 1)) Or (b = 1 And d = 0) Then e(c).actAware = Cl_patrol
        If (d = 1) Or (b = 0 And d = 0) Then e(c).actFullAware = Cl_patrol
        End If
       Next c
      End If

    
    Case "e_guard", "e_guard2", "e_guard1", "e_guard0", "e_guard--", "e_guard-3", "e_guard-2", "e_guard-1", "e_guard-0" 'e_guard,namenumany,namenum,squaretoguard
    d = -1
    For b = 0 To UBound(keysq)
        If (keysq(b).live = True) And (keysq(b).nametag = t(a).ActVal(num, 2)) Then
        f = b
        End If
    Next b
    If f <> -1 Then
    
    b = 3
    If Mid$(t(a).ActType(num), Len(t(a).ActType(num)), 1) = "2" Then b = 2
    If Mid$(t(a).ActType(num), Len(t(a).ActType(num)), 1) = "1" Then b = 1
    If Mid$(t(a).ActType(num), Len(t(a).ActType(num)), 1) = "0" Then b = 0
    
    If Mid$(t(a).ActType(num), Len(t(a).ActType(num)) - 1, 1) = "-" Then d = 0 Else d = 1
    'if d = 1, count down
    
      If t(a).ActVal(num, 0) = "num" Then
        c = t(a).ActVal(num, 1)
        e(c).guard.x = keysq(f).x
        e(c).guard.y = keysq(f).y
        If ((b >= 3) And (d = 1)) Or (b = 3 And d = 0) Then e(c).actUnaware = cl_guard
        If ((b >= 2) And (d = 1)) Or (b = 2 And d = 0) Then e(c).actSuspect = cl_guard
        If ((b >= 1) And (d = 1)) Or (b = 1 And d = 0) Then e(c).actAware = cl_guard
        If (d = 1) Or (b = 0 And d = 0) Then e(c).actFullAware = cl_guard
      Else
       For c = 0 To UBound(e)
        If t(a).ActVal(num, 1) = "any" Or t(a).ActVal(num, 1) = e(c).tag Then
        e(c).guard.x = keysq(f).x
        e(c).guard.y = keysq(f).y
        If ((b >= 3) And (d = 1)) Or (b = 3 And d = 0) Then e(c).actUnaware = cl_guard
        If ((b >= 2) And (d = 1)) Or (b = 2 And d = 0) Then e(c).actSuspect = cl_guard
        If ((b >= 1) And (d = 1)) Or (b = 1 And d = 0) Then e(c).actAware = cl_guard
        If (d = 1) Or (b = 0 And d = 0) Then e(c).actFullAware = cl_guard
        End If
       Next c
      End If
    Else
    MsgBox "Guarding non-existant square " & t(a).ActVal(num, 2)
    End If
    
    Case "e_gethelpnum" 'goup,bobby, 2
    
      If t(a).ActVal(num, 0) = "num" Then
        c = t(a).ActVal(num, 1)
        e(c).gethelpMax = t(a).ActVal(num, 2)
      Else
       For c = 0 To UBound(e)
        If t(a).ActVal(num, 1) = "any" Or t(a).ActVal(num, 1) = e(c).tag Then
        e(c).gethelpMax = t(a).ActVal(num, 2)
        End If
       Next c
      End If
    
    
    Case "e_gethelp" 'Group,bobby,homesquare
    d = -1
    For b = 0 To UBound(keysq)
        If (keysq(b).live = True) And (keysq(b).nametag = t(a).ActVal(num, 2)) Then
        d = b
        End If
    Next b
    If d <> -1 Then
    
      If t(a).ActVal(num, 0) = "num" Then
        c = t(a).ActVal(num, 1)
        e(c).guard.x = keysq(d).x
        e(c).guard.y = keysq(d).y
        e(c).gethelpb = True
      Else
       For c = 0 To UBound(e)
        If t(a).ActVal(num, 1) = "any" Or t(a).ActVal(num, 1) = e(c).tag Then
        e(c).guard.x = keysq(d).x
        e(c).guard.y = keysq(d).y
        e(c).gethelpb = True
        End If
       Next c
      End If
      
    Else
    MsgBox "Getting help from non-existant square " & t(a).ActVal(num, 2)
    End If
    
    Case "endmission"
     countdown = t(a).ActVal(num, 0)
     
     'a countdown of zero would break the system
     If countdown = 0 Then countdown = 1
     
     If val(t(a).ActVal(num, 2)) = 0 Then nextmission = nextmission + t(a).ActVal(num, 1) Else nextmission = t(a).ActVal(num, 1)

    Case "losemission"
     bFailed = True
     countdown = t(a).ActVal(num, 0)

    Case "flag_setval"
    flag(t(a).ActVal(num, 0)) = t(a).ActVal(num, 1)
    
    Case "p_heal"
       If val(t(a).ActVal(num, 1)) = 0 Then p.health = p.health + t(a).ActVal(num, 0) Else p.health = t(a).ActVal(num, 0)
    
    Case "dec"
     If t(a).ActVal(num, 1) = 1 Then Dec(t(a).ActVal(num, 0)).live = True
     If t(a).ActVal(num, 1) = 0 Then Dec(t(a).ActVal(num, 0)).live = False
     If t(a).ActVal(num, 1) = -1 Then Dec(t(a).ActVal(num, 0)).live = Not Dec(t(a).ActVal(num, 0)).live
    
    Case "tripwire"
     
     For b = 0 To UBound(tripwire)
        If tripwire(b).group = t(a).ActVal(num, 0) Then
        
            If t(a).ActVal(num, 1) = 1 Then tripwire(t(a).ActVal(num, 0)).live = True
            If t(a).ActVal(num, 1) = 0 Then tripwire(t(a).ActVal(num, 0)).live = False
            If t(a).ActVal(num, 1) = -1 Then tripwire(t(a).ActVal(num, 0)).live = Not tripwire(t(a).ActVal(num, 0)).live
        
        End If
     
     Next b
     
     
    
    Case "alarm"
     alarm = True
    
    Case "sound"
    engine_playsound soundMis(t(a).ActVal(num, 0)), engine_NextSlot

    
    Case "speech"
    If t(a).ActVal(num, 2) = 0 Then t(a).ActVal(num, 2) = True Else t(a).ActVal(num, 2) = False
    engine_addspeech Int(t(a).ActVal(num, 0)), 1, Int(t(a).ActVal(num, 1)), 100, (t(a).ActVal(num, 2))
    
    Case "text"
    engine_playsound soundmsg, engine_NextSlot
   For b = 0 To 2
    If t(a).ActVal(num, b) <> "" Then
    
      engine_MisTxt_add t(a).ActVal(num, b)
    
    End If
   Next b

End Select

Next num

End If

End Sub
'give a path, any path, that leads to this position
Private Function game_pathtoXY(ByVal Xto As Integer, ByVal Yto As Integer) As Integer
Dim i As Integer
Dim dist As Integer
Dim c As Integer
Dim score As Integer

c = -10
score = 99

For i = 0 To UBound(path)
If path(i).live = True Then
    dist = ph_GetDist(path(i).x, path(i).y, Xto, Yto)
    
        If dist <= path(i).range And dist < score Then
            If dist = 0 Then 'he's on a pathnode, don't waste your time
                             'doing any more LOS checks - the network has already done 'em
                c = i
                Exit For
            ElseIf ph_cansee(path(i).x, path(i).y, Xto, Yto, True) = True Then
                score = dist
                c = i
            End If
        End If
End If
Next i

game_pathtoXY = c

End Function

' Update paths between paths or path to the player
Private Sub game_PathsUpdate(Optional ByVal spec As String) '(ByVal Xto As Integer, ByVal Yto As Integer)
Dim i As Integer
Dim a As Integer, b As Integer
Dim depth As Integer
Dim exausted As Boolean
Dim dist As Integer
Dim Xto As Integer, Yto As Integer, CurPath As Integer
Dim tempRating(0 To PathTop) As Integer
Dim bPlayer As Boolean

If spec = "" Then 'build path to all paths
    For CurPath = 0 To UBound(path)
    DoEvents
    If path(CurPath).live = True Then
        Xto = path(CurPath).x
        Yto = path(CurPath).y
        GoSub ratepaths
    End If
    Next CurPath
ElseIf LCase$(spec) = "player" Or LCase$(spec) = "p" Then
bPlayer = True
CurPath = -1
Xto = p.x
Yto = p.y
GoSub ratepaths
End If

Exit Sub

ratepaths:

'First round, get the "can see"ers and set the rest to zero.
exausted = True

If bPlayer Then

For i = 0 To UBound(path)
If path(i).live = True Then
    dist = ph_GetDist(path(i).x, path(i).y, Xto, Yto)
    
        If dist <= path(i).range Then
            If dist = 0 Then 'he's on a cell, don't waste your time
                             'doing any more LOS checks - the network has already done 'em
                tempRating(i) = 9999
                exausted = False
                Exit For 'because it's redundant
            ElseIf ph_cansee(path(i).x, path(i).y, Xto, Yto, True) = True Then
                tempRating(i) = 9999 - dist
                exausted = False
            Else
                tempRating(i) = 0
            End If
        Else: tempRating(i) = 0
        End If
End If
Next i

Else 'not player, path instead

'clear the rating array
For i = 0 To UBound(path)
tempRating(i) = 0
Next i

'give values to paths that link to us
For a = 0 To pathlinktop
If path(CurPath).links(a) >= 0 Then
    i = path(CurPath).links(a)
    
    If path(i).live = True Then
    dist = ph_GetDist(path(i).x, path(i).y, Xto, Yto)
                tempRating(i) = 9999 - dist
                exausted = False
    End If
End If
Next a

End If

'We only change the values if
'At least one path saw the player OR
'we aren't checking for the player
If exausted = False Or bPlayer = False Then

    'set the values we just calculated in temprating
    For i = 0 To UBound(path)
    path(i).rating(CurPath) = tempRating(i)
    Next i


    'now link the next lot of paths up, and so on
    'up to ## links in a chain
    
    
    
    For depth = 1 To pathDepth
    exausted = True
       For i = 0 To UBound(path)
       'find a path already on the network
       If path(i).live = True And path(i).rating(CurPath) > 0 Then
         
         'add all its buddies to the network
         For a = 0 To pathlinktop
         b = path(i).links(a)
            If b >= 0 Then
                dist = ph_GetDist(path(i).x, path(i).y, path(b).x, path(b).y)
                If path(i).rating(CurPath) - dist > path(b).rating(CurPath) Then path(b).rating(CurPath) = path(i).rating(CurPath) - dist: exausted = False
            End If
         Next a

         'For b = 0 To UBound(path)
         ' If path(b).live = True And path(b).rating(CurPath) > 0 And path(i).links(b) = True Then
         ' dist = ph_GetDist(path(i).x, path(i).y, path(b).x, path(b).y)
         '   If path(b).rating(CurPath) - dist > path(i).rating(CurPath) Then path(i).rating(CurPath) = path(b).rating(CurPath) - dist
         ' End If
         'Next b
         ''''''
         ' If path(i).rating(CurPath) = 0 Then exausted = False
         
      
        End If
       Next i
    If exausted = True Then Exit For
    Next depth

End If

Return
End Sub

Private Function ai_GetNextPath(ByVal enemynum As Integer, ByVal pathdest As Integer) As Integer
'A pathdest of -1 means the player!
Dim i As Integer, x As Integer, y As Integer
Dim current As Integer, CurRate As Integer
Dim homepath As Integer
Dim avalible(0 To PathTop) As Boolean 'paths pathnum

x = e(enemynum).x
y = e(enemynum).y

homepath = -1 'homepath is path we're starting from.
For i = 0 To UBound(path)
If path(i).x = x And path(i).y = y Then homepath = i: Exit For
Next i

'if we have a homepath, we can skip los checks.
'otherwise we use los checks
For i = 0 To UBound(path)
If path(i).live = True And (path(i).x <> x Or path(i).y <> y) And ph_GetDist(path(i).x, path(i).y, x, y) <= (path(i).range + 1) Then
    If homepath = -1 Then If ph_cansee(x, y, path(i).x, path(i).y) = True Then avalible(i) = True
    If homepath <> -1 Then If ph_path_link(homepath, i) = True Then avalible(i) = True
    End If
Next i

'Optomise: The loop above and below can be done in the same statement!

current = -1
For i = 0 To UBound(path)
  If avalible(i) = True And (ph_GetDist(path(i).x, path(i).y, x, y) > 1 Or ph_canmove(path(i).x, path(i).y)) Then
          If path(i).rating(pathdest) > CurRate Then CurRate = path(i).rating(pathdest): current = i
          If i = pathdest Then current = i: Exit For
  End If
Next i

If current = -1 Then 'Secondary check
For i = 0 To UBound(path)
  If avalible(i) = True Then
          If path(i).rating(pathdest) > CurRate Then CurRate = path(i).rating(pathdest): current = i
          If i = pathdest Then current = i: Exit For
  End If
Next i
End If
ai_GetNextPath = current

End Function

Private Sub game_RefreshGun(ByVal gunNum As Integer)
Dim a As Integer

 'upgrade code - hardcoded
Select Case p.gunMod(gunNum, 1)
    Case 0: p.gun(gunNum).special = 0
    Case 1: p.gun(gunNum).special = 50
    Case 2: p.gun(gunNum).special = 75
    Case 3: p.gun(gunNum).special = 90
    Case Is >= 4: p.gun(gunNum).special = 100
End Select

'Initial stats for each gun type
If gunNum = 0 Then
    With p.gun(gunNum)
 '       .special = 0
        .heatinc = 20 * (100 - (p.gunMod(gunNum, 2) * 15)) / 100
        .kick = 0
        .projtype = 0
        .sspeed = 14 * (100 - (p.gunMod(gunNum, 0) * 10)) / 100
        .stealth = 100 * (100 - (p.gunMod(gunNum, 3) * 20)) / 100
        .selfhurt = 0
    End With

ElseIf gunNum = 1 Then
    With p.gun(gunNum)
'        .special = 0
        .heatinc = 35 * (100 - (p.gunMod(gunNum, 2) * 15)) / 100
        .kick = 15
        .projtype = 2
        .sspeed = 22 * (100 - (p.gunMod(gunNum, 0) * 10)) / 100
        .stealth = 100 * (100 - (p.gunMod(gunNum, 3) * 20)) / 100
        .selfhurt = 0
    End With
    
ElseIf gunNum = 2 Then
    p.gun(gunNum).special = 0
    p.gun(gunNum).heatinc = 10
    p.gun(gunNum).kick = 0
    p.gun(gunNum).projtype = 1
    p.gun(gunNum).sspeed = 7
    p.gun(gunNum).stealth = 100
    p.gun(gunNum).selfhurt = 0

End If

    
End Sub

Private Sub action_hurt(ByVal victim As Variant, ByVal damage As Integer)

If victim = "p" Then
    p.health = p.health - damage

        If p.health <= 0 Then
        exiting = True
        Else
            If bMusic = True Then
                If p.health <= 20 And p.health + damage > 20 Then engine_playsound SoundMusic(4), 0, 101 ' > 100 makes it loop forever.
                If p.health <= 60 And p.health > 1 And p.health + damage > 60 Then engine_playsound SoundMusic(3), 0, 101 ' > 100 makes it loop forever.
            End If
        End If

Else
e(victim).health = e(victim).health - damage

            If e(victim).health <= 0 Then
            e(victim).face = 1
            e(victim).counter = 25
            p.material = p.material + e(victim).material
            If e(victim).goaldie = True Then p.kills = p.kills + 1
            End If
End If


End Sub

Public Sub brief_toggleflag(ByVal theflag As Integer)
If theflag < UBound(flag) And theflag >= 0 Then
  If flag(theflag) > 0 Then flag(theflag) = 0
  If flag(theflag) <= 0 Then flag(theflag) = 1
End If
End Sub

Public Sub brief_upgrade(ByVal wep As Integer, ByVal slot As Integer)
'upgrade a weapon mod slot
    p.gunMod(wep, slot) = p.gunMod(wep, slot) + 1
game_RefreshGun (wep)
End Sub

Public Sub upgrade_upg(ByVal wep As Integer, ByVal slot As Integer)
    p.gunMod(wep, slot) = p.gunMod(wep, slot) + 1
    game_RefreshGun (wep)
End Sub

Public Function upgrade_getlbl(ByVal wep As Integer, ByVal slot As Integer, ByRef bAllowed As Boolean) As String
Dim txt As String

'If p.gunMod(wep, slot) >= 4 Then bAllowed = False Else bAllowed = True
bAllowed = True

If wep = 0 Then

    Select Case slot
        Case 0: txt = "Speed loading (level " + Str$(p.gunMod(wep, slot)) + ")" + Chr(13) + "Increases rate of fire." + Chr(13)
                If p.gunMod(wep, slot) >= 5 Then
                    txt = txt + "No upgrade possible. 50% increase": bAllowed = False
                Else
                    txt = txt + "Upgrade from " + Str$(p.gunMod(wep, slot) * 10) + "% increase to " + Str$((p.gunMod(wep, slot) + 1) * 10) + "% increase"
                End If
        Case 1: txt = "Demagnitization (level " + Str$(p.gunMod(wep, slot)) + ")" + Chr(13) + "Allows projectile to affect multiple targets." + Chr(13)
                Select Case p.gunMod(wep, slot)
                    Case 0: txt = txt + "Upgrade from 0% to 50% efficiency"
                    Case 1: txt = txt + "Upgrade from 50% to 75% efficiency"
                    Case 2: txt = txt + "Upgrade from 75% to 90% efficiency"
                    Case 3: txt = txt + "Upgrade from 90% to 100% efficiency"
                    Case Is >= 4: txt = txt + "No upgrade possible - 100% efficiency": bAllowed = False
                End Select
        Case 2: txt = "Heat discharge (level " + Str$(p.gunMod(wep, slot)) + ")" + Chr(13) + "Reduces heat increase from firing" + Chr(13)
                If p.gunMod(wep, slot) >= 5 Then
                    txt = txt + "No upgrade possible. 75% reduction.": bAllowed = False
                Else
                    txt = txt + "Upgrade from " + Str$(p.gunMod(wep, slot) * 15) + "% decrease to " + Str$((p.gunMod(wep, slot) + 1) * 15) + "% decrease"
                End If
        Case 3: txt = "Stealth projectile (level " + Str$(p.gunMod(wep, slot)) + ")" + Chr(13) + "Shot is less likely to alert enemies during flight" + Chr(13)
               If p.gunMod(wep, slot) >= 5 Then
                    txt = txt + "No upgrade possible. 100% visibility reduction.": bAllowed = False
                Else
                    txt = txt + "Upgrade from " + Str$(p.gunMod(wep, slot) * 20) + "% decrease to " + Str$((p.gunMod(wep, slot) + 1) * 20) + "% decrease"
                End If
        Case Is >= 4: txt = "N\A": bAllowed = False
    End Select

Else

    Select Case slot
        Case 0: txt = "Speed loading (level " + Str$(p.gunMod(wep, slot)) + ")" + Chr(13) + "Increases rate of fire." + Chr(13)
                If p.gunMod(wep, slot) >= 5 Then
                    txt = txt + "No upgrade possible. 50% increase": bAllowed = False
                Else
                    txt = txt + "Upgrade from " + Str$(p.gunMod(wep, slot) * 10) + "% increase to " + Str$((p.gunMod(wep, slot) + 1) * 10) + "% increase"
                End If
        Case 1: txt = "Demagnitization (level " + Str$(p.gunMod(wep, slot)) + ")" + Chr(13) + "Allows projectile to affect multiple targets." + Chr(13)
                Select Case p.gunMod(wep, slot)
                    Case 0: txt = txt + "Upgrade from 0% to 50% efficiency"
                    Case 1: txt = txt + "Upgrade from 50% to 75% efficiency"
                    Case 2: txt = txt + "Upgrade from 75% to 90% efficiency"
                    Case 3: txt = txt + "Upgrade from 90% to 100% efficiency"
                    Case Is >= 4: txt = txt + "No upgrade possible - 100% efficiency": bAllowed = False
                End Select
        Case 2: txt = "Heat discharge (level " + Str$(p.gunMod(wep, slot)) + ")" + Chr(13) + "Reduces heat increase from firing" + Chr(13)
                If p.gunMod(wep, slot) >= 5 Then
                    txt = txt + "No upgrade possible. 75% reduction.": bAllowed = False
                Else
                    txt = txt + "Upgrade from " + Str$(p.gunMod(wep, slot) * 15) + "% decrease to " + Str$((p.gunMod(wep, slot) + 1) * 15) + "% decrease"
                End If
        Case 3: txt = "Stealth projectile (level " + Str$(p.gunMod(wep, slot)) + ")" + Chr(13) + "Shot is less likely to alert enemies during flight" + Chr(13)
               If p.gunMod(wep, slot) >= 5 Then
                    txt = txt + "No upgrade possible. 100% visibility reduction.": bAllowed = False
                Else
                    txt = txt + "Upgrade from " + Str$(p.gunMod(wep, slot) * 20) + "% decrease to " + Str$((p.gunMod(wep, slot) + 1) * 20) + "% decrease"
                End If
        Case Is >= 4: txt = "N\A": bAllowed = False
    End Select
End If

upgrade_getlbl = txt

End Function



Private Sub engine_addspeech(ByVal speaker As Integer, ByVal soundType As Integer, ByVal number As Integer, ByVal priority As Integer, ByVal solo As Boolean)
Dim a As Integer, b As Integer

'Drop low-priority offscreen speech
If speaker >= 0 Then
If game_onscreen(e(speaker).x, e(speaker).y, 1, 1) >= 3 And priority <= 10 Then Exit Sub
End If

'insert in order of priority
a = -1
For b = 0 To UBound(speech)
    If speech(b).live = False Or speech(b).priority < priority Then
        a = b
        Exit For
    End If
Next b

If a = -1 Then Exit Sub 'No more room, don't bother

'Shove the rest back out of the way (the last one will be lost)

If a < UBound(speech) Then

For b = (UBound(speech) - 1) To a
    speech(b + 1).live = speech(b).live
    speech(b + 1).number = speech(b).number
    speech(b + 1).priority = speech(b).priority
    speech(b + 1).solo = speech(b).solo
    speech(b + 1).soundType = speech(b).soundType
    speech(b + 1).speaker = speech(b).speaker
Next b

End If

speech(a).live = True
speech(a).number = number
speech(a).priority = priority
speech(a).solo = solo
speech(a).soundType = soundType
speech(a).speaker = speaker

End Sub

Private Function engine_playspeech() As Boolean
Dim b As Integer
Dim successful As Boolean

Do

'see if we should play the current sound
'this is messy... tidy it later, use a sub?
If speech(0).live = True Then
    If speech(0).speaker < 0 Then
        successful = True
    Else
       If e(speech(0).speaker).live = True And e(speech(0).speaker).health > 0 Then
          If speech(0).solo = True Then
            successful = True
          Else
            For b = 0 To UBound(e)
            If b <> speech(0).speaker And e(b).live = True And ph_GetDist(e(b).x, e(b).y, e(speech(0).speaker).x, e(speech(0).speaker).y) < 8 Then successful = True: Exit For
            Next b
          End If
       End If
       
    End If
End If

If successful = True Then
    lastSpeaker = speech(0).speaker
    LastSpeakTime = timepast
    Select Case speech(0).soundType
        Case 1:
         engine_playsound soundMis(speech(0).number), engine_NextSlot
        Case 2:
         engine_playsound SoundSeen(speech(0).number), engine_NextSlot
        Case 3:
         engine_playsound soundGoodShot(speech(0).number), engine_NextSlot
        Case 4:
         If e(speech(0).speaker).action = "check" Then
            engine_playsound SoundCheck(speech(0).number), engine_NextSlot
         Else
            successful = False
         End If
         
        Case 5:
         If e(speech(0).speaker).action = "check" Then
            engine_playsound SoundCheckF(speech(0).number), engine_NextSlot
         Else
            successful = False
         End If
         
        Case 6:
         If e(speech(0).speaker).action = "follow" Then
            engine_playsound SoundYesCheck(speech(0).number), engine_NextSlot
         Else
            successful = False
         End If
    
        Case 7:
         'If e(speech(0).speaker).action <> "follow" Then
            engine_playsound soundCheckStop(speech(0).number), engine_NextSlot
         'Else
         '   successful = False
         'End If
    
        Case 8:
         If e(speech(0).speaker).action = "seek" Then
            engine_playsound soundSeekF(speech(0).number), engine_NextSlot
         Else
            successful = False
         End If
         
        Case 9:
         If e(speech(0).speaker).action = "follow" Then
            engine_playsound soundSeekYes(speech(0).number), engine_NextSlot
         Else
            successful = False
         End If
    
        Case 10:
            engine_playsound soundGatherFail(speech(0).number), engine_NextSlot
    
        Case 11:
            engine_playsound soundGatherWork(speech(0).number), engine_NextSlot
    
        Case 12:
         If e(speech(0).speaker).action = "gather" Then
            engine_playsound soundGatherF(speech(0).number), engine_NextSlot
         Else
            successful = False
         End If
         
        Case 13:
         If e(speech(0).speaker).action = "follow" Then
            engine_playsound soundGatherYes(speech(0).number), engine_NextSlot
         Else
            successful = False
         End If
    
        Case 14:
            engine_playsound soundManDown(speech(0).number), engine_NextSlot
        Case 15:
            engine_playsound soundGotHurt(speech(0).number), engine_NextSlot
        Case 16:
            engine_playsound soundGotHurtF(speech(0).number), engine_NextSlot
        Case 17:
            engine_playsound soundGoodShotF(speech(0).number), engine_NextSlot
    
    
    
    End Select
End If

'shove the speech foward down the track
For b = 1 To UBound(speech)
    speech(b - 1).live = speech(b).live
    speech(b - 1).number = speech(b).number
    speech(b - 1).priority = speech(b).priority
    speech(b - 1).solo = speech(b).solo
    speech(b - 1).soundType = speech(b).soundType
    speech(b - 1).speaker = speech(b).speaker
Next b

speech(UBound(speech)).live = False

Loop While successful = False And speech(0).live = True

engine_playspeech = successful

End Function

Public Sub engine_setnotespage(ByVal np As Integer)
notesPage = np
End Sub

Private Sub engine_MisTxt_add(ByVal txt As String)
Dim a As Integer, bFull As Boolean
bFull = True
For a = 0 To UBound(RecentText)

    If RecentText(a).txt = "" Then
        bFull = False 'the array was not full
        RecentText(a).txt = txt
        RecentText(a).time = timepast
        Exit For
    End If
    
Next a

If bFull = True Then 'the array was full, erase the first
    
    engine_mistxt_push
    
        'the last slot will be empty now so we fill it with ours
        a = UBound(RecentText)
        RecentText(a).txt = txt
        RecentText(a).time = time
    
End If

End Sub

Private Sub engine_MisTxt_update()
Dim a As Integer
Dim que As Integer
' if the first message is old enough, erase it.
' Only if messages are waiting in the que.

For a = 0 To UBound(RecentText)
    If RecentText(a).txt <> "" Then que = que + 1 Else Exit For
Next a

If que > 3 Then

If timepast - RecentText(0).time > misTxtDelay Then

        engine_mistxt_push
        
        'empty the last slot
        a = UBound(RecentText)
        RecentText(a).txt = ""
        RecentText(a).time = -1

End If

End If

End Sub

Private Sub engine_mistxt_push()
Dim a As Integer
    For a = 1 To UBound(RecentText)
    'push each Recenttext forwards one (except the first, which is lost)
    RecentText(a - 1).time = RecentText(a).time
    RecentText(a - 1).txt = RecentText(a).txt
    
    If a = 3 Then 'slot 3 is pushed into slot 2 and becomes visible (0 to 2 are visible)
                  'we reset it's 'time' so that it won't expire before it appears
    RecentText(a).time = timepast
    
    End If
    
    Next a
End Sub

'set off any tripwires the player or enemy has crossed
Private Sub game_checkwire(ByVal a As Integer)
Dim b As Integer, c As Integer

If a = -1 Then

For b = 0 To UBound(tripwire)
    If tripwire(b).live = True Then
        If tripwire(b).x = p.x And tripwire(b).y = p.y Then
            c = tripwire(b).net
            If tripnet(c).live = True And tripnet(c).triggered = False And tripnet(c).rel(-1) = 0 Then
                tripnet(c).triggered = True
                engine_playsound soundTrip, engine_NextSlot
                ai_wiretripped c, a, p.x, p.y
            End If
        End If
    End If
Next b

Else

For b = 0 To UBound(tripwire)
    If tripwire(b).live = True Then
        If tripwire(b).x = e(a).x And tripwire(b).y = e(a).y Then
            c = tripwire(b).net
            If tripnet(c).live = True And tripnet(c).triggered = False And tripnet(c).rel(e(a).team) = 0 Then
                tripnet(c).triggered = True
                engine_playsound soundTrip, engine_NextSlot
                ai_wiretripped c, a, e(a).x, e(a).y
            End If
        End If
    End If
Next b

End If

End Sub

Private Sub ai_wiretripped(ByVal net As Integer, ByVal victim As Integer, ByVal x As Integer, ByVal y As Integer)
Dim a As Integer
' here we send a response team
If tripnet(net).tag <> "" Then
    For a = 0 To UBound(e)
        If e(a).tag = tripnet(net).tag Then
            If e(a).bAware(victim, 0) = False Then 'only investigate if we don't know he's there!
                            
                e(a).nextstate = e(a).state
                e(a).state = "runto"
                e(a).finaldest.x = x
                e(a).finaldest.y = y
                ai_newstate a
            
                'play sound "Possible intruder - Let's investigate!"

            End If
        End If
    Next a
End If

End Sub

'shift - shift=1, ctrl=2, alt=4

'controls:
'                 LB - toggle terrain RB - toggle path   MB - rebuild walkable array
'  shift +        LB - terrain type up  RB - type down   MB - Save

'editor function
Private Sub PicScreen_Mousedown(button As Integer, shift As Integer, x As Single, y As Single)
If Cheatmode = False Then Exit Sub 'only works while cheating
Dim a As Integer
Dim bset As Boolean
   
   
   x = Int(x / TileSize + screenX)
   y = Int(y / TileSize + screenY)
   
editorX = x
editorY = y
   
If shift = 0 Then ' LB = toggle terrain, RB = toggle pathnode, MiddleB = rebuild walkable grid
   
 If button = 1 Then
 
    For a = 0 To UBound(O)
        If O(a).live = True And O(a).x = x And O(a).y = y Then
            O(a).live = False
            bset = True
            Exit For
        End If
    Next a
 
    If bset = False Then
    
     For a = 0 To UBound(O)
        If O(a).live = False Then
            O(a).live = True
            O(a).x = x
            O(a).y = y
            O(a).xw = 1
            O(a).yw = 1
            O(a).type = 9
            bset = True
            Exit For
        End If
    Next a
 
    End If
    
    
  ElseIf button = 2 Then
  
    For a = 0 To UBound(path)
        If path(a).live = True And path(a).x = x And path(a).y = y Then
            path(a).live = False
            bset = True
            Exit For
        End If
    Next a
 
    If bset = False Then
    
     For a = 0 To UBound(path)
        If path(a).live = False Then
            path(a).live = True
            path(a).x = x
            path(a).y = y
            path(a).range = 7
            bset = True
            Exit For
        End If
    Next a
 
    End If

 
  ElseIf button = 4 Or button = 3 Then
 
'(re)set up walkable array
For x = 0 To gamewidth
For y = 0 To gameheight
walkable(x, y) = True
Next y, x

editor_wallmap 9

For a = 0 To UBound(O)
If O(a).live = True Then
    For x = O(a).x To O(a).x + O(a).xw - 1
    For y = O(a).y To O(a).y + O(a).yw - 1
    walkable(x, y) = False
    Next y, x
  End If
Next a

 
 End If
 
 
ElseIf shift = 1 Then 'shift is on: LB\RB = change terrain type OR path type

 If button = 1 Then 'increase terrain type
 
    For a = 0 To UBound(O)
        If O(a).live = True And O(a).x = x And O(a).y = y Then
            O(a).type = O(a).type + 1: If O(a).type > 9 Then O(a).type = 1
            bset = True
            Exit For
        End If
    Next a
    
    For a = 0 To UBound(path)
        If path(a).live = True And path(a).x = x And path(a).y = y Then
            Select Case path(a).range
                Case 7: path(a).range = 14
                Case 14: path(a).range = 2
                Case 2: path(a).range = 4
                Case 4: path(a).range = 7
            End Select
            bset = True
            Exit For
        End If
    Next a
    
 ElseIf button = 2 Then
    For a = 0 To UBound(O)
        If O(a).live = True And O(a).x = x And O(a).y = y Then
            O(a).type = O(a).type - 1: If O(a).type < 1 Then O(a).type = 9
            bset = True
            Exit For
        End If
    Next a
    
    For a = 0 To UBound(path)
        If path(a).live = True And path(a).x = x And path(a).y = y Then
            Select Case path(a).range
                Case 7: path(a).range = 4
                Case 14: path(a).range = 7
                Case 2: path(a).range = 14
                Case 4: path(a).range = 2
            End Select
            bset = True
            Exit For
        End If
    Next a
    
 ElseIf button = 4 Or button = 3 Then
    
    editor_saveLevel
    
    
 End If
 
End If 'end of shiftmode
 
 
End Sub

'editor function
'dragging the mouse - like MouseDown without the rebuilt paths and save level functions
Private Sub PicScreen_MouseMove(button As Integer, shift As Integer, x As Single, y As Single)
If Cheatmode = False Then Exit Sub

Dim a As Integer
Dim bset As Boolean
   
   x = Int(x / TileSize + screenX)
   y = Int(y / TileSize + screenY)
   
   Me.Caption = Str$(x) & "," & Str$(y)
   
If editorX = x And editorY = y Then Exit Sub    'only count MouseMove if the mouse has moved a whole square
   editorX = x: editorY = y:        'update the current position
   
   
If shift = 0 Then ' LB = toggle terrain, RB = toggle pathnode, MiddleB = rebuild walkable grid
   
 If button = 1 Then
 
    For a = 0 To UBound(O)
        If O(a).live = True And O(a).x = x And O(a).y = y Then
            O(a).live = False
            bset = True
            Exit For
        End If
    Next a
 
    If bset = False Then
    
     For a = 0 To UBound(O)
        If O(a).live = False Then
            O(a).live = True
            O(a).x = x
            O(a).y = y
            O(a).xw = 1
            O(a).yw = 1
            O(a).type = 9
            bset = True
            Exit For
        End If
    Next a
 
    End If
    
    
  ElseIf button = 2 Then
  
    For a = 0 To UBound(path)
        If path(a).live = True And path(a).x = x And path(a).y = y Then
            path(a).live = False
            bset = True
            Exit For
        End If
    Next a
 
    If bset = False Then
    
     For a = 0 To UBound(path)
        If path(a).live = False Then
            path(a).live = True
            path(a).x = x
            path(a).y = y
            bset = True
            Exit For
        End If
    Next a
 
    End If
 
 End If
 
 
ElseIf shift = 1 Then 'shift is on: LB\RB = change terrain type OR path type

 If button = 1 Then 'increase terrain type
 
    For a = 0 To UBound(O)
        If O(a).live = True And O(a).x = x And O(a).y = y Then
            O(a).type = O(a).type + 1: If O(a).type > 9 Then O(a).type = 1
            bset = True
            Exit For
        End If
    Next a
    
    For a = 0 To UBound(path)
        If path(a).live = True And path(a).x = x And path(a).y = y Then
            Select Case path(a).range
                Case 7: path(a).range = 14
                Case 14: path(a).range = 2
                Case 2: path(a).range = 4
                Case 4: path(a).range = 7
            End Select
            bset = True
            Exit For
        End If
    Next a
    
 ElseIf button = 2 Then
    For a = 0 To UBound(O)
        If O(a).live = True And O(a).x = x And O(a).y = y Then
            O(a).type = O(a).type - 1: If O(a).type < 1 Then O(a).type = 9
            bset = True
            Exit For
        End If
    Next a
    
    For a = 0 To UBound(path)
        If path(a).live = True And path(a).x = x And path(a).y = y Then
            Select Case path(a).range
                Case 7: path(a).range = 4
                Case 14: path(a).range = 7
                Case 4: path(a).range = 2
                Case 2: path(a).range = 14
            End Select
            bset = True
            Exit For
        End If
    Next a
    
 End If
 
End If 'end of shiftmode



End Sub

Private Sub editor_wallmap(wall As Integer)
Dim a As Integer, b As Integer, dx As Integer, dy As Integer
Dim grid(-1 To 1, -1 To 1) As Boolean
'Dim wall As Integer 'index of first wall tile
Dim count As Integer, corner As Integer, side As Integer

'wall = 9

For a = 0 To UBound(O)
    If O(a).type >= wall And O(a).type <= wall + 15 Then
        
    For dx = -1 To 1
    For dy = -1 To 1
    grid(dx, dy) = False
    Next dy, dx
        
        For b = 0 To UBound(O)
    
        If O(b).live = True And O(b).type >= wall And O(b).type <= wall + 15 Then
            dx = O(a).x - O(b).x
            dy = O(a).y - O(b).y
        
            If dx >= -1 And dx <= 1 And dy >= -1 And dy <= 1 Then
                grid(dx, dy) = True
            End If
        End If
        Next b
        
    count = 0   'find how many joins we have
    side = 0
    corner = 0
    For dx = -1 To 1
    For dy = -1 To 1
    
    If (dx = 0 And dy = 0) Then
    'us
    Else
     If grid(dx, dy) = True Then
     
        count = count + 1
    
        If (dx = -1 And dy = -1) Or (dx = -1 And dy = 1) Or (dx = 1 And dy = -1) Or (dx = 1 And dy = 1) Then
            corner = corner + 1
        Else
            side = side + 1
        End If
    End If

    End If
    Next dy, dx
        
        ' 0 = no links
        ' 1 = 1 link  (end piece)
        ' 2 = 2 links (tube)
        ' 3 = 3 links (T-intersection)

            
        
    Select Case side
    
            Case 0: O(a).type = wall 'no links
            Case 1: 'top, left, down, right  End pieces.
                If grid(0, 1) = True Then O(a).type = wall + 0 + 3
                If grid(1, 0) = True Then O(a).type = wall + 0 + 4
                If grid(0, -1) = True Then O(a).type = wall + 0 + 1
                If grid(-1, 0) = True Then O(a).type = wall + 0 + 2

            Case 2:
                If grid(0, 1) = True And grid(0, -1) = True Then O(a).type = wall + 4 + 1 'verticle |
                If grid(1, 0) = True And grid(-1, 0) = True Then O(a).type = wall + 4 + 2 'horiz -
                
                If grid(0, 1) = True And grid(-1, 0) = True Then O(a).type = wall + 6 + 2  'up, left
                If grid(0, 1) = True And grid(1, 0) = True Then O(a).type = wall + 6 + 1  'up, right
                If grid(0, -1) = True And grid(-1, 0) = True Then O(a).type = wall + 6 + 4  'down, left
                If grid(0, -1) = True And grid(1, 0) = True Then O(a).type = wall + 6 + 3  'down, right
                
            Case 3:
                If grid(0, 1) = False Then O(a).type = wall + 10 + 3
                If grid(1, 0) = False Then O(a).type = wall + 10 + 4
                If grid(0, -1) = False Then O(a).type = wall + 10 + 1
                If grid(-1, 0) = False Then O(a).type = wall + 10 + 2
                            
            Case 4: O(a).type = wall + 15
                
    End Select
        
        
    End If
    
    
Next a

End Sub

Private Sub editor_catchkey()
Dim a As Integer, b As Integer, c As Integer
'keys used
'W [E [R [T [Y [U [I [O
'A S D [G [H [J [K
' N M [B


'cheats
    If (GetKeyState(vbKeyO) And KEY_PRESSED) Then p.health = 200   '
    If (GetKeyState(vbKeyI) And KEY_PRESSED) Then
       For a = 0 To UBound(e)
       If e(a).live = True And e(a).x <> -1 Then MsgBox "State " + e(a).state + ", cansee " + Str$(e(a).cansee(e(a).t)) + ", T " + Str$(e(a).t)
       Next a
    End If
    If (GetKeyState(vbKeyK) And KEY_PRESSED) Then
       MsgBox "existing enemies are smarter"
       For a = 0 To UBound(e)
       If e(a).live = True Then e(a).skill = 100
       Next a
    End If
    If (GetKeyState(vbKeyJ) And KEY_PRESSED) Then
       b = InputBox("New enemy speed")
       For a = 0 To UBound(e)
       If e(a).live = True Then e(a).mspeed = b
       Next a
    End If
    If (GetKeyState(vbKeyG) And KEY_PRESSED) Then
        For a = 0 To UBound(e)
        If e(a).live = True Then e(a).t = val(InputBox("Enter target for enemy" + Str$(a) + ":"))
        Next a
    End If
    'fun modes
    If (GetKeyState(vbKeyU) And KEY_PRESSED) Then MsgBox "Commando mode! ": p.gun(0).sspeed = 3: p.gun(0).heatinc = 5: p.gun(0).projtype = 2: p.mspeed = 2
    If (GetKeyState(vbKeyH) And KEY_PRESSED) Then MsgBox "Ninja mode!": p.gun(0).sspeed = 1: p.gun(0).heatinc = 1: p.gun(0).projtype = 4 + 5: p.mspeed = 1
    
    If (GetKeyState(vbKeyY) And KEY_PRESSED) Then
   a = val(InputBox("Enemy number 0 to 9"))
   b = 0
   Do
        b = b + 1
        c = val(InputBox("Pathnode number (0 to 49"))
   Loop While path(c).live = False And b < 3
     If b < 3 Then
      e(a).nextstate = e(a).state
      e(a).state = "runto"
      e(a).finaldest.x = path(c).x
      e(a).finaldest.y = path(c).y
      e(a).orderpriority = 2
      ai_newstate a
     End If
   End If
    If (GetKeyState(vbKeyT) And KEY_PRESSED) Then gamespeed = val(InputBox("Enter new speed, 1 or higher"))
    If (GetKeyState(vbKeyR) And KEY_PRESSED) Then nextmission = InputBox("New mission"): countdown = 1
    If (GetKeyState(vbKeyQ) And KEY_PRESSED) Then MsgBox "Cheatmode is off but active cheats will remain.": Cheatmode = False

End Sub

Private Sub editor_saveLevel()
Dim lvl() As String
ReDim lvl(gamewidth, gameheight) As String
Dim savefile As String
Dim a As Integer, b As Integer, c As Integer
Dim tempstring As String


savefile = InputBox("Enter file name without extension")
If savefile = "" Then Exit Sub Else savefile = savefile + ".tdm"


For a = 0 To gamewidth
For b = 0 To gameheight
lvl(a, b) = " "
Next b, a

For a = 0 To UBound(O)
    If O(a).live = True Then
        For b = 1 To O(a).xw
        For c = 1 To O(a).yw
            lvl(O(a).x + b - 1, O(a).y + c - 1) = Chr(O(a).type + 48)
        Next c, b
    End If
Next a

For a = 0 To UBound(path)
    If path(a).live = True Then
    Select Case path(a).range
        Case 7: lvl(path(a).x, path(a).y) = "*"
        Case 14: lvl(path(a).x, path(a).y) = "!"
        Case 4: lvl(path(a).x, path(a).y) = "~"
        Case 2: lvl(path(a).x, path(a).y) = "`"
        Case Else: MsgBox "Funny path range of " + Str$(path(a).range)
    End Select

    End If
Next a

Open App.path + "\editor\" + savefile For Output As #1

For a = 0 To gameheight
tempstring = ""
tempstring = tempstring + Chr(34)
For b = 0 To gamewidth
tempstring = tempstring + lvl(b, a)
Next b
tempstring = tempstring + Chr(34)
Print #1, tempstring
Next a

Close #1

End Sub

'Private Sub Winsock1_ConnectionRequest(ByVal requestID As Long)
'
'Winsock1.Close
'Winsock1.Accept requestID
'frm_options.txtRemote.text = Winsock1.RemoteHostIP
'frm_options.networked (True)
'net.bhost = True
'net.bclient = False
'net.state = "pregame"
'net_send "okclient"

'End Sub

'Private Sub Winsock1_DataArrival(ByVal bytesTotal As Long)
'Dim txt As String

'Winsock1.GetData txt

'Select Case net_getVar(txt, 0)
'    Case "okclient"
'        frm_options.txtRemote.text = Winsock1.RemoteHostIP
'        frm_options.networked (True)
'        net.bhost = False
'        net.bclient = True
'        net.state = "pregame"

'    Case "frame"



'    Case Else

'End Select

'End Sub

'Private Sub Winsock1_Error(ByVal number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
'MsgBox "Error " & Str$(number) & ": " & Description
'End Sub

'Private Sub net_send(ByVal txt As String)
''Winsock1.SendData txt
'End Sub

'Private Function net_on() As Boolean
'net_on = (net.bclient Or net.bhost)
'End Function

'Private Function net_getVar(ByVal txt As String, ByVal i As Integer) As String
'Dim a As Single
'Dim b As Integer, c As Integer
'
'For a = 1 To Len(txt)
'    If Mid$(txt, a, 1) = "," Then b = b + 1
'    If b = i Then
'        For c = a + 1 To Len(txt)
 '           If c = Len(txt) Then
 '           net_getVar = Mid$(txt, a + 1, Len(txt) - a)
 '           Exit For
'            Else
'            If Mid$(txt, c, 1) = "," Then net_getVar = Mid$(txt, a + 1, (c - 1) - (a + 1)): Exit For
'            End If
'        Next c
'    Exit For
'    End If
'Next a

'If b <> i Then net_getVar = ""

'End Function
