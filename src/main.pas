//Tested on FPC 3.2.2
uses crt, DisplayThings, SnakeConstants;

var
	facedTo: faceSnake;

	HeadSnake, TailSnake, temp: snake;

	deletx, delety: integer;

	c: integer;

	apple: gapple;

begin
	randomize;
	facedTo := left;

	clrscr;
	cursoroff;

	makeArena;
	delay(delayTime);
	new(HeadSnake);
	HeadSnake^.x := ScreenWidth div 2 - 1;
	HeadSnake^.y := ScreenHeight div 2;

	new(HeadSnake^.next);
	TailSnake := HeadSnake^.next;
	TailSnake^.x := HeadSnake^.x + 1;
	TailSnake^.y := HeadSnake^.y;

	new(TailSnake^.next);
	TailSnake := TailSnake^.next;
	TailSnake^.next := nil;
	TailSnake^.x := HeadSnake^.x + 2;
	TailSnake^.y := HeadSnake^.y;

	randomapple(apple);
	while true do
	begin
		GetKey(c);
		if c > 0 then
			exit;
		case c of
		-75: facedTo := left;
		-77: facedTo := right;
		-72: facedTo := up;
		-80: facedTo := down;
		end;
	
		while true do
		begin
			if not KeyPressed then
			begin
				if (HeadSnake^.x = 1) then halt(1);
				if HeadSnake^.x = ScreenWidth then halt(1);
				if HeadSnake^.y = 1 then halt(1);
				if HeadSnake^.y = ScreenHeight then halt(1);

				TailSnake := HeadSnake;
				TailSnake := TailSnake^.next;
				while TailSnake^.next <> nil do
				begin
					if (HeadSnake^.x = TailSnake^.x) and (HeadSnake^.y = TailSnake^.y) then halt(1);
					TailSnake := TailSnake^.next;
				end;

				showSnake(HeadSnake, TailSnake);
				GotoXY(1, 1);
				delay(delayTime);
				case facedTo of
				left: begin
					if (HeadSnake^.x = apple.x) and (HeadSnake^.y = apple.y) then
					begin
						randomapple(apple);
						new(temp);	
						temp^.next := HeadSnake;
						temp^.x := HeadSnake^.x - 1;
						temp^.y := HeadSnake^.y;
						HeadSnake := temp;
					end else
					begin
						new(temp);	
						temp^.next := HeadSnake;
						temp^.x := HeadSnake^.x - 1;
						temp^.y := HeadSnake^.y;
						HeadSnake := temp;

						while temp^.next^.next <> nil do
						temp := temp^.next;

						TailSnake := temp;
						temp := temp^.next;
						deletx := temp^.x;
						delety := temp^.y;

						GotoXY(deletx, delety);
						write(' ');
						dispose(temp);
						TailSnake^.next := nil;
					end;
				end;

				up: begin
					if (HeadSnake^.x = apple.x) and (HeadSnake^.y = apple.y) then
					begin
						randomapple(apple);
						new(temp);	
						temp^.next := HeadSnake;
						temp^.x := HeadSnake^.x;
						temp^.y := HeadSnake^.y - 1;
						HeadSnake := temp;
					end else
					begin
						new(temp);	
						temp^.next := HeadSnake;
						temp^.x := HeadSnake^.x;
						temp^.y := HeadSnake^.y - 1;
						HeadSnake := temp;

						while temp^.next^.next <> nil do
						temp := temp^.next;
				
						TailSnake := temp;
						temp := temp^.next;
						deletx := temp^.x;
						delety := temp^.y;
						GotoXY(deletx, delety);
						write(' ');
						dispose(temp);
						TailSnake^.next := nil;
					end;
				end;

				right: begin
					if (HeadSnake^.x = apple.x) and (HeadSnake^.y = apple.y) then
					begin
						randomapple(apple);
						new(temp);	
						temp^.next := HeadSnake;
						temp^.x := HeadSnake^.x + 1;
						temp^.y := HeadSnake^.y;
						HeadSnake := temp;

					end else
					begin
						new(temp);	
						temp^.next := HeadSnake;
						temp^.x := HeadSnake^.x + 1;
						temp^.y := HeadSnake^.y;
						HeadSnake := temp;

						while temp^.next^.next <> nil do
							temp := temp^.next;
				
						TailSnake := temp;
						temp := temp^.next;
						deletx := temp^.x;
						delety := temp^.y;

						GotoXY(deletx, delety);
						write(' ');
						dispose(temp);
						TailSnake^.next := nil;
					end;
				end;

				down: begin
				if (HeadSnake^.x = apple.x) and (HeadSnake^.y = apple.y) then
				begin
					randomapple(apple);
					new(temp);	
					temp^.next := HeadSnake;
					temp^.x := HeadSnake^.x;
					temp^.y := HeadSnake^.y + 1;
					HeadSnake := temp;
				end else
				begin
					new(temp);	
					temp^.next := HeadSnake;
					temp^.x := HeadSnake^.x;
					temp^.y := HeadSnake^.y + 1;
					HeadSnake := temp;
	
					while temp^.next^.next <> nil do
						temp := temp^.next;
				
					TailSnake := temp;
					temp := temp^.next;
					deletx := temp^.x;
					delety := temp^.y;
					GotoXY(deletx, delety);
					write(' ');
					dispose(temp);
					TailSnake^.next := nil;
					end;
				end;
			end;
		  end else
		  break;
		end;
	end;
	clrscr;
 end.
