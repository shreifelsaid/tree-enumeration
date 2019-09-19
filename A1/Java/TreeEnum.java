import java.util.ArrayList;
import java.util.Scanner;

public class TreeEnum {

/*Tree enumeration function, populates an empty list recursivley with trees of the required number of nodes*/

	public static ArrayList<String> treeVal(int n){
		ArrayList<String> treeList = new ArrayList<String>();
		if(n == 0) {
			treeList.add("");
			return treeList;
		}
		for (int i = 0; i < n; i++) {
			int nLeft = i;
			int nRight = n - i -1;
			for(String leftNode : treeVal(nLeft)) {
				for(String rightNode : treeVal(nRight)) {
					treeList.add(combine(leftNode, rightNode));
				}
			}
		}
		return treeList;
		
	}
//combine function, takes in two strings x and y and returns the form (x.y)
	public static String combine (String x, String y) {
		return "(" + x + "." + y + ")";
	}
//scans for user input and prints out all the trees of that number of nodes
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.print("Please provide the number of nodes: ");
		int n = scan.nextInt();
		for(String tree : treeVal(n)) {
			System.out.println(tree);
		}
		
		
	}
}
