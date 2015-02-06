%Richard Chen
%June 4th, 2013
%This program is a card game in which the user can play against a computer or a second
%user. There is also an option to view the instructions.

%---------------------------------Variables and Graphics---------------------------------

/*GUI is used extensively throughout this program to create buttons, hotkeys, radio
 selection buttons, and Text Fields.*/

import GUI

%Refer to attached table for variables and their usages.

var bet1, p1ss, p2ss, av : string
var p1n, p2n : boolean
var a : array 1 .. 15 of int
var select, font, cpu, x, y, bet, betwidget, slave, king, knight, roundn, av1 : int
var p1s, p2s : int := 1000
var check, check2, rcheck : boolean

%Draws out the three cards and stores them to be drawn in various locations and animations.

%Slave card
%cuffs and wall
for i : 1 .. 3
    drawarc (156, 150, 10 + i, 10 + i, 0, 305, black)
    drawarc (218, 150, 10 + i, 10 + i, 235, 180, black)
    drawline (100, 247 + i, 275, 247 + i, black)
end for
%chains
for i : 1 .. 2
    drawoval (137, 153, 6 + i, 4 + i, black)
    drawoval (237, 153, 6 + i, 4 + i, black)
    drawoval (133, 161, 3 + i, 6 + i, black)
    drawoval (240, 161, 3 + i, 6 + i, black)
    drawoval (133, 171, 3 + i, 6 + i, black)
    drawoval (240, 171, 3 + i, 6 + i, black)
    drawoval (133, 181, 3 + i, 6 + i, black)
    drawoval (240, 181, 3 + i, 6 + i, black)
    drawoval (133, 191, 3 + i, 6 + i, black)
    drawoval (240, 191, 3 + i, 6 + i, black)
    drawoval (133, 201, 3 + i, 6 + i, black)
    drawoval (240, 201, 3 + i, 6 + i, black)
    drawoval (133, 211, 3 + i, 6 + i, black)
    drawoval (240, 211, 3 + i, 6 + i, black)
    drawoval (133, 221, 3 + i, 6 + i, black)
    drawoval (240, 221, 3 + i, 6 + i, black)
    drawoval (133, 231, 3 + i, 6 + i, black)
    drawoval (240, 231, 3 + i, 6 + i, black)
    drawoval (133, 241, 3 + i, 6 + i, black)
    drawoval (240, 241, 3 + i, 6 + i, black)
end for
slave := Pic.New (100, 80, 275, 320)

%Knight card
%body
for i : 1 .. 4
    drawline (451 + i, 250, 451 + i, 160, red)
    drawline (451 + i, 195, 408, 210, red)
    drawline (451 + i, 195, 498, 210, red)
    drawline (451 + i, 160, 418, 123, red)
    drawline (451 + i, 160, 488, 123, red)
end for
%sword
for i : 1 .. 8
    drawline (406 + i, 208, 406 + i, 218, black)
end for
drawline (404, 218, 416, 218, grey)
drawline (404, 218, 410, 255, grey)
drawline (416, 218, 410, 255, grey)
drawfill (410, 226, grey, grey)
drawline (404, 218, 410, 255, black)
drawline (416, 218, 410, 255, black)
drawline (410, 237, 410, 222, black)
drawline (402, 218, 418, 218, black)
%shield
drawfillbox (480, 180, 510, 235, grey)
drawline (480, 235, 510, 235, black)
drawline (480, 235, 480, 180, black)
drawline (510, 235, 510, 180, black)
drawline (480, 180, 510, 180, black)
%head
drawfilloval (453, 260, 25, 25, black)
knight := Pic.New (365, 80, 540, 320)

cls

%King card
%crown
drawline (120, 225, 140, 150, blue)
drawline (120, 225, 145, 200, blue)
drawline (145, 200, 152, 240, blue)
drawline (152, 240, 170, 210, blue)
drawline (170, 210, 187, 250, blue)
drawline (204, 210, 187, 250, blue)
drawline (222, 240, 204, 210, blue)
drawline (229, 200, 222, 240, blue)
drawline (254, 225, 229, 200, blue)
drawline (254, 225, 234, 150, blue)
drawarc (187, 189, 95, 45, 240, 300, blue)
%decoration
drawfilloval (120, 225, 6, 6, black)
drawfilloval (120, 225, 5, 5, Rand.Int (0, 160))
drawfilloval (152, 240, 6, 6, black)
drawfilloval (152, 240, 5, 5, Rand.Int (0, 160))
drawfilloval (187, 250, 6, 6, black)
drawfilloval (187, 250, 5, 5, Rand.Int (0, 160))
drawfilloval (222, 240, 6, 6, black)
drawfilloval (222, 240, 5, 5, Rand.Int (0, 160))
drawfilloval (254, 225, 6, 6, black)
drawfilloval (254, 225, 5, 5, Rand.Int (0, 160))
drawarc (187, 212, 97, 45, 237, 304, blue)
drawarc (187, 225, 100, 45, 235, 305, blue)
drawfillstar (151, 173, 159, 181, Rand.Int (0, 160))
drawfillstar (184, 170, 192, 178, Rand.Int (0, 160))
drawfillstar (215, 173, 223, 181, Rand.Int (0, 160))
king := Pic.New (100, 80, 275, 320)

cls

%-------------------------------------GUI Procedures-------------------------------------

/*The following three procedures are only called when the radio button (selection) is
 pressed on the title screen. It sets a variable as a number to record the user's choice
 and discards the radio buttons.*/

proc onep
    select := 0
    cls
    GUI.Quit
    GUI.Dispose (a (7))
    GUI.Dispose (a (8))
    GUI.Dispose (a (9))
end onep

proc twop
    select := 1
    cls
    GUI.Quit
    GUI.Dispose (a (7))
    GUI.Dispose (a (8))
    GUI.Dispose (a (9))
end twop

proc instructions
    select := 2
    cls
    GUI.Quit
    GUI.Dispose (a (7))
    GUI.Dispose (a (8))
    GUI.Dispose (a (9))
end instructions

/*This is the procedure for the title screen. It writes an introduction to the program.
 It also displays the GUI radio buttons to let the user choose between one or two player
 modes or the instructions.*/

proc titlescreen
    drawfill (1, 1, 83, 83)
    font := Font.New ("Century Gothic:40")
    Draw.Text ("Welcome to:", 169, 320, font, red)
    Draw.Text ("A King's Nightmare", 80, 280, font, blue)
    Pic.Draw (slave, 80, 55, picMerge)
    Pic.Draw (king, 230, 70, picMerge)
    Pic.Draw (knight, 380, 55, picMerge)
    a (10) := GUI.CreateRadioButton (273, 100, "Void", 0, GUI.Quit)
    GUI.Hide (a (10))
    a (7) := GUI.CreateRadioButton (-1, -1, "One Player", a (10), onep)
    a (8) := GUI.CreateRadioButton (-1, -1, "Two Players", a (7), twop)
    a (9) := GUI.CreateRadioButton (-1, -1, "Instructions", a (8), instructions)
    drawfill (275, 111, 83, 83)
    loop
	exit when GUI.ProcessEvent
    end loop
end titlescreen

/*The following four procedures are only called when the card-choosing buttons are pressed
 while the user is playing the game. It changes a boolean variable - true indicates the
 specialty card was pressed, and false indicates Knight was pressed. This variable is used
 later to check which card which chosen.*/

proc choose1a
    p1n := true
    GUI.Quit
end choose1a

proc choose2a
    p1n := false
    GUI.Quit
end choose2a

proc choose1b
    p2n := true
    GUI.Quit
end choose1b

proc choose2b
    p2n := false
    GUI.Quit
end choose2b

/*The following two procedures draw the slave and the emperor hands, with the buttons that
 lets the user pick a card. It also displays the amount of Knights the user has left.*/

proc drawslave
    GUI.ResetQuit
    Pic.Draw (slave, 100, 80, picMerge)
    Pic.Draw (knight, 365, 80, picMerge)
    av := intstr (av1)
    font := Font.New ("Arial:20")
    Draw.Text (av, 330, 285, font, 176)
    Draw.Text ("x", 345, 285, font, 176)
    a (1) := GUI.CreateButtonFull (100, 40, 175, "Slave", choose1a, 0, 'q', false)
    a (2) := GUI.CreateButtonFull (365, 40, 175, "Knight", choose2a, 0, 'w', false)
    loop
	exit when GUI.ProcessEvent
    end loop
end drawslave

proc drawemp
    GUI.ResetQuit
    Pic.Draw (king, 100, 80, picMerge)
    Pic.Draw (knight, 365, 80, picMerge)
    av := intstr (av1)
    font := Font.New ("Arial:20")
    Draw.Text (av, 330, 285, font, 176)
    Draw.Text ("x", 345, 285, font, 176)
    a (3) := GUI.CreateButtonFull (100, 40, 175, "King", choose1b, 0, 'q', false)
    a (4) := GUI.CreateButtonFull (365, 40, 175, "Knight", choose2b, 0, 'w', false)
    loop
	exit when GUI.ProcessEvent
    end loop
end drawemp

%------------------------------------Misc. Procedures------------------------------------

/*The following two procedures draw out the background and card borders for the Slave
 and King screens respectively.*/

proc drawcards
    drawline (100, 80, 100, 320, black)
    drawline (100, 320, 275, 320, black)
    drawline (275, 320, 275, 80, black)
    drawline (275, 80, 100, 80, black)

    drawline (540, 80, 540, 320, black)
    drawline (540, 320, 365, 320, black)
    drawline (365, 320, 365, 80, black)
    drawline (365, 80, 540, 80, black)
    drawfill (1, 1, 84, black)
    font := Font.New ("Castellar:36")
    Draw.Text ("Slave", 240, 335, font, 176)
end drawcards

proc drawcards1
    drawline (100, 80, 100, 320, black)
    drawline (100, 320, 275, 320, black)
    drawline (275, 320, 275, 80, black)
    drawline (275, 80, 100, 80, black)

    drawline (540, 80, 540, 320, black)
    drawline (540, 320, 365, 320, black)
    drawline (365, 320, 365, 80, black)
    drawline (365, 80, 540, 80, black)
    drawfill (1, 1, 78, black)
    font := Font.New ("Edwardian Script ITC:50")
    Draw.Text ("King", 255, 337, font, 183)
end drawcards1

/*The following procedure acts as an animation screen to display the results of the
 picks in a more dramatic way. The card borders with a grey fill (implys the cards are
 upside down) are animated onto the screen along with which player played which card.
 Finally, the cards are flipped to display the picks the users made.*/

proc animation
    for i : 1 .. 100
	drawfill (1, 1, 83, 83)
	x := i - 1
	y := i div 1.25 - 1
	setscreen ("offscreenonly")
	drawline (x, y, x, 240 + y, black)
	drawline (x, 240 + y, 175 + x, 240 + y, black)
	drawline (175 + x, 240 + y, 175 + x, y, black)
	drawline (175 + x, y, x, y, black)
	drawfill (x + 1, y + 1, grey, black)
	x := maxx - i
	y := i div 1.25 - 1
	drawline (x, y, x, 240 + y, black)
	drawline (x, 240 + y, x - 175, 240 + y, black)
	drawline (x - 175, 240 + y, x - 175, y, black)
	drawline (x - 175, y, x, y, black)
	drawfill (x - 1, y + 1, grey, black)
	delay (15)
	if i = 100 then
	    delay (1000)
	end if
	y := i div 1.2658
	if select = 0 then
	    font := Font.New ("Verdana:10")
	    Draw.Text ("You", 70, maxy - y, font, 176)
	    font := Font.New ("Verdana:10")
	    Draw.Text ("Computer", 545, maxy - y, font, 176)
	    delay (15)
	    View.Update
	else
	    font := Font.New ("Verdana:10")
	    Draw.Text ("Player 1", 45, maxy - y, font, 176)
	    font := Font.New ("Verdana:10")
	    Draw.Text ("Player 2", 545, maxy - y, font, 176)
	    delay (15)
	    View.Update
	end if
	cls
    end for
    drawfill (1, 1, 83, 83)
    drawline (100, 80, 100, 320, black)
    drawline (100, 320, 275, 320, black)
    drawline (275, 320, 275, 80, black)
    drawline (275, 80, 100, 80, black)

    drawline (540, 80, 540, 320, black)
    drawline (540, 320, 365, 320, black)
    drawline (365, 320, 365, 80, black)
    drawline (365, 80, 540, 80, black)
    drawfill (101, 81, white, black)
    drawfill (366, 81, white, black)
    if select = 0 then
	font := Font.New ("Verdana:10")
	Draw.Text ("You", 70, maxy - y, font, 176)
	font := Font.New ("Verdana:10")
	Draw.Text ("Computer", 545, maxy - y, font, 176)
	delay (15)
	View.Update
    else
	font := Font.New ("Verdana:10")
	Draw.Text ("Player 1", 45, maxy - y, font, 176)
	font := Font.New ("Verdana:10")
	Draw.Text ("Player 2", 545, maxy - y, font, 176)
	delay (15)
	View.Update
    end if
    if rcheck = false then
	if p1n = true then
	    Pic.Draw (slave, 100, 80, picMerge)
	else
	    Pic.Draw (knight, 100, 80, picMerge)
	end if
	if p2n = true then
	    Pic.Draw (king, 365, 80, picMerge)
	else
	    Pic.Draw (knight, 365, 80, picMerge)
	end if
    else
	if p1n = true then
	    Pic.Draw (slave, 365, 80, picMerge)
	else
	    Pic.Draw (knight, 365, 80, picMerge)
	end if
	if p2n = true then
	    Pic.Draw (king, 100, 80, picMerge)
	else
	    Pic.Draw (knight, 100, 80, picMerge)
	end if
    end if
    View.Update
    delay (1500)
    setscreen ("nooffscreenonly")
end animation

%-------------------------------------Game Procedures------------------------------------

/*The four game procedures represent the four different modes of the game - playing as
 Slave in One Player mode, playing as King in One Player mode, P1 playing as Slave in Two
 Player mode and P2 playing as Slave in Two Player mode. The reasoning for the necessity
 of four procedures is due to the order of the picks (Slave always needs to go first, the
 need for computer generated data (the computer's bets as Slave), the win, lose, and
 score messages that are displayed to the user(s), and the calculations for the change
 in scores depending on who won and lost. It is here that the drawing, winning animation,
 and GUI button procedures are called. For One Player, the card that the comptuer chooses
 is picked andomly, with a higher chance to choose the specialty card as the number of
 Citizen cards decrease. Also, the amount that the computer bets as slave is a random
 integer between two specific formulas that factor in the difference between the scores
 and the score of the opponent (the user). This is to ensure the bets are reasonable, and
 the amount bet increases when the computer is about to lose.*/

%---------------------------------------ONE PLAYER---------------------------------------

proc onep1
    check := false
    for i : 1 .. 5
	av1 := 5 - i
	if i = 5 and check = false then
	    check := true
	    cls
	    drawfill (1, 1, 60, 60)
	    font := Font.New ("Trajan Pro:17:bold")
	    Draw.Text ("By default, you have to play Slave", 90, 300, font, black)
	    Draw.Text ("against the king playing King.", 120, 260, font, black)
	    font := Font.New ("Trajan Pro:17")
	    Draw.Text ("You win!", 260, 160, font, 230)
	    p1s := p1s + 4 * bet
	    p2s := p2s - 4 * bet
	    delay (2000)
	end if
	if check = false then
	    cls
	    drawcards
	    drawslave
	    GUI.Dispose (a (1))
	    GUI.Dispose (a (2))
	    cls
	    x := 6 - i
	    randint (cpu, 1, x)
	    if cpu = 1 then
		p2n := true
	    else
		p2n := false
	    end if
	    animation
	    if p1n = false and p2n = false then
		font := Font.New ("Trajan Pro:22")
		Draw.Text ("This round is a draw.", 140, 347, font, black)
		delay (1000)
	    elsif p1n = true and p2n = true then
		font := Font.New ("Trajan Pro:22")
		Draw.Text ("You win as the slave!", 140, 337, font, black)
		p1s := p1s + 4 * bet
		p2s := p2s - 4 * bet
		check := true
	    else
		font := Font.New ("Trajan Pro:22")
		Draw.Text ("You lose to the king.", 140, 337, font, black)
		p2s := p2s + bet
		p1s := p1s - bet
		check := true
	    end if
	end if
    end for
end onep1

proc onep2
    check := false
    for i : 1 .. 5
	av1 := 5 - i
	if i = 5 and check = false then
	    check := true
	    cls
	    drawfill (1, 1, 60, 60)
	    font := Font.New ("Trajan Pro:17:bold")
	    Draw.Text ("By default, you have to play King", 70, 300, font, black)
	    Draw.Text ("By default, you have to play King", 92, 300, font, black)
	    font := Font.New ("Trajan Pro:17")
	    Draw.Text ("You lose.", 260, 160, font, 230)
	    put "By default, the you have to play King against the slave playing Slave."
	    put "You lose."
	    p2s := p2s + 4 * bet
	    p1s := p1s - 4 * bet
	    delay (2000)
	end if
	if check = false then
	    cls
	    drawcards1
	    drawemp
	    GUI.Dispose (a (3))
	    GUI.Dispose (a (4))
	    cls
	    x := 6 - i
	    randint (cpu, 1, x)
	    if cpu = 1 then
		p1n := true
	    else
		p1n := false
	    end if
	    animation
	    if p1n = false and p2n = false then
		font := Font.New ("Trajan Pro:22")
		Draw.Text ("This round is a draw.", 140, 347, font, black)
		delay (1000)
	    elsif p1n = true and p2n = true then
		font := Font.New ("Trajan Pro:22")
		Draw.Text ("You lose to the slave.", 140, 337, font, black)
		p2s := p2s + 4 * bet
		p1s := p1s - 4 * bet
		check := true
	    else
		font := Font.New ("Trajan Pro:22")
		Draw.Text ("You win as the king!", 140, 337, font, black)
		p1s := p1s + bet
		p2s := p2s - bet
		check := true
	    end if
	end if
    end for
end onep2

%---------------------------------------TWO PLAYER---------------------------------------

proc twop1
    check := false
    for i : 1 .. 5
	av1 := 5 - i
	if i = 5 and check = false then
	    check := true
	    cls
	    drawfill (1, 1, 60, 60)
	    font := Font.New ("Trajan Pro:17:bold")
	    Draw.Text ("By default, the slave and king have to play", 40, 300, font, black)
	    Draw.Text ("Slave and King respectively.", 140, 260, font, black)
	    font := Font.New ("Trajan Pro:17")
	    Draw.Text ("Player 1, the slave, wins.", 165, 160, font, 230)
	    p1s := p1s + 4 * bet
	    p2s := p2s - 4 * bet
	    delay (2000)
	end if
	if check = false then
	    cls
	    drawcards
	    drawslave
	    GUI.Dispose (a (1))
	    GUI.Dispose (a (2))
	    cls
	    drawcards1
	    drawemp
	    GUI.Dispose (a (3))
	    GUI.Dispose (a (4))
	    cls
	    animation
	    if p1n = false and p2n = false then
		font := Font.New ("Trajan Pro:22")
		Draw.Text ("This round is a draw.", 140, 347, font, black)
		delay (1000)
	    elsif p1n = true and p2n = true then
		font := Font.New ("Trajan Pro:22")
		Draw.Text ("Player 1, the slave, wins!", 120, 337, font, black)
		p1s := p1s + 4 * bet
		p2s := p2s - 4 * bet
		check := true
	    else
		font := Font.New ("Trajan Pro:22")
		Draw.Text ("Player 2, the king, wins!", 120, 337, font, black)
		p2s := p2s + bet
		p1s := p1s - bet
		check := true
	    end if
	end if
    end for
end twop1

proc twop2
    check := false
    for i : 1 .. 5
	av1 := 5 - i
	if i = 5 and check = false then
	    check := true
	    cls
	    drawfill (1, 1, 60, 60)
	    font := Font.New ("Trajan Pro:17:bold")
	    Draw.Text ("By default, the slave and king have to play", 40, 300, font, black)
	    Draw.Text ("Slave and King respectively.", 140, 260, font, black)
	    font := Font.New ("Trajan Pro:17")
	    Draw.Text ("Player 2, the slave, wins.", 165, 160, font, 230)
	    p2s := p2s + 4 * bet
	    p1s := p1s - 4 * bet
	    delay (2000)
	end if
	if check = false then
	    cls
	    drawcards
	    drawslave
	    GUI.Dispose (a (1))
	    GUI.Dispose (a (2))
	    cls
	    drawcards1
	    drawemp
	    GUI.Dispose (a (3))
	    GUI.Dispose (a (4))
	    animation
	    if p1n = false and p2n = false then
		font := Font.New ("Trajan Pro:22")
		Draw.Text ("This round is a draw.", 140, 347, font, black)
		delay (1000)
	    elsif p1n = true and p2n = true then
		font := Font.New ("Trajan Pro:22")
		Draw.Text ("Player 2, the slave, wins!", 120, 337, font, black)
		p2s := p2s + 4 * bet
		p1s := p1s - 4 * bet
		check := true
	    else
		font := Font.New ("Trajan Pro:22")
		Draw.Text ("Player 1, the king, wins!", 120, 337, font, black)
		p1s := p1s + bet
		p2s := p2s - bet
		check := true
	    end if
	end if
    end for
end twop2

%-----------------------------------Betting Procedures-----------------------------------

/*The following two procedures are used to make the betting screen and process the bet
 set by the slave. It uses a GUI Text Field to recieve the bet, and then checks if the
 bet is valid - it has to be an integer between 1 and 501. If not, an error message is
 displayed and the user is given a chance to re-submit a bet. When a valid bet is placed,
 the bet is changed from a string to an integer and stored for later use.*/

proc betplaced (x : string)
    bet1 := x
    check := strintok (bet1)
    if check = true then
	bet := strint (bet1)
	if bet < 1 or bet > 501 then
	    check2 := false
	    GUI.Quit
	else
	    check2 := true
	    GUI.Quit
	end if
    else
	check2 := false
	GUI.Quit
    end if
end betplaced

proc betting
    check := true
    check2 := true
    loop
	setscreen ("offscreenonly")
	cls
	drawfill (1, 1, 43, 43)
	drawbox (40, 40, maxx - 40, maxy - 40, black)
	GUI.ResetQuit
	if check = false then
	    font := Font.New ("Trajan Pro:18")
	    Draw.Text ("You did not enter a number.", 128, 224, font, 230)
	elsif check2 = false then
	    font := Font.New ("Trajan Pro:18")
	    Draw.Text ("Please enter a number between 1 and 501", 41, 224, font, 230)
	end if
	font := Font.New ("Pristina:50")
	Draw.Text ("Betting", 230, 300, font, 183)
	betwidget := GUI.CreateTextFieldFull (258, 100, 100, "", betplaced, GUI.INDENT, 0, 0)
	View.Update
	setscreen ("nooffscreenonly")
	loop
	    exit when GUI.ProcessEvent
	end loop
	exit when check2 = true
	GUI.Dispose (betwidget)
    end loop
    setscreen ("nooffscreenonly")
end betting

%----------------------------------------Main Line---------------------------------------

/*The main line begins here. The title screen is called, and depending on what the user
 choosed with the radio, he will be directed into either the One Player, Two Player, or
 instruction modes. The scores are reset in the beginning in case the user(s) have already
 played a game.*/

loop
    GUI.ResetQuit
    titlescreen
    p1s := 1000
    p2s := 1000
    if select = 0 then

	/*In the two game modes, the betting and four game procedures are called
	 Furthermore, there is a loop to run the same game mode at a most three times, or when a
	 player has less than 0 points (he has lost and a different screen is played). There are
	 also screens that display text to inform the user(s) of who is betting, what the computer
	 has bet, when the hands are swapped, and the scores for all players. After the final
	 win and lose screens, a replay button is displayed so the user(s) can return to the
	 start menu.*/

	loop
	    cls
	    roundn := 0
	    cls
	    drawfill (1, 1, 103, 103)
	    font := Font.New ("Trajan Pro:17")
	    Draw.Text ("Please make the bet as slave.", 140, 240, font, black)
	    delay (2000)
	    rcheck := false
	    loop
		roundn := roundn + 1
		betting
		GUI.Dispose (betwidget)
		cls
		onep1
		delay (1000)
		exit when p1s < 0
		exit when p2s < 0
		p1ss := intstr (p1s)
		p2ss := intstr (p2s)
		font := Font.New ("Trajan Pro:18")
		Draw.Text ("Your score is :", 180, 51, font, black)
		Draw.Text ("The computer's score is :", 100, 25, font, black)
		Draw.Text (p1ss, 400, 51, font, 220)
		Draw.Text (p2ss, 460, 25, font, 220)
		delay (1500)
		exit when roundn = 3
	    end loop
	    exit when p1s < 0
	    exit when p2s < 0
	    cls
	    drawfill (1, 1, 103, 103)
	    font := Font.New ("Pristina:30:bold")
	    Draw.Text ("Swapping hands...", 192, 240, font, black)
	    delay (5000)
	    roundn := 0
	    rcheck := true
	    loop
		roundn := roundn + 1
		cls
		if p2s div 7 > sqrt ((p1s - p2s) ** 2) div 5 then
		    bet := Rand.Int (sqrt ((p1s - p2s) ** 2) div 5, p2s div 7)
		else
		    bet := Rand.Int (p2s div 7, sqrt ((p1s - p2s) ** 2) div 5)
		end if
		bet1 := intstr (bet)
		drawfill (1, 1, 103, 103)
		font := Font.New ("Trajan Pro:17")
		Draw.Text ("The computer sets the bet at:", 78, 240, font, black)
		Draw.Text (bet1, 475, 240, font, 220)
		delay (2000)
		cls
		onep2
		delay (1000)
		exit when p1s < 0
		exit when p2s < 0
		p1ss := intstr (p1s)
		p2ss := intstr (p2s)
		font := Font.New ("Trajan Pro:18")
		Draw.Text ("Your score is :", 180, 51, font, black)
		Draw.Text ("The computer's score is :", 100, 25, font, black)
		Draw.Text (p1ss, 400, 51, font, 220)
		Draw.Text (p2ss, 460, 25, font, 220)
		delay (1500)
		exit when roundn = 3
	    end loop
	    exit when p1s < 0
	    exit when p2s < 0
	    drawfill (1, 1, 103, 103)
	    font := Font.New ("Pristina:30:bold")
	    Draw.Text ("Swapping hands...", 192, 240, font, black)
	    delay (5000)
	end loop
	cls
	font := Font.New ("Trajan Pro:22:bold")
	if p1s < 0 then
	    for i : 1 .. 175
		drawfill (1, 1, 63, 63)
		View.Set ('offscreenonly')
		Draw.Text ("You lose to the computer.", 100, maxy - i, font, 230)
		View.Update
		delay (7)
		if i < 175 then
		    cls
		end if
	    end for
	    View.Set ('nooffscreenonly')
	else
	    for i : 1 .. 175
		drawfill (1, 1, 45, 45)
		View.Set ('offscreenonly')
		Draw.Text ("You are the final winner!", 103, maxy - i, font, 230)
		View.Update
		delay (7)
		if i < 175 then
		    cls
		end if
	    end for
	    View.Set ('nooffscreenonly')
	end if
	delay (500)
	p1ss := intstr (p1s)
	p2ss := intstr (p2s)
	font := Font.New ("Trajan Pro:18")
	Draw.Text ("Your score is :", 180, 51, font, black)
	Draw.Text ("The computer's score is :", 100, 25, font, black)
	Draw.Text (p1ss, 400, 51, font, 220)
	Draw.Text (p2ss, 460, 25, font, 220)
	delay (500)
	GUI.ResetQuit
	a (14) := GUI.CreateButtonFull (287, 110, 0, "Replay", GUI.Quit, 0, ' ', false)
	loop
	    exit when GUI.ProcessEvent
	end loop
	GUI.Dispose (a (14))
    elsif select = 1 then
	loop
	    cls
	    roundn := 0
	    cls
	    drawfill (1, 1, 103, 103)
	    font := Font.New ("Trajan Pro:17")
	    Draw.Text ("Player 1, please make the bet as slave.", 82, 240, font, black)
	    delay (2000)
	    rcheck := false
	    loop
		roundn := roundn + 1
		cls
		betting
		GUI.Dispose (betwidget)
		cls
		twop1
		delay (1000)
		exit when p1s < 0
		exit when p2s < 0
		p1ss := intstr (p1s)
		p2ss := intstr (p2s)
		font := Font.New ("Trajan Pro:18")
		Draw.Text ("Player 1's score is :", 150, 51, font, black)
		Draw.Text ("Player 2's score is :", 150, 25, font, black)
		Draw.Text (p1ss, 420, 51, font, 220)
		Draw.Text (p2ss, 420, 25, font, 220)
		delay (1500)
		exit when roundn = 3
	    end loop
	    exit when p1s < 0
	    exit when p2s < 0
	    cls
	    drawfill (1, 1, 103, 103)
	    font := Font.New ("Pristina:30:bold")
	    Draw.Text ("Swapping hands...", 192, 240, font, black)
	    delay (5000)
	    roundn := 0
	    cls
	    drawfill (1, 1, 103, 103)
	    font := Font.New ("Trajan Pro:17")
	    Draw.Text ("Player 2, please make the bet as slave.", 82, 240, font, black)
	    delay (2000)
	    rcheck := true
	    loop
		roundn := roundn + 1
		betting
		GUI.Dispose (betwidget)
		cls
		twop2
		delay (1000)
		exit when p1s < 0
		exit when p2s < 0
		p1ss := intstr (p1s)
		p2ss := intstr (p2s)
		font := Font.New ("Trajan Pro:18")
		Draw.Text ("Player 1's score is :", 150, 51, font, black)
		Draw.Text ("Player 2's score is :", 150, 25, font, black)
		Draw.Text (p1ss, 420, 51, font, 220)
		Draw.Text (p2ss, 420, 25, font, 220)
		delay (1500)
		exit when roundn = 3
	    end loop
	    exit when p1s < 0
	    exit when p2s < 0
	    cls
	    drawfill (1, 1, 103, 103)
	    font := Font.New ("Pristina:30:bold")
	    Draw.Text ("Swapping hands...", 192, 240, font, black)
	    delay (5000)
	end loop
	cls
	font := Font.New ("Trajan Pro:22:bold")
	if p1s < 0 then
	    for i : 1 .. 175
		drawfill (1, 1, 45, 45)
		View.Set ('offscreenonly')
		Draw.Text ("Player 2 is the final winner!", 80, maxy - i, font, 230)
		View.Update
		delay (7)
		if i < 175 then
		    cls
		end if
	    end for
	else
	    for i : 1 .. 175
		drawfill (1, 1, 45, 45)
		View.Set ('offscreenonly')
		Draw.Text ("Player 1 is the final winner!", 80, maxy - i, font, 230)
		View.Update
		delay (7)
		if i < 175 then
		    cls
		end if
	    end for
	end if
	View.Set ('nooffscreenonly')
	delay (500)
	p1ss := intstr (p1s)
	p2ss := intstr (p2s)
	font := Font.New ("Trajan Pro:18")
	Draw.Text ("Player 1's final score is :", 105, 51, font, black)
	Draw.Text ("Player 2's final score is :", 105, 25, font, black)
	Draw.Text (p1ss, 455, 51, font, 220)
	Draw.Text (p2ss, 455, 25, font, 220)
	delay (1000)
	GUI.ResetQuit
	a (15) := GUI.CreateButtonFull (287, 110, 0, "Replay", GUI.Quit, 0, ' ', false)
	loop
	    exit when GUI.ProcessEvent
	end loop
	GUI.Dispose (a (15))
    elsif select = 2 then

	/*The instruction screen begins with a few animations and text to introduce the
	 game and its style. Then, when the user presses a 'Continue' button, animation
	 are used to show which card beats which card visually. After this, a final screen
	 with more rules and instructions is displayed. A 'Back' button is made so that
	 the user can return back to the menu screen after.*/

	for i : 1 .. 3
	    drawfillbox ((i - 1) * (maxx div 3), (maxy div 2), i * (maxx div 3), maxy, 67)
	    delay (150)
	end for
	for i : 1 .. 3
	    drawfillbox ((i - 1) * (maxx div 3), 1, i * (maxx div 3), (maxy div 2), 67)
	    delay (150)
	end for
	for i : 1 .. 200
	    View.Set ('offscreenonly')
	    drawfill (1, 1, 67, 67)
	    drawbox (40, 40, maxx - 40, maxy - 40, black)
	    font := Font.New ("Jokerman:30:underline")
	    Draw.Text ("Instructions", 0 + i, 319, font, 199)
	    View.Update
	    if i < 200 then
		cls
	    end if
	end for
	View.Set ('nooffscreenonly')
	delay (700)
	font := Font.New ("Segoe UI:20:bold")
	Draw.Text ("This is a game of risk.", 180, 270, font, 205)
	font := Font.New ("Segoe UI:10")
	Draw.Text ("You will take turns being one of the two - slave or king.", 162, 230, font, 199)
	Draw.Text ("The slave has a slave card, the king has a king card,", 170, 210, font, 199)
	Draw.Text ("and both have four knight cards.", 225, 190, font, 199)
	font := Font.New ("Segoe UI:13")
	Draw.Text ("The slave plays first and has a much lower chance of winning.", 90, 150, font, 184)
	Draw.Text ("But the slave gets to set a bet.", 200, 120, font, 184)
	font := Font.New ("Segoe UI:13:underline")
	Draw.Text ("If he wins, he gets four times that amount.", 130, 75, font, 184)
	GUI.ResetQuit
	a (12) := GUI.CreateButtonFull (485, 70, 0, "Continue", GUI.Quit, 0, ' ', false)
	loop
	    exit when GUI.ProcessEvent
	end loop
	cls
	GUI.Dispose (a (12))
	setscreen ("offscreenonly")
	for i : 1 .. 180
	    cls
	    drawfill (1, 1, 67, 67)
	    Pic.Draw (slave, i, 80, picMerge)
	    Pic.Draw (knight, 439 - i, 80, picMerge)
	    View.Update
	    delay (5)
	end for
	for decreasing i : 180 .. 130
	    cls
	    drawfill (1, 1, 67, 67)
	    Pic.Draw (slave, i, 80, picMerge)
	    Pic.Draw (knight, 439 - i, 80, picMerge)
	    View.Update
	    delay (5)
	end for
	delay (1000)
	for i : 1 .. 160
	    x := i div 2.0779
	    y := 2 * i
	    cls
	    drawfill (1, 1, 67, 67)
	    Pic.Draw (slave, 130, 80 - y, picMerge)
	    Pic.Draw (knight, 309 - x, 80, picMerge)
	    View.Update
	    delay (5)
	end for
	font := Font.New ("Segoe UI:13")
	Draw.Text ("Knight > Slave", 265, 340, font, black)
	View.Update
	delay (2000)
	for i : 1 .. 180
	    cls
	    drawfill (1, 1, 67, 67)
	    Pic.Draw (king, i, 80, picMerge)
	    Pic.Draw (knight, 439 - i, 80, picMerge)
	    View.Update
	    delay (5)
	end for
	for decreasing i : 180 .. 130
	    cls
	    drawfill (1, 1, 67, 67)
	    Pic.Draw (king, i, 80, picMerge)
	    Pic.Draw (knight, 439 - i, 80, picMerge)
	    View.Update
	    delay (5)
	end for
	delay (1000)
	for i : 1 .. 160
	    x := i div 1.5685
	    y := 2 * i
	    cls
	    drawfill (1, 1, 67, 67)
	    Pic.Draw (king, 130 + x, 80, picMerge)
	    Pic.Draw (knight, 309, 80 - y, picMerge)
	    View.Update
	    delay (5)
	end for
	Draw.Text ("King > Knight", 267, 340, font, black)
	View.Update
	delay (2000)
	for i : 1 .. 180
	    cls
	    drawfill (1, 1, 67, 67)
	    Pic.Draw (knight, i, 80, picMerge)
	    Pic.Draw (knight, 439 - i, 80, picMerge)
	    View.Update
	    delay (5)
	end for
	for decreasing i : 180 .. 130
	    cls
	    drawfill (1, 1, 67, 67)
	    Pic.Draw (knight, i, 80, picMerge)
	    Pic.Draw (knight, 439 - i, 80, picMerge)
	    View.Update
	    delay (5)
	end for
	Draw.Text ("Knight = Knight", 258, 340, font, black)
	View.Update
	delay (2000)
	for i : 1 .. 180
	    cls
	    drawfill (1, 1, 67, 67)
	    Pic.Draw (king, i, 80, picMerge)
	    Pic.Draw (slave, 439 - i, 80, picMerge)
	    View.Update
	    delay (5)
	end for
	for decreasing i : 180 .. 130
	    cls
	    drawfill (1, 1, 67, 67)
	    Pic.Draw (king, i, 80, picMerge)
	    Pic.Draw (slave, 439 - i, 80, picMerge)
	    View.Update
	    delay (5)
	end for
	delay (1000)
	for i : 1 .. 160
	    x := i div 2.0779
	    y := 2 * i
	    cls
	    drawfill (1, 1, 67, 67)
	    Pic.Draw (king, 130, 80 - y, picMerge)
	    Pic.Draw (slave, 309 - x, 80, picMerge)
	    View.Update
	    delay (5)
	end for
	font := Font.New ("Segoe UI:13:underline")
	Draw.Text ("Slave > King", 265, 340, font, black)
	View.Update
	setscreen ("nooffscreenonly")
	delay (2000)
	cls
	drawfill (1, 1, 67, 67)
	drawbox (40, 40, maxx - 40, maxy - 40, black)
	font := Font.New ("Segoe UI:10")
	Draw.Text ("All players will start off with 1000 points.", 202, 330, font, 199)
	Draw.Text ("Whoever is playing the slave first sets the bet.", 185, 305, font, 199)
	Draw.Text ("Since the slave wins 4 times the amount he bets, he may only bet between 1 - 501.", 80, 280, font, 199)

	Draw.Text ("In One Player mode, you will start off as the slave by default.", 140, 240, font, 199)
	Draw.Text ("In Two Player mode, whoever decides to be Player 1 will start off as slave.", 100, 215, font, 199)
	Draw.Text ("Players will switch hands after 3 games.", 200, 190, font, 199)

	Draw.Text ("Press the buttons on the screen to pick which card you want to play.", 124, 150, font, 199)
	Draw.Text ("Alternatively, you can press 'q' for your specialty card (Slave/King) and 'w' for Knight.", 75, 125, font, 199)
	Draw.Text ("This is recommended in Two Player mode to help hide what your selection was.", 91, 100, font, 199)
	GUI.ResetQuit
	a (13) := GUI.CreateButtonFull (290, 55, 0, "Back", GUI.Quit, 0, ' ', false)
	loop
	    exit when GUI.ProcessEvent
	end loop
	GUI.Dispose (a (13))
    end if
end loop
