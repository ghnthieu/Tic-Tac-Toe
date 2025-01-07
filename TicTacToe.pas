Program Tic_Tac_Toe;
uses crt;
type mang=array[1..3,1..3] of string;
var matrix:mang;
    player,playerbot:char;
    x,y,scoreX,scoreO,scoreBot,scorePlr,scoreDraw:byte;

procedure Setup(var matrix:mang);
var i,j,t:byte;
    ch:string;
begin
  t:=0;
  for i:=1 to 3 do
    for j:=1 to 3 do
      begin
        inc(t);
        str(t,ch);
        matrix[i,j]:=ch;
      end;
end;

procedure DrawPlayer(matrix:mang);
var i,j:byte;
begin
  clrscr;
  textcolor(11);
  writeln('   Tic Tac Toe');
  for i:=1 to 3 do
    begin
      writeln('  -------------');
      write('  | ');
      for j:=1 to 3 do
        begin
          write(matrix[i,j]);
          if j<=3 then
            write(' | ');
        end;
      writeln;
    end;
  writeln(' X:',scoreX,'  Draw:',scoreDraw,'  O:',scoreO);
end;

procedure Input(var matrix:mang; player:char);
var a:byte;
begin
  writeln(player,' turn');
  write('Enter the number you want: ');readln(a);
  while ((a<1) or (a>9)) do
    begin
      write('Invalid number, please re-enter the number: ');readln(a);
    end;
  case a of
    1:if ((matrix[1,1]<>'X') and (matrix[1,1]<>'O')) then
        matrix[1,1]:=player
      else
        while ((matrix[1,1]='X') or (matrix[1,1]='O')) do
          begin
            writeln('Your move has been played');
            write('Please re-enter another number: ');readln(a);
            if (a<>1) then
              break;
          end;

    2:if ((matrix[1,2]<>'X') and (matrix[1,2]<>'O')) then
        matrix[1,2]:=player
      else
        while ((matrix[1,2]='X') or (matrix[1,2]='O')) do
          begin
            writeln('Your move has been played');
            write('Please re-enter another number: ');readln(a);
            if (a<2) then
              begin
                DrawPlayer(matrix);
                Input(matrix,player);
              end
            else
              break;
          end;

    3:if ((matrix[1,3]<>'X') and (matrix[1,3]<>'O')) then
        matrix[1,3]:=player
      else
        while ((matrix[1,3]='X') or (matrix[1,3]='O')) do
          begin
            writeln('Your move has been played');
            write('Please re-enter another number: ');readln(a);
            if (a<3) then
              begin
                DrawPlayer(matrix);
                Input(matrix,player);
              end
            else
              break;
          end;

    4:if ((matrix[2,1]<>'X') and (matrix[2,1]<>'O')) then
        matrix[2,1]:=player
      else
        while ((matrix[2,1]='X') or (matrix[2,1]='O')) do
          begin
            writeln('Your move has been played');
            write('Please re-enter another number: ');readln(a);
            if (a<4) then
              begin
                DrawPlayer(matrix);
                Input(matrix,player);
              end
            else
              break;
          end;

    5:if ((matrix[2,2]<>'X') and (matrix[2,2]<>'O')) then
        matrix[2,2]:=player
      else
        while ((matrix[2,2]='X') or (matrix[2,2]='O')) do
          begin
            writeln('Your move has been played');
            write('Please re-enter another number: ');readln(a);
            if (a<5) then
              begin
                DrawPlayer(matrix);
                Input(matrix,player);
              end
            else
              break;
          end;

    6:if ((matrix[2,3]<>'X') and (matrix[2,3]<>'O')) then
        matrix[2,3]:=player
      else
        while ((matrix[2,3]='X') or (matrix[2,3]='O')) do
          begin
            writeln('Your move has been played');
            write('Please re-enter another number: ');readln(a);
            if (a<6) then
              begin
                DrawPlayer(matrix);
                Input(matrix,player);
              end
            else
              break;
          end;

    7:if ((matrix[3,1]<>'X') and (matrix[3,1]<>'O')) then
        matrix[3,1]:=player
      else
        while ((matrix[3,1]='X') or (matrix[3,1]='O')) do
          begin
            writeln('Your move has been played');
            write('Please re-enter another number: ');readln(a);
            if (a<7) then
              begin
                DrawPlayer(matrix);
                Input(matrix,player);
              end
            else
              break;
          end;

    8:if ((matrix[3,2]<>'X') and (matrix[3,2]<>'O')) then
        matrix[3,2]:=player
      else
        while ((matrix[3,2]='X') or (matrix[3,2]='O')) do
          begin
            writeln('Your move has been played');
            write('Please re-enter another number: ');readln(a);
            if (a<8) then
              begin
                DrawPlayer(matrix);
                Input(matrix,player);
              end
            else
              break;
          end;

    9:if ((matrix[3,3]<>'X') and (matrix[3,3]<>'O')) then
        matrix[3,3]:=player
      else
        while ((matrix[3,3]='X') or (matrix[3,3]='O')) do
          begin
            writeln('Your move has been played');
            write('Please re-enter another number: ');readln(a);
            if (a<9) then
              begin
                DrawPlayer(matrix);
                Input(matrix,player);
              end
            else
              break;
          end;
  end;
end;

procedure ChoosePlayer(var player:char);
var t:byte;
begin
  randomize;
  t:=random(2);
  if (t=0) then
    player:='X';
  if (t=1) then
    player:='O';
end;

procedure TogglePlayer(var player:char);
begin
  if (player='X') then
    player:='O'
  else
    if (player='O') then
      player:='X';
end;

function Win(matrix:mang):char;
var i:byte;
begin
  //Player X
  for i:=1 to 3 do
    if (matrix[i,1]='X') and (matrix[i,2]='X') and (matrix[i,3]='X') then
      exit('X');
  for i:=1 to 3 do
    if (matrix[1,i]='X') and (matrix[2,i]='X') and (matrix[3,i]='X') then
      exit('X');
  if (matrix[1,1]='X') and (matrix[2,2]='X') and (matrix[3,3]='X') then
    exit('X');
  if (matrix[1,3]='X') and (matrix[2,2]='X') and (matrix[3,1]='X') then
    exit('X');
  //Player O
  for i:=1 to 3 do
    if (matrix[i,1]='O') and (matrix[i,2]='O') and (matrix[i,3]='O') then
      exit('O');
  for i:=1 to 3 do
    if (matrix[1,i]='O') and (matrix[2,i]='O') and (matrix[3,i]='O') then
      exit('O');
  if (matrix[1,1]='O') and (matrix[2,2]='O') and (matrix[3,3]='O') then
    exit('O');
  if (matrix[1,3]='O') and (matrix[2,2]='O') and (matrix[3,1]='O') then
    exit('O');
  exit('1');
end;

procedure WithPlayer();
var t:byte;
    ch:char;
begin
  textcolor(11);
  scoreX:=0;
  scoreO:=0;
  scoreDraw:=0;
  repeat
    t:=0;
    Setup(matrix);
    ChoosePlayer(player);
    DrawPlayer(matrix);
    while (True) do
      begin
        inc(t);
        Input(matrix,player);
        DrawPlayer(matrix);
        if (Win(matrix)='X') then
          begin
            inc(scoreX);
            DrawPlayer(matrix);
            writeln('X wins');
            break;
          end
        else
          if (Win(matrix)='O') then
            begin
              inc(scoreO);
              DrawPlayer(matrix);
              writeln('O wins');
              break;
            end
          else
            if ((Win(matrix)='1') and (t=9)) then
              begin
                inc(scoreDraw);
                DrawPlayer(matrix);
                writeln('Draw');
                break;
              end;
        TogglePlayer(player);
      end;
    writeln('Enter Y to play a new game');
    writeln('Enter N to exit the game');
    writeln('--------------------------');
    write('Your choice is: ');readln(ch);
  until ((ch='N') or (ch='n'));
end;

procedure DrawBot(matrix:mang; x,y:byte);
var i,j:byte;
begin
  clrscr;
  textcolor(11);
  writeln('   Tic Tac Toe');
  for i:=1 to 3 do
    begin
      writeln('  -------------');
      write('  | ');
      for j:=1 to 3 do
        begin
          write(matrix[i,j]);
          if j<=3 then
            write(' | ');
        end;
      writeln;
    end;
  writeln('Plr:',scorePlr,' Draw:',scoreDraw,' Bot:',scoreBot);

  case x of
    1:for i:=1 to 3 do
        if (y=i) then
          writeln('Bot moves ',i);
    2:for i:=1 to 3 do
        if (y=i) then
          writeln('Bot moves ',i+3);
    3:for i:=1 to 3 do
        if (y=i) then
          writeln('Bot moves ',i+6);
  end;
end;

procedure ChoicePlayer(var player,playerbot:char);
begin
  write('Do you choose X or O: ');readln(player);
  if (player='X') then
    playerbot:='O';
  if (player='O') then
    playerbot:='X';
end;

procedure BotEasy(var matrix:mang; playerbot:char; var x,y:byte);
begin
  randomize;
  repeat
    x:=random(4);
    y:=random(4);
  until ((matrix[x,y]<>'X') and (matrix[x,y]<>'O') and (x<>0) and (y<>0));
  matrix[x,y]:=playerbot;
end;

procedure Easy();
var t:byte;
    ch:char;
begin
  textcolor(11);
  scorePlr:=0;
  scoreBot:=0;
  scoreDraw:=0;
  repeat
    t:=0;
    x:=0;
    y:=0;
    Setup(matrix);
    ChoicePlayer(player,playerbot);
    DrawBot(matrix,x,y);
    while (True) do
      begin
        inc(t);
        Input(matrix,player);
        if (Win(matrix)<>player) then
          BotEasy(matrix,playerbot,x,y);
        if (Win(matrix)=player) then
          begin
            DrawBot(matrix,x,y);
            inc(scorePlr);
            writeln('You wins, bot lose');
            break;
          end
        else
          if (Win(matrix)=playerbot) then
            begin
              DrawBot(matrix,x,y);
              inc(scoreBot);
              writeln('Bot wins, you lose');
              break;
            end
          else
            if ((Win(matrix)='1') and (t=5)) then
              begin
                inc(scoreDraw);
                writeln('Draw');
                break;
              end;
        DrawBot(matrix,x,y);
      end;
    writeln('Enter Y to play a new game');
    writeln('Enter N to exit the game');
    writeln('--------------------------');
    write('Your choice is: ');readln(ch);
  until ((ch='N') or (ch='n'));
end;

procedure BotDifficult(var matrix:mang; playerbot:char; var x,y:byte);
var i:byte;
begin
  for i:=1 to 3 do
    if ((matrix[i,1]=playerbot) and (matrix[i,2]=playerbot) and (matrix[i,3]<>player)) then
      begin
        matrix[i,3]:=playerbot;
        x:=i;
        y:=3;
        exit;
      end;
  for i:=1 to 3 do
    if ((matrix[i,1]=playerbot) and (matrix[i,2]<>player) and (matrix[i,3]=playerbot)) then
      begin
        matrix[i,2]:=playerbot;
        x:=i;
        y:=2;
        exit;
      end;
  for i:=1 to 3 do
    if ((matrix[i,1]<>player) and (matrix[i,2]=playerbot) and (matrix[i,3]=playerbot)) then
      begin
        matrix[i,1]:=playerbot;
        x:=i;
        y:=1;
        exit;
      end;
  for i:=1 to 3 do
    if ((matrix[1,i]=playerbot) and (matrix[2,i]=playerbot) and (matrix[3,i]<>player)) then
      begin
        matrix[3,i]:=playerbot;
        x:=3;
        y:=i;
        exit;
      end;
  for i:=1 to 3 do
    if ((matrix[1,i]=playerbot) and (matrix[2,i]<>player) and (matrix[3,i]=playerbot)) then
      begin
        matrix[2,i]:=playerbot;
        x:=2;
        y:=i;
        exit;
      end;
  for i:=1 to 3 do
    if ((matrix[1,i]<>player) and (matrix[2,i]=playerbot) and (matrix[3,i]=playerbot)) then
      begin
        matrix[1,i]:=playerbot;
        x:=1;
        y:=i;
        exit;
      end;
  if ((matrix[1,1]=playerbot) and (matrix[2,2]=playerbot) and (matrix[3,3]<>player)) then
    begin
      matrix[3,3]:=playerbot;
      x:=3;
      y:=3;
      exit;
    end;
  if ((matrix[1,1]=playerbot) and (matrix[2,2]<>playerbot) and (matrix[3,3]=playerbot)) then
    begin
      matrix[2,2]:=playerbot;
      x:=2;
      y:=2;
      exit;
    end;
  if ((matrix[1,1]<>player) and (matrix[2,2]=playerbot) and (matrix[3,3]=playerbot)) then
    begin
      matrix[1,1]:=playerbot;
      x:=1;
      y:=1;
      exit;
    end;
  if ((matrix[1,3]=playerbot) and (matrix[2,2]=playerbot) and (matrix[3,1]<>player)) then
    begin
      matrix[3,1]:=playerbot;
      x:=3;
      y:=1;
      exit;
    end;
  if ((matrix[1,3]=playerbot) and (matrix[2,2]<>player) and (matrix[3,1]=playerbot)) then
    begin
      matrix[2,2]:=playerbot;
      x:=2;
      y:=2;
      exit;
    end;
  if ((matrix[1,3]<>player) and (matrix[2,2]=playerbot) and (matrix[3,1]=playerbot)) then
    begin
      matrix[1,3]:=playerbot;
      x:=1;
      y:=3;
      exit;
    end;
  for i:=1 to 3 do
    if ((matrix[i,1]=player) and (matrix[i,2]=player) and (matrix[i,3]<>player) and (matrix[i,3]<>playerbot)) then
      begin
        matrix[i,3]:=playerbot;
        x:=i;
        y:=3;
        exit;
      end;
  for i:=1 to 3 do
    if ((matrix[i,1]=player) and (matrix[i,2]<>player) and (matrix[i,3]=player) and (matrix[i,2]<>playerbot)) then
      begin
        matrix[i,2]:=playerbot;
        x:=i;
        y:=2;
        exit;
      end;
  for i:=1 to 3 do
    if ((matrix[i,1]<>player) and (matrix[i,2]=player) and (matrix[i,3]=player) and (matrix[i,1]<>playerbot)) then
      begin
        matrix[i,1]:=playerbot;
        x:=i;
        y:=1;
        exit;
      end;
  for i:=1 to 3 do
    if ((matrix[1,i]=player) and (matrix[2,i]=player) and (matrix[3,i]<>player) and (matrix[3,i]<>playerbot)) then
      begin
        matrix[3,i]:=playerbot;
        x:=3;
        y:=i;
        exit;
      end;
  for i:=1 to 3 do
    if ((matrix[1,i]=player) and (matrix[2,i]<>player) and (matrix[3,i]=player) and (matrix[2,i]<>playerbot)) then
      begin
        matrix[2,i]:=playerbot;
        x:=2;
        y:=i;
        exit;
      end;
  for i:=1 to 3 do
    if ((matrix[1,i]<>player) and (matrix[2,i]=player) and (matrix[3,i]=player) and (matrix[1,i]<>playerbot)) then
      begin
        matrix[1,i]:=playerbot;
        x:=1;
        y:=i;
        exit;
      end;
  if ((matrix[1,1]=player) and (matrix[2,2]=player) and (matrix[3,3]<>player) and (matrix[3,3]<>playerbot)) then
    begin
      matrix[3,3]:=playerbot;
      x:=3;
      y:=3;
      exit;
    end;
  if ((matrix[1,1]=player) and (matrix[2,2]<>player) and (matrix[3,3]=player) and (matrix[2,2]<>playerbot)) then
    begin
      matrix[2,2]:=playerbot;
      x:=2;
      y:=2;
      exit;
    end;
  if ((matrix[1,1]<>player) and (matrix[2,2]=player) and (matrix[3,3]=player) and (matrix[1,1]<>playerbot)) then
    begin
      matrix[1,1]:=playerbot;
      x:=1;
      y:=1;
      exit;
    end;
  if ((matrix[1,3]=player) and (matrix[2,2]=player) and (matrix[3,1]<>player) and (matrix[3,1]<>playerbot)) then
    begin
      matrix[3,1]:=playerbot;
      x:=3;
      y:=1;
      exit;
    end;
  if ((matrix[1,3]=player) and (matrix[2,2]<>player) and (matrix[3,1]=player) and (matrix[2,2]<>playerbot)) then
    begin
      matrix[2,2]:=playerbot;
      x:=2;
      y:=2;
      exit;
    end;
  if ((matrix[1,3]<>player) and (matrix[2,2]=player) and (matrix[3,1]=player) and (matrix[1,3]<>playerbot)) then
    begin
      matrix[1,3]:=playerbot;
      x:=1;
      y:=3;
      exit;
    end;
  BotEasy(matrix,playerbot,x,y);
end;

procedure Difficult();
var t:byte;
    ch:char;
begin
  textcolor(11);
  scorePlr:=0;
  scoreBot:=0;
  scoreDraw:=0;
  repeat
    t:=0;
    x:=0;
    y:=0;
    Setup(matrix);
    ChoicePlayer(player,playerbot);
    DrawBot(matrix,x,y);
    while (True) do
      begin
        inc(t);
        Input(matrix,player);
        if (t=1) then
          BotEasy(matrix,playerbot,x,y);
        if ((Win(matrix)<>player) and (t<>1) and (t<>5)) then
          BotDifficult(matrix,playerbot,x,y);
        if (Win(matrix)=player) then
          begin
            DrawBot(matrix,x,y);
            inc(scorePlr);
            writeln('You wins, bot lose');
            break;
          end
        else
          if (Win(matrix)=playerbot) then
            begin
              DrawBot(matrix,x,y);
              inc(scoreBot);
              writeln('Bot wins, you lose');
              break;
            end
          else
            if ((Win(matrix)='1') and (t=5)) then
              begin
                DrawBot(matrix,x,y);
                inc(scoreDraw);
                writeln('Draw');
                break;
              end;
        DrawBot(matrix,x,y);
      end;
    writeln('Enter Y to play a new game');
    writeln('Enter N to exit the game');
    writeln('--------------------------');
    write('Your choice is: ');readln(ch);
  until ((ch='N') or (ch='n'));
end;

procedure WithMachine();
var n:byte;
begin
  clrscr;
  writeln('Enter 1 to play with Bot easy');
  writeln('Enter 2 to play with Bot difficult');
  writeln('----------------------------------');
  write('The mode you choose is: ');readln(n);
  case n of
    1:Easy();
    2:Difficult();
  end;
end;

procedure Run();
var n:byte;
begin
  textcolor(9);
  writeln('Enter 1 to play with players');
  writeln('Enter 2 to play againt the machine');
  writeln('----------------------------------');
  write('The mode you choose is: ');readln(n);
  case n of
    1:WithPlayer();
    2:WithMachine();
  end;
end;

Begin
  clrscr;
  Run();
  readln
End.