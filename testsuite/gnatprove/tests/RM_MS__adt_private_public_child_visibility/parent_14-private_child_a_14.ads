private package Parent_14.Private_Child_A_14
  with SPARK_Mode
is
   function F (X : Integer) return Integer
     with Global   => null,
          Annotate => (GNATprove, Always_Return);
end Parent_14.Private_Child_A_14;
