

#include<iostream>  
#include <list> 
#include <iterator> 
#include <string>


using namespace std; 

//combine function takes two strings x and y and outputs (x.y)
string combine (string x , string y){
    return "(" + x + "." + y + ")";
}

//treeVal function uses the c++11 range-based for loop (similar to python and enhanced for loops in java), as a shorthand way of using iterators.

list <string> treeVal(int n){
    list <string> treeList;
    if (n == 0){
        treeList.push_back("");
        return treeList;
    }
    for (int i = 0; i < n; i++){
        int nLeft = i;
        int nRight = n - i - 1;
        for(string leftNode : treeVal(nLeft)) {
			for(string rightNode : treeVal(nRight)) {
					treeList.push_back(combine(leftNode, rightNode));
			}
		}
    }
    return treeList;
}

// we read in the number of nodes and then print the trees each on a new line
int main() 
{ 
    int n;
    cout << "Please provide the number of nodes: ";
    cin >> n;
    for(string tree: treeVal(n)){
        cout << tree + "\n";
    }
    return 0; 
}
