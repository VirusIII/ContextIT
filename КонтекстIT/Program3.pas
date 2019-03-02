uses crt;
{Определить функцию нахождения площади треугольника по координатам его вершин.
Найти площадь выпуклого многоугольника, по координатам его вершин, используя 
полученную функцию.}
var
  ar: array [0..255] of real;
  n, i, j, k: integer;
  x, y, x1, y1, ax, ay, area: real;

function s(x1, y1, x2, y2, x3, y3: real): real;
var
  pl: real;
begin
  pl := (1 / 2) * abs((x2 - x1) * (y3 - y1) - (x3 - x1) * (y2 - y1));
  s := pl;
end;

function f(i: integer): real;
var
  cs: real;
begin
  ax := ar[2 * i - 1] - x;
  ay := ar[2 * i] - y;
  cs := (ax + ay) / (sqrt(ax * ax + ay * ay) * sqrt(2));
  if (ax > ay) then
    cs := -arccos(cs) 
  else cs := arccos(cs);
  f := cs;
end;

begin
  writeln('Введите кол-во вершин выпуклого многоугольника');
  readln(n);
  writeln('Введите пары координат');
  for i := 1 to n do
  begin
    read(ar[2 * i - 1], ar[2 * i]);
    x += ar[2 * i - 1];
    y += ar[2 * i];
  end;
  //Определение "центра масс" фигуры.
  x /= n;
  y /= n;
  //Определение порядка точек
  for i := 1 to n-1 do
  begin
    for j := i+1 to n do 
      if f(i) > f(j) then begin
    x1 := ar[2 * j - 1];
    y1 := ar[2 * j];
    ar[2 * j - 1] := ar[2 * i - 1];
    ar[2 * j] := ar[2 * i];
    ar[2 * i - 1] := x1;
    ar[2 * i] := y1;
    end;
  end;
  //for i := 1 to n do
    //writeln(ar[2 * i - 1], ar[2 * i],' ',f(i));
  //Рассчет площади:
  area:=0;
  for i := 1 to n-1 do
  area+=s(x1,y1,ar[2 * i - 1],ar[2 * i],ar[2 * i + 1],ar[2 * i + 2]);
  area+=s(x1,y1,ar[1],ar[2],ar[2*n-1],ar[2*n]);
  writeln('Площадь фигуры:');
  writeln(area);
end.