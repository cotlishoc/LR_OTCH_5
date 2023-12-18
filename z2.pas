type
  mass = array[1..10000] of integer;
var
  f1, f2: text;
  i,n, z: integer;
  a: mass;

procedure min(var a: mass; l, r: integer);
var
  s, min, i, j: integer;
begin
  for i := 1 to n - 1 do
  begin
    min := i;
    for j := i + 1 to n do
      if a[min] > a[j] then
        min := j;
    if min <> i then
    begin
      s := a[i];
      a[i] := a[min];
      a[min] := s;
    end;
  end;
end;

procedure max(var a: mass; l, r: integer);
var
  s, max, i, j: integer;
begin
  for i := 1 to n - 1 do
  begin
    max := i;
    for j := i + 1 to n do
      if a[max] < a[j] then
        max := j;
    if max <> i then
    begin
      s := a[i];
      a[i] := a[max];
      a[max] := s;
    end;
  end;
end;

begin
    assign(f1, 'z2input.txt'); 
  reset(f1);
  readln(f1, n);
  for i := 1 to n do 
    read(f1, a[i]);
  close(f1);
  writeln('Выберите порядок сортировки:');
  writeln('1. По возрастанию');
  writeln('2. По убыванию');
  write('Введите номер: ');
 
  var choice: Integer;
  readln(choice);
  case choice of
    1: min(a, 1, n); // сортировка по возрастанию
    2: max(a, 1, n); // сортировка по убыванию
  else begin
      writeln('Некорректный выбор.');
      Halt;
    end;
  end;
  assign(f2, 'z2output.txt'); 
  rewrite(f2);
  for i := 1 to n do 
    write(f2, a[i], ' ');
  close(f2);
  writeln('Результат сортировки записан в файл outpopit.txt!');
end.