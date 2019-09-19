import math
#main function takes in user input, an integer number of nodes, and prints out all the possible binary trees of that number
def main():
   n = eval(input("Please provide the number of nodes: "))
   for tree in treeVal(n):
      print(tree)

#n is the number of nodes
#we return an empty list if the tree has 0 nodes, otherwise we recurse and output every possible combination of left and right subtrees, this algorithim was shared on piazza by Liam Heeger. 
def treeVal(n):
   if(n == 0):
      return [""]
   treeList = []
   for i in range (n):
      nLeft = i
      nRight = n-i-1
      for leftNode in treeVal(nLeft):
         for rightNode in treeVal(nRight):
            treeList.append(combine(leftNode,rightNode))
   return treeList
#combine function takes in two trees (strings) and returns the form (leftTree.rightTree)
def combine(leftTree,rightTree):
   return "(" + leftTree + "." + rightTree + ")"
main()
