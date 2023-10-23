unit DisplayThings;

interface
uses crt, SnakeConstants;

procedure showSnake(HeadSnake, TailSnake: snake);

procedure makeArena;

procedure getkey(var code: integer);

procedure randomapple(var apple: gapple);

implementation

procedure getkey(var code: integer);
var
	c: char;
begin
	c := ReadKey;
	if c = #0 then
	begin
		c := ReadKey;
		code := -ord(c);
	end
	else begin
		code := ord(c);
	end;
end;

procedure randomapple(var apple: gapple);
begin
	while true do
	begin
		apple.x := random(ScreenWidth);
		apple.y := random(ScreenHeight);

		if (apple.x = 1) or (apple.y = 1) or (apple.x = ScreenWidth) or (apple.y = ScreenHeight) then
		begin
			continue;
		end else
		begin
			GotoXY(apple.x, apple.y);
			write('0');
			break;
		end;
	end;
end;

procedure showSnake(HeadSnake, TailSnake: snake);
begin
	Tailsnake := HeadSnake;
	GotoXY(TailSnake^.x, TailSnake^.y);
	write(snakebodychar);
	
	while true do
		begin
		if TailSnake^.next <> nil then
		begin
			TailSnake := TailSnake^.next;
			GotoXY(TailSnake^.x, TailSnake^.y);
			write(snakebodychar);
		end else
		begin
			break;
		end;
	end;
end;

procedure makeArena;
var
	i: integer;
begin
	for i := 1 to ScreenHeight do
	begin
		GotoXY(1, i);
		write('|');
	end;
	
	for i := 1 to ScreenHeight dounit SnakeConstants;

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

	begin
		GotoXY(ScreenWidth, i);
		write('|');
	end;

	for i := 1 to ScreenWidth do
	begin
		GotoXY(i, 1);
		write('-');
	end;

	for i := 1 to ScreenWidth - 1 do
	begin
		GotoXY(i, ScreenHeight);
		write('-');
	end;
end;		

end.
