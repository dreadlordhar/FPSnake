unit SnakeConstants;

interface
const
	snakebodychar = '#';
	delayTime = 70; {0.07 second}

type
	snake = ^snakein;
	snakein = record
		x: integer;
		y: integer;
		next: snake;
	end;

	faceSnake = (up, down, right, left);
	
	gapple = record
		x: integer;
		y: integer;
	end;
implementation
begin end.
