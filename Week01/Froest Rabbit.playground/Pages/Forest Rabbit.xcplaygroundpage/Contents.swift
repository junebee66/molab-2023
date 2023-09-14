func drawTree(height: Int) -> [String] {
    var tree = [String]()

    for i in 1...height {
        let spaces = String(repeating: " ", count: height - i)
        let stars = String(repeating: "*", count: 2 * i - 1)
        let treeRow = spaces + stars
        tree.append(treeRow)
    }

    // Draw the tree trunk
    let trunkSpaces = String(repeating: " ", count: height - 1)
    let trunk = trunkSpaces + "|"
    tree.append(trunk)

    return tree
}

func drawForest(numTrees: Int, treeHeight: Int) {
    // Create an array to store the trees
    var allTrees = [[String]]()

    // Generate the trees
    for _ in 1...numTrees {
        let tree = drawTree(height: treeHeight)
        allTrees.append(tree)
    }

    // Define the rabbit emoji
    let rabbit = "🧚‍♀️"

    // Calculate the width of each tree row
    let rowWidth = (treeHeight * 2) + 1

    // Print the forest with the rabbit
    for i in 0..<treeHeight + 1 {
        var row = ""
        for tree in allTrees {
            if i < tree.count {
                row += tree[i]
                let extraSpaces = rowWidth - tree[i].count
                row += String(repeating: " ", count: extraSpaces + 3) // Adjust spacing as needed
            } else {
                row += String(repeating: " ", count: rowWidth + 3)
            }
        }
        if i == treeHeight / 2 {
            row += rabbit
        }
        print(row)
    }
}

// Call the function to draw a forest with a rabbit
drawForest(numTrees: 5, treeHeight: 6) // Adjust the numb

print ("🌱🌱🌱🌱🌱🐇🌱🌱🌷🌱🌱🌱🌷🌱🌱🌱🌱🦔🌱🌱🌷🌱🌱🌱🌷🌱🌱🌱🌱🐿️🌱🦔🌱🌱🌷🌱🌱🌱🌷🌱🌱")
print ("🌱🌱🌱🌱🌱🐇🌱🌱🌷🌱🌱🌱🌱🌱🌷🌱🌱🌱🌱🐿️🌱🦔🌱🌱🌷🌱🌱🌱🌷🌱🌱")
// Call the function to draw a forest with a rabbit
//drawForest(numTrees: 5, treeHeight: 6)
