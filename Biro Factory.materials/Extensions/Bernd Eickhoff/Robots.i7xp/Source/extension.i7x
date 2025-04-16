Robots by Bernd Eickhoff begins here.

Part 1 - Command Cubes

A command cube is a kind of thing. A command cube has text called the command. The command is usually "beep".

Nil cube is a command cube. It is nowhere. The command of the nil cube is "No Operation".

part 2 - The Command Cube Stack

Check inserting some thing into a robot (called the robot):
	if noun is a command cube:
		let count be the number of command cubes in the robot;
		if count is max index of the robot:
			say "The stack is full.";
			the rule fails;
		otherwise:
			let index be count + 1;
			remove entry index from program of robot;
			add noun at entry index in program of robot;
			continue the action;
			the rule succeeds;
	otherwise:
		say "The [noun] does not fit.";
		the rule fails.

before taking some thing:
	if noun is a command cube:
		let robot be a random robot that encloses the noun;
		if the robot is not nothing:
			say "The command cube is embedded in the robot's command stack. Press the yellow button to release the cubes." instead.

Part 3 - Robots

A robot is a kind of container. It is fixed in place. [a robot can contain command cubes]
A robot has a number called the program counter. The program counter is usually 1.
A robot has a number called the max index. The max index is usually 4. [the maximum number of command cubes it can contain]
A robot has a list of command cube called program. 
A robot has a number called process next command. Process next command is usually 0. 

Section 1 - Buttons

A robot has a number called power state. The power state of a robot is usually 1. [is it turned on or off]

A red button is a kind of thing. A red button is part of every robot. The description of the red button is "The symbol of a circle intersected by a vertical line is embossed on its side". 

A yellow button is a kind of thing. A yellow button is part of every robot. The description of the yellow button is "The symbol of a trash can is embossed on its side". 

Understand "press [something]" as pushing.

[turn robot on or off]
Instead of pushing a red button which is part of a robot (called R):
	if the power state of R is 1:
		now the power state of R is 0;
		say "The robot falls dead and silent.[line break]";
	otherwise:
		now the power state of R is 1;
		say "The robot whirrs into action, lights flashing."

[empty robot of command cubes]
Instead of pushing a yellow button which is part of a robot (called R):
	say "A little panel at the bottom of the robot whirrs open.[line break]";
	repeat with N running from 1 to the max index of R:
		Let the cube be entry N of the program of R;
		if the cube is not the nil cube:
			Now the cube is in the location of the player;
			Now entry N in program of R is the nil cube;
			say "[N]: [the cube] falls to the floor.[line break]";
	
Section 2 - Robot Behaviour

When game begins:
	[initialize program of each robot. Each location in the list must either contain a real command or a nil cube that does nothing]
	repeat with R running through robots:
		now the carrying capacity of R is the max index of R;
		repeat with N running from 1 to the max index of R:
			let cube be entry N of the program of R;
			if cube is nothing:				
				add nil cube to the program of R.


Every turn:
	repeat with R running through robots:
		If the power state of R is 1:
			if process next command of R is 1:
				increment the program counter of R;
				now process next command of R is 0;
			if the program counter of R is greater than the max index of R:
				now the program counter of R is 1;
			let the current-program be the program of R;
			let the active-cube be entry (program counter of R) of the current-program;
			if the active-cube is the nil cube:
				now process next command of R is 1;
			otherwise:							
				let the current-command be the command of the active-cube;
				if the current-command is "Beep", carry out the beep activity with R;
				if the current-command is "Dance", carry out the dance activity with R;
				if the current-command is "Seek Player", carry out the seek player activity with R.

Instead of examining a robot (called R):
	say "A standard Roboton utility unit.";
	Say program of R;
	say "[description of R][line break]";
	say "A red power button [if the power state of R is 1](glowing) [otherwise](extinguished) [end if]and a yellow trash can button are protuding on top.";
	say "A narrow plexiglass window shows the stack of command cubes it contains:[line break]";
	repeat with N running from 1 to the max index of R:
		let cube be entry N of the program of R;
		if cube is nil cube:
			say "Position [N] is empty.[no line break]";
			if N is program counter of R:
				say " It  glows faintly.[no line break]";
			say "[line break]";
		otherwise:
			say "Position [N] contains the [cube]. [description of the cube][no line break]";
			If N is program counter of R:
				say " It is faintly glowing.[no line break]";
			say line break.
			
Part 4 - Commands

beep something is an activity on robots.
Rule for beep robot (called R):
	if the location of R is the location of the player:
		say "The [R] is beeping happily.";
	now process next command of R is 1.

dance something is an activity on robots.
Rule for dance robot (called R):
	if the location of R is the location of the player:
		say "The [R] gracefully waltzes about.";
	now process next command of R is 1.

seek player something is an activity on robots.
Rule for seek player robot (called R):
	if the location of R is the location of the player:
		now process next command of R is 1;
	otherwise:
		let the way be the best route from the location of R to the location of the player;
		try R going the way.
		
Robots ends here.