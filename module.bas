Attribute VB_Name = "MainModule"
'=================================================
'=================================================
'Const limits - All groups begin with 0.
'    these may be outdated - check code for true values
'misTxtTop = 19
'flagTop = 29
'ShotTop = 19
'ExpTop = 19
'EnemyTop = 19
'ObjTop = 99
'decTop = 79
'TrigTop = 39
'pathDepth = 20 'How many nodes to check from a destination
'behindMult = 0.2 'how hard is it to see things behind


'Timer top = 9

'notes: any, when used as a group name, refers to any enemy
'do not call a group 'any'!

'===========================
'    TRIGGERS
'
'repeating, ACTWHEN, COND1, 1, 2, COND2, 1, 2, ACT1, 1,2,3 ACT2, 1, 2,3
'ACTWHEN can be "and", "or", "xor", "none", or "+-"

'       CONDITIONS
'        start of game   - "newlev"
'        Win mission     - "win"
'        flags           - "flag"   flag1,flag2,conditions (2 characters, each either + (non-zero), - (zero) or ? (anything\no flag)
'       looping\delayed  - "delay" starttime, delaybetweenloops (-1 means no loops), -1
'        kills reached   - "kills" NoOfKills, -1,-1
'        player at xy    - "playerxy" x, y, -1
'        player at side  - "playerside" Compasspoint eg "n", -1,-1
'        player at keysq - "playersq", keysq title, 0, 0
'        timer reached   - "timer_ch" timer, value, -1
'        aware of player - "aware", "num" or "group" or "any", value, how many
'        enemies live    - "enemylives", group, how many, 0
'        enemy at xy     - "enemyxy", x, y, groupname
'        enemy at keysq  - "enemysq", groupname, keysq title, how many required
'        player health   - "playerhealth", lowbound, highboundorequal, 0
'
'        tripwire        - "wireset", wirenetwork, -1, -1


'Alarm set off
'timer
'

'       ACTIONS
'     copy enemy         - "enemy",    template_enemy, x, y
'     briefing           - "briefing", text, text, text
'     Set a Timer to     - "timer_set" timer (0 to 9), number, "up" or "down" for direction to count
'     End mission        - "endmission", timedelay, nextmission, isitrelative (0 = relative, 1 = absolute)
'     lose mission       - "losemission", timedelay, 0,0
'     Set flag value     - "flag_setval" flag, value, 0
'     heal player        - "p_heal" health amount, (0 for heal\hurting, -1 for setting health), 0
'     toggle decoration  - "dec" dec number, (1 = on 0 = off -1 = toggle), 0
'     text               - "text", text, text, text
'     enable mission txt - "mistxt", number, 0 or -1 to disable, 0
'     Activate alarm     - "alarm", 0,0,0
'
'     Play sound file    - "sound", sound number, 0 ,0
'     Play speech line   - "speech",speaker, soundnumber,  0 = solo, 1 = to someone near (priority is always 100)
'
'     set screen position - "screenxy", x, y, 0
'
'     make enemy move to - "e_patrolto", enemy, KEYSQUARE, newstate
'                        - "e_goto" - will not abort move to fight, will abort for alarm
'                        - "e_mustto" - will get to exact destination, no aborting ever.
'     Set enemy attitude - "e_attitude" "group\num\any", value, attitude
'     Set e skill        - "e_skill" "group\num\any", value, skill (0 to 100) - untested-
'     Destroy enemy      - "e_destroy", "group\num\any", value, 0 - untested-
'
'     upgrade screen     - "upgscreen", 0,0,0
'
'     toggle tripwire    - "tripwire", tripwire group, toggle (1=on 0=off -1=toggle), 0

'     set enemy checkhome- "e_checkhome", group\num\any, value, checkhome (0 or 1)
'     set enemy to guard - "e_guard", group\num\any, value, keysq to guard
'     set enemy to patrol  "e_patrol", group\num\any, value, patrolroute
'     set enemy to stand - "e_stand", group\num\any, value, 0
'     set enemy to wander - "e_wander", group\num\any, value, 0 'default role

'     base interior       - "e_breach", group\num\any, value, patch number (uh oh)
'     enemy stops complex orders (guard) if he sees player in this zone.

'       To set only for higher awarenesses, add a 2 to the end. "e_guard2"
'       3=unaware (default, don't put in the 3), 2=suspect, 1=aware, 0=full aware
'       To set for _only_ the value you specify, add a dash before the number.
'       e_patrol-2. For 3, you must put in the 3 this time.

'     search for help      "e_gethelp", group\num\any, value, keysq to search to
'     how many we look for "e_gethelpn", group\num\any, value, How many

' ENEMIES
'"e", x,y, type, state, is a kill goal, tag
' Enemy types are listed in game_setupenemy function

'Enemy difficulty (Very roughly)
' type       description    number to use in a  battle
'Grunts      weak           3 newbies, easy battle
'Minigunners ok             2 newbies, ok battle
'Armoureds   ok             2 newbies, ok battle
'Commandos   good           1 newbie, good battle
'Elites      dangerous      1 newbie, hard battle
'Snipers     annoying       2 newbies, good battle


' ATTITUDES
' 0 - Aggressive, 1 - cautious, 2 - defensive, 3 = cowardly
' All enemies begin aggressive
' Cowardly is not currently supported

' TERRAIN (placed on map grid) !Out of date
' 1, 2 = Grey Rocks
' 3, 4 = Odd rocks
' 5 = Yellow wall. 6 = stained yellow wall
' 7 = Grey wall.   8 = indented grey wall.
'
' p = Pathnode (navagation point)
' Pathnodes will only link to other pathnodes that are:
' 1. Clearly visible
' 2. WITHIN 7 SQUARES - Remember, A diagonal counts as two.


' DECORATIONS
' dec,x,y,type,live
' Set live to -1 to hide decoration. It can be toggled with triggers.
' types: experiment and find out!

' KEYSQUARES
' keysq,x,y,nametag

' PATROL ROUTES
' psq,x,y,group,index,reporttothisman

'START PATROLLING - Make an enemy patrol
' patrol,group,route,index of first stop (or -1 to find closest)
'       All the enemy's roles that haven't been preset will be set to patrol.


' Patch of ground
'patch,x1,y1,x2,y2,groundstyle,is it inset?

'tripwires
' tripwire, x, y, face, group, network, live
'set live to -1 to hide tripwire

'tripnetwork settings
' tripnet, number (0 to 2), relation player, relation team 0, team 1, team 2, response tag
' a relation of zero means that the tripwires will sense that team
' response tag is that tag of the enemies who will come and investigate when the wire is trigged


' SHOT TYPES
' 0 = Blue bolt         - 40 damage, slow
' 1 = redball           - 20 damage, slow
' 2 = purple bolt       - 50 damage, fast
' 3 = fireball          - 60 damage, fast
' 4 = redball2        ?

'BRIEFING TAGS - Used in mission briefing and any Briefing trigger
'^1 or ^2 - Paragraphing
'^r, ^g, ^b, ^w -Red, green, blue or white (only 1 per page) ^x black
'^[0Button text^01] - The first 0 is the button (0 or 1),
'^[1Button text^12] - the second number is the flag that is toggled
'                     if the button is selected.
'                     The second button toggles flag 12
'
'     the { character can be used to set buttons to different mode
'     instead of flag-toggle. eg '{00' is flag-toggle mode
'Example:
' "^wWhat direction do you want to go?^2North is easier, but south tastes better.^[0Go North^10]^[1Go South^11]"
' "^wWhat direction do you want to go?^2North is easier, but south tastes better.^[0Go North{00^10]^[1Go South^11]"
'to set the second property use ^ again - ^00^02


Option Explicit

'Configurable CONSTS

Public Const misTxtTop = 19
Public Const flagTop = 29
Public Const wepTop = 2
Public Const upgTop = 4

Type savegame
       x As Integer
       y As Integer
       face As Integer
       health As Integer
       cGun(1) As Integer
       
       flag(0 To flagTop) As Integer
       misTxt(0 To misTxtTop) As Boolean
       gunMod(wepTop, upgTop) As Integer
       material As Integer
       'cInv(1) As Integer
       'invAmount(9) as integer
       episode As String         'episode filename
       mission As Integer    'Mission number
       text As String        'Save description
End Type

Global misTxt(0 To misTxtTop) As String ' mission text for the episode
                            'loaded on new game\load game

Declare Function BitBlt Lib "gdi32" _
(ByVal hDestDC As Long, _
 ByVal x As Long, _
 ByVal y As Long, _
 ByVal nWidth As Long, _
 ByVal nHeight As Long, _
 ByVal hSrcDC As Long, _
 ByVal xSrc As Long, _
 ByVal ySrc As Long, _
 ByVal dwRop As Long) As Long
 
Declare Function GetKeyState Lib "user32" (ByVal nVirtKey As Long) As Integer
Global Const KEY_TOGGLED As Integer = &H1
Global Const KEY_PRESSED As Integer = &H1000
Global Const pi = 3.141592653589

'But globals are bad!

Global Cheatmode As Boolean
Global save As savegame
Global modpath As String
Global bBackground As Boolean
Global bMusic As Boolean



Sub Main()

Randomize Timer

bBackground = False
bMusic = True

frm_menu.Show
Load frm_game

frm_game.TickDifference = 40

frm_game.engine_playintromusic
frm_menu.Labinit.Visible = False
frm_game.game_loop
End Sub

'SOUND FUNCTIONS

'Returns the higher Word value of the passed value
Function HighWord(ByVal Value As Long) As Integer
    Value = Value \ &H10000
    HighWord = val("&H" & Hex$(Value))
End Function

'Returns the Lower Word of the passed value
Function LowerWord(ByVal Value As Long) As Integer
    Value = Value And &HFFFF&
    LowerWord = val("&H" & Hex$(Value))
End Function



