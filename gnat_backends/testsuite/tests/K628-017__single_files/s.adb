package body S is

  function Contains (Table : IntArray; Value : Integer) return Boolean is
  begin
     for Index in Table'Range loop
        pragma Assert (for all J in Table'First .. Index - 1 =>
                         Table (J) /= Value);

        if Table(Index) = Value then
           return True;
        end if;
     end loop;

     return False;
  end Contains;

  procedure Move (Dest, Src : out IntArray) is
  begin
     for Index in Dest'Range loop
        pragma Assert ((for all J in Dest'First .. Index - 1 =>
                         Dest (J) = Src'Old (J)) and 
		       (for all J in Index .. Dest'Last =>
                         Src (J) = Src'Old (J)));

        Dest (Index) := Src (Index);
        Src (Index) := 0;
     end loop;
  end Move;

end S;

