uses crt;
{5.4.	 Сведения об ученике состоят из его имени и фами¬лии и названия класса
(года обучения и буквы), в котором он учится. Дан файл, содержащий сведения
об учениках школы.  Выяснить, имеются ли в школе однофамильцы. Выяснить, 
имеются ли однофамильцы в каких-либо параллельных классах.}
type
  pupil = record
    Name: string[10];
    Surname: string[10];
    clas: string[3];
  End;

var
  f: file of pupil;
  school: array[0..255] of pupil;
  count1N: array[0..255, 0..11] of integer;
  names: array[0..255] of string;
  pup: pupil;
  i, j, k, n, countN, err, l, clas: integer; //i,j-счетчики, n- кол-во записей, countN- кол-во фамилий без повторений
  yn: string;
  fl: boolean;

begin
  //ввод записей с консоли
  i := 0;
  while true do
  begin
    write('Продолжить ввод?(д/н)');
    readln(yn);
    if (yn <> 'д') then break;
    write('Введите фамилию: ');
    readln(school[i].Surname);
    write('Введите имя: ');
    readln(school[i].Name);
    write('Введите класс: ');
    readln(school[i].clas);
    inc(i);
  end;
  //ввод записей из файла
  assign(f, 'school.txt');
  reset(f);
  while not EoF(f) do
  begin
    Read(f, pup);
    school[i] := pup;
    inc(i);
  end;
  Close(f);
  //запись в файл всех записей
  n := i;
  Rewrite(f);
  for i := 0 to n - 1 do
    write(f, school[i]);
  Close(f);
  //определение всех однофамильцев
  countN := 0;
  for i := 0 to n - 1 do
  begin
    fl := true;
    if countN > 0 then
      for j := 0 to countN - 1 do
        if school[i].Surname = names[j] then
        begin
          val(copy(school[i].clas, 1, school[i].clas.Length - 1), k, err);
          inc(count1N[j, k]);
          fl := false;
          break;
        end;
    if fl then
    begin
      val(copy(school[i].clas, 1, school[i].clas.Length - 1), k, err);
      names[countN] := school[i].Surname;
      inc(count1N[countN, k]);
      inc(countN);
    end;
  end;
  for i := 0 to countN - 1 do
    for j := 1 to 11 do
      count1N[i, 0]+= count1N[i, j];
  //вывод всех однофамильцев;
  Writeln('Однофомильцы из всех классов');
  for i := 0 to countN - 1 do
  begin
    k := count1N[i, 0];
    j := 0;
    if k > 1 then
      while k <> 0 do
      begin
        if (names[i] = school[j].Surname) then begin
          dec(k);
          writeln(school[j].Name, ' ', school[j].Surname, ' ', school[j].clas);
        end;
        inc(j);
      end;
  end;
  //вывод однофамильцев из параллельных классов
  Writeln('Однофомильцы из параллельных классов');
  for l := 1 to 11 do
    for i := 0 to countN - 1 do
    begin
      k := count1N[i, l];
      j := 0;
      if k > 1 then
        while k <> 0 do
        begin
          val(copy(school[j].clas, 1, school[j].clas.Length - 1), clas, err);
          if (names[i] = school[j].Surname) and (l=clas) then begin
            dec(k);
            writeln(school[j].Name, ' ', school[j].Surname, ' ', school[j].clas);
          end;
          inc(j);
        end;
    end;
end.