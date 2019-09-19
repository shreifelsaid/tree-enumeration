package main

import ("fmt"
        )

//combine function takes in two strings x and y and returns the form (x.y)
func combine (x string , y string ) string {
        return "(" + x+ "." + y + ")"

}

//tree enumeration function takes in n as the number of nodes, and outputs a list of all possible binary trees of that number
func treeVal (n int) []string {
        if(n == 0){
                return []string{""}
        }
	//an empty list of strings.
        treeList := []string{}
        for i := 0; i < n; i++ {
                nLeft := i
                nRight := n-i-1
                for _, leftNode  := range treeVal(nLeft){
                        for _, rightNode := range treeVal(nRight) {
				//we append the combination of left and right subtrees into the tree list
                                treeList = append(treeList, combine(leftNode,rightNode))
                        }
                }

        }
        return treeList

}
//function main takes user integer input, does some type checking and then prints the trees each on a new line
func main() {

        var i int
        fmt.Print("Please provide the number of nodes: ")
        _, err := fmt.Scanf("%d", &i);
        if err != nil {
                fmt.Println(err);
        }
        for _, tree := range treeVal(i){
                fmt.Println(tree);
        }
}
