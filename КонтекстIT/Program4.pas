uses crt;
{Дан текст.Выписать из него все слова, которые могут быть двоичной записью 
целого числа.}
var
  f: text;
  s: array[0..255] of string;
  i, n, j, posit: integer;
  res: string;

begin
writeln('Все слова, которые могут быть двоичной записью целого числа:');
  i := 0;
  assign(f, 'text.txt');
  reset(f);
  while not eof(f) do
  begin
    readln(f, s[i]);
    //writeln(s[i]);
    inc(i);
  end;
  close(f);
  n := i;
  for i := 0 to n do 
    while (pos(' ', s[i]) > 0) do 
    begin
      posit := pos(' ', s[i]);
      res := Copy(s[i], 1, posit - 1);
      s[i] := Copy(s[i], posit + 1, s[i].Length - posit);
      j := 1;
      if (res.length = 1) then
      begin
        if (res = '0') or (res = '1') then
          writeln(res)
      end
      else begin
        while (((res[j] = '0') or (res[j] = '1')) and (j < res.length) and (res.length > 1)) do
        begin
          
          //writeln(res.Length);
          inc(j);
        end;
        if j = res.length then writeln(res);
      end;
    end;
  
end.