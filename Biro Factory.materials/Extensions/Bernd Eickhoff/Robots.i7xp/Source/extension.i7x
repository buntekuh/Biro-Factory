Robots by Bernd Eickhoff begins here.

Part 1 - Command Cubes

A command cube is a kind of thing. A command cube has a text called the command. The command is usually "beep".

The nil cube is a command cube. It is nowhere. The command of the nil cube is "No Operation".

part 2 - Sockets

A socket is a kind of container. The carrying capacity of a socket is 1. A socket has a number called the index.

Instead of inserting some thing into a socket (called the socket):
	if noun is a command cube:
		let R be a random robot that encloses the socket;
		let index be the index of the socket;
		remove entry index from program of R;
		add noun at entry index in program of R;
		continue the action;
	otherwise:
		say "The [noun] does not fit."

before taking some thing:
	if noun is a command cube:
		let socket be a random socket that encloses the noun;
		if the socket is not nothing:
			let index be the index of the socket;
			let R be a random robot that encloses the socket;
			remove entry index from program of R;
			add nil cube at entry index in program of R.

Part 3 - Robots

A robot is a kind of container. It is fixed in place. 
A robot has a number called the program counter. The program counter is usually 1.
A robot has a list of command cube called the program.
The program usually is {nil cube,nil cube,nil cube,nil cube}.

[instead of examining a robot:
	say "[(program) in brace notation]" instead.]

Socket 1 is a kind of socket. It is part of every robot. The index of socket 1 is 1.
Socket 2 is a kind of socket. It is part of every robot. The index of socket 2 is 2.
Socket 3 is a kind of socket. It is part of every robot. The index of socket 3 is 3.
Socket 4 is a kind of socket. It is part of every robot. The index of socket 4 is 4.

Every turn:
	repeat with R running through robots:
		if the program counter of R is 5:
			now the program counter of R is 1;
		let the current-program be the program of R;
		let the active-cube be entry (program counter of R) of the current-program;
		if the active-cube is the nil cube:
			increment the program counter of R;
		otherwise:
			let the current-command be the command of the active-cube;
			if the current-command is "Beep", carry out the beeping-of-a activity with R;
			if the current-command is "Dance", carry out the dancing-of-a activity with R;
			if the current-command is "Seek Player", carry out the seeking-of-player-by activity with R.


Part 4 - Commands

beeping-of-a something is an activity on robots.
Rule for beeping-of-a robot (called R):
	if the location of R is the location of the player:
		say "The [R] is beeping happily.";
	increment the program counter of R.

dancing-of-a something is an activity on robots.
Rule for dancing-of-a robot (called R):
	if the location of R is the location of the player:
		say "The [R] gracefully waltzes about.";
	increment the program counter of R.

seeking-of-player-by something is an activity on robots.
Rule for seeking-of-player-by robot (called R):
	if the location of R is the location of the player:
		increment the program counter of R;
	otherwise:
		let the way be the best route from the location of R to the location of the player;
		try R going the way.
		
Robots ends here.