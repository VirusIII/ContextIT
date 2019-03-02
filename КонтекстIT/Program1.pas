uses crt;
{1.1.	Даны натуральное число n, целые числа a0,a1 ...,an такие, 
что каждое ai, равно нулю или единице и аn!=0. Последовательность 
a0,a1 ...,an задает двоичное представ¬ление некоторого целого числа. 
Получить последовательность нулей и единиц, задающую двоичное 
представление числа р + 1.}
var
  n, i: integer;
  a: array[1..256] of boolean;
  s: string;

procedure add(n: integer);
var
  fl,an: boolean;
begin
  fl := true;
  while fl and (n >0) do
  begin
    an:=a[n];
    a[n] := fl xor a[n];
    fl := fl and an;
    dec(n);
  end;
  if fl and (n = 0) then writeln('Произошло переполнение');
end;

begin
  writeln('Введите двоичный вектор ');
  read(s);
  writeln('Введите n');
  read(n);
  for i := 1 to s.Length do
    if(s[i] = '0') then a[i] := false
    else a[i] := true;
  if not a[n] then 
  begin
    a[n] := true;
    writeln(n, ' элемент двоичного вектора не должен быть равен нулю.\nЗаменен на 1.');
  end;
  add(n);
  for i := 1 to n do
    if a[i] then write('1') else write('0');
  writeln;
end.