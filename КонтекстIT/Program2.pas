uses crt;
{Дано n символов. Преобразовать последовательность символов, заменив в ней  
каждую из групп стоящих рядом точек одной точкой; каждую из групп стоящих
рядом точек многоточием  (т.е. тремя точками).}
var
  n: integer;
  s1: string;

procedure swap(s1, sw: string);
var
  s, res: string;
begin
  res := '';
  s := s1;
  while (pos('..', s) > 0) do
  begin
    n := pos('..', s);
    res += Copy(s, 1, n - 1) + sw;
    while (s[n] = '.') and (n <= s.Length) do
      inc(n);
    s := Copy(s, n, s.Length - n + 1)
  end;
  res += s;
  writeln(res);
end;

begin
  writeln('Введите строку');
  readln(s1);
  writeln('Замена на точку');
  swap(s1, '.');
  writeln('Замена на троеточие');
  swap(s1, '...');
end.