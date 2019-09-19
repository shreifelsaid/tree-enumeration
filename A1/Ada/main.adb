with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers; use Ada.Containers;
with Ada.Containers.Doubly_Linked_Lists;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO; use Ada.Text_IO.Unbounded_IO;
-- main function, includes in its definition the definition of the tree enumeration function
procedure main is
-- declerative scope, where we define an integer input, which is the required number of nodes for the tree
   input : Integer;
-- here we declare a package MyTreeList which we will use to store tree objects, based on the doubly linked list container from ada standard library
package MyTrees is
      package MyTreeList is new Ada.Containers.Doubly_Linked_Lists
        (Element_Type => unbounded_string);
      use MyTreeList;
end MyTrees;
use MyTrees;
--function combine that takes as input two unbounded strings a and b and outputs the form (a,b)
--the choice to use unbounded strings is that we can have trees that extend to any length 
      function combine (a : Unbounded_String; b : Unbounded_String) return Unbounded_String is
      dot : unbounded_string := to_unbounded_string(".");
      leftParen : unbounded_string := to_unbounded_string("(");
      rightParen : unbounded_string := to_unbounded_string(")");
      result : unbounded_string;
   begin
      result := leftParen & a & dot & b & rightParen;
      return result;
   end combine;
--tree enumeration function, takes in an integer number of nodes and returns a list of trees
--the basis case is if n == 0, we return an empty list, otherwise we recurse over all possible combinations of left and right subtrees appending to the treelist
   function treeVal (n : Integer) return MyTreeList.List is
      treeList : MyTreeList.List;
      emptyList : MyTreeList.List;
      nLeft : Integer;
      nRight : Integer;
      initial : Unbounded_String := to_unbounded_string("");
   begin
      if N = 0 then
         emptyList.Append(initial);
         return emptyList;
      end if;
      for i in 0 .. n-1 loop
         nLeft := i;
         nRight := n-i-1;
         for leftNode of treeVal(nLeft) loop
            for rightNode of treeVal(nRight) loop
               treeList.Append(combine(leftNode, rightNode));
            end loop;
         end loop;
      end loop;
      return treeList;
   end treeVal;
--tree print function takes in a treelist as input and prints each tree on a new line
   procedure treePrint(n : Integer) is
      ListOfTrees : MyTreeList.List := treeVal(n);
   begin
      for Tree of ListOfTrees loop
         Ada.Text_IO.Unbounded_IO.Put_Line(Tree);
         end loop;
   end treePrint;

--body of the main function, takes in an integer from standard input and outputs a series of tree each on a new line

begin
   Put("Please provide number of nodes:");
   input := Integer'Value(Get_Line);
   treePrint(input);
end main;
