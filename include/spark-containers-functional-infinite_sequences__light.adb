------------------------------------------------------------------------------
--                                                                          --
--                        SPARK LIBRARY COMPONENTS                          --
--                                                                          --
--              SPARK.CONTAINERS.FUNCTIONAL.INFINITE_SEQUENCES              --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--          Copyright (C) 2022-2023, Free Software Foundation, Inc.         --
--                                                                          --
-- SPARK is free software;  you can  redistribute it and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion. SPARK is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation.               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
------------------------------------------------------------------------------

--  This body is provided as a work-around for a GNAT compiler bug, as GNAT
--  currently does not compile instantiations of the spec with imported ghost
--  generics.

pragma Ada_2012;

package body SPARK.Containers.Functional.Infinite_Sequences
with SPARK_Mode => Off
is

   ---------
   -- "<" --
   ---------

   function "<" (Left : Sequence; Right : Sequence) return Boolean is
     (raise Program_Error);

   ----------
   -- "<=" --
   ----------

   function "<=" (Left : Sequence; Right : Sequence) return Boolean is
     (raise Program_Error);

   ---------
   -- "=" --
   ---------

   function "=" (Left : Sequence; Right : Sequence) return Boolean is
     (raise Program_Error);

   ---------
   -- Add --
   ---------

   function Add (Container : Sequence; New_Item : Element_Type) return Sequence
   is
     (raise Program_Error);

   function Add
     (Container : Sequence;
      Position  : Big_Positive;
      New_Item  : Element_Type) return Sequence is
     (raise Program_Error);

   --------------------
   -- Constant_Range --
   --------------------

   function Constant_Range
     (Container : Sequence;
      Fst       : Big_Positive;
      Lst       : Big_Natural;
      Item      : Element_Type) return Boolean
   is
     (raise Program_Error);

   --------------
   -- Contains --
   --------------

   function Contains
     (Container : Sequence;
      Fst       : Big_Positive;
      Lst       : Big_Natural;
      Item      : Element_Type) return Boolean
   is
     (raise Program_Error);

   -------------------------
   -- Element_Logic_Equal --
   -------------------------

   function Element_Logic_Equal (Left, Right : Element_Type) return Boolean is
     (raise Program_Error);

   --------------------
   -- Empty_Sequence --
   --------------------

   function Empty_Sequence return Sequence is
     (raise Program_Error);

   ------------------
   -- Equal_Except --
   ------------------

   function Equal_Except
     (Left     : Sequence;
      Right    : Sequence;
      Position : Big_Positive) return Boolean
   is
     (raise Program_Error);

   function Equal_Except
     (Left  : Sequence;
      Right : Sequence;
      X     : Big_Positive;
      Y     : Big_Positive) return Boolean
   is
     (raise Program_Error);

   ------------------
   -- Equal_Prefix --
   ------------------

   function Equal_Prefix (Left, Right : Sequence) return Boolean is
     (raise Program_Error);

   --------------------------
   -- Equivalent_Sequences --
   --------------------------

   function Equivalent_Sequences (Left, Right : Sequence) return Boolean is
     (raise Program_Error);

   ----------
   -- Find --
   ----------

   function Find
     (Container : Sequence;
      Item      : Element_Type) return Big_Natural
   is
     (raise Program_Error);

   ---------
   -- Get --
   ---------

   function Get
     (Container : Sequence;
      Position  : Big_Integer) return Element_Type is
     (raise Program_Error);

   ----------
   -- Last --
   ----------

   function Last (Container : Sequence) return Big_Natural is
     (raise Program_Error);

   ------------
   -- Length --
   ------------

   function Length (Container : Sequence) return Big_Natural is
     (raise Program_Error);

   -----------------
   -- Range_Equal --
   -----------------

   function Range_Equal
     (Left  : Sequence;
      Right : Sequence;
      Fst   : Big_Positive;
      Lst   : Big_Natural) return Boolean
   is
     (raise Program_Error);

   -------------------
   -- Range_Shifted --
   -------------------

   function Range_Shifted
     (Left   : Sequence;
      Right  : Sequence;
      Fst    : Big_Positive;
      Lst    : Big_Natural;
      Offset : Big_Integer) return Boolean
   is
     (raise Program_Error);

   ------------
   -- Remove --
   ------------

   function Remove
     (Container : Sequence;
      Position : Big_Positive) return Sequence is
     (raise Program_Error);

   ---------
   -- Set --
   ---------

   function Set
     (Container : Sequence;
      Position  : Big_Positive;
      New_Item  : Element_Type) return Sequence is
     (raise Program_Error);
end SPARK.Containers.Functional.Infinite_Sequences;
