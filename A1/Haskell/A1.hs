-- CSC254 Fall2019 HomeworkA1
-- Meiwen Zhou, Shreif Abdallah	
-- NetID: mzhou26, selsaid

-- [combine]: helping function that functions as nested for loops 
-- (i,j) and returns a string list(result) of all the possible combinations
-- of 2 string lists (list1, list2).

combine:: Int -> Int -> [[Char]] -> [[Char]] -> [[Char]] -> [[Char]]
combine i j list1 list2 result 
    |i == length list1 = result 
    |j == length list2 = combine (i+1) 0 list1 list2 result
    |otherwise = combine i (j+1) list1 list2 (("("++(list1!!i)++"."++(list2!!j)++")"):result)

-- [tree]: main function which takes one Int (n) and returns a 
-- list of possible n-node trees.
tree:: Int->[[Char]]
tree n 
    |n == 0 = [""]
    |n == 1 = ["(.)"]
    |otherwise =  (enumerator (n-1) 0 [])

-- [enumerator]: helping function that functions as a for loop which 
-- loops through all possible distributions of the left-child subtree 
-- tree(i) and right-child subtree tree(n-i-1), and returns a list of
-- strings of all possible binary trees that can be built from n nodes.
enumerator:: Int -> Int -> [[Char]] -> [[Char]]
enumerator i j result 
    |i < 0 = result 
    |otherwise = enumerator (i-1) (j+1) ((combine 0 0 (tree i) (tree j) [])++result)


-- [main]
main = do
     putStrLn "enter value of n:"
     n <- getLine
     let number = (read n :: Int)
     let treeList = (tree number)
     mapM_ putStrLn treeList
