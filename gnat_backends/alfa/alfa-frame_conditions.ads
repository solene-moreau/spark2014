------------------------------------------------------------------------------
--                                                                          --
--                         GNAT BACK-END COMPONENTS                         --
--                                                                          --
--                A L F A . F R A M E _ C O N D I T I O N S                 --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
--             Copyright (C) 2011, Free Software Foundation, Inc.           --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License --
-- for  more details.  You should have  received  a copy of the GNU General --
-- Public License  distributed with GNAT; see file COPYING3.  If not, go to --
-- http://www.gnu.org/licenses for a complete copy of the license.          --
--                                                                          --
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
------------------------------------------------------------------------------

with Ada.Containers;             use Ada.Containers;
with Ada.Containers.Hashed_Maps;
with Ada.Containers.Hashed_Sets;
with Ada.Strings.Unbounded;      use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Hash;

package ALFA.Frame_Conditions is

   function Nat_Hash (X : Nat) return Hash_Type is (Hash_Type (X));

   package Nat_To_String is new Hashed_Maps
     (Key_Type        => Nat,
      Element_Type    => Unbounded_String,
      Hash            => Nat_Hash,
      Equivalent_Keys => "=",
      "="             => "=");

   package String_To_Nat is new Hashed_Maps
     (Key_Type        => Unbounded_String,
      Element_Type    => Nat,
      Hash            => Hash,
      Equivalent_Keys => "=",
      "="             => "=");

   File_Names : Nat_To_String.Map;
   --  Mapping from file numbers to file names

   File_Nums  : String_To_Nat.Map;
   --  Mapping from file names to file numbers

   type Entity_Rep is record
      File : Nat;
      Line : Nat;
      Col  : Nat;
   end record;
   --  Representative of an entity

   Null_Entity : constant Entity_Rep := Entity_Rep'(File => 0,
                                                    Line => 0,
                                                    Col  => 0);

   function Entity_Hash (E : Entity_Rep) return Hash_Type is
     (Hash_Type (E.File * 53 + E.Line * 17 + E.Col));
   --  Hash function for hashed-maps

   package Entity_Set is new Hashed_Sets
     (Element_Type        => Entity_Rep,
      Hash                => Entity_Hash,
      Equivalent_Elements => "=",
      "="                 => "=");

   package Entity_Map is new Hashed_Maps
     (Key_Type        => Entity_Rep,
      Element_Type    => Entity_Set.Set,
      Hash            => Entity_Hash,
      Equivalent_Keys => "=",
      "="             => Entity_Set."=");

   Defines : Entity_Map.Map;
   Writes  : Entity_Map.Map;
   Reads   : Entity_Map.Map;
   Callers : Entity_Map.Map;
   Calls   : Entity_Map.Map;

   procedure Add_To_Map (Map : in out Entity_Map.Map; From, To : Entity_Rep);
   --  Add the relation From -> To in map Map

   procedure Display_Maps;
   --  Send maps to output for debug

   procedure Load_ALFA (ALI_Filename : String);
   --  Extract xref information from an ALI file

end ALFA.Frame_Conditions;
