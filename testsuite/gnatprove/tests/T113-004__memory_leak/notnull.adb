pragma SPARK_Mode;
procedure Notnull is
   type T is not null access Integer;

   X : T := new Integer'(0);  -- @RESOURCE_LEAK:PASS
   Y : T := new Integer'(0);  -- @RESOURCE_LEAK:FAIL
begin
   Y := X;  -- @RESOURCE_LEAK:FAIL

   for I in 1 .. 10 loop
      Y := new Integer'(0);  -- @RESOURCE_LEAK:FAIL
   end loop;

end Notnull;
