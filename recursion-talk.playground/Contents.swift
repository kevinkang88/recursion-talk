import UIKit


// function is recursive if it calls itself

// data structure is recursive if you can describe it in terms of itself

// ex) linked list is a list node followed by a list node

class Node {
    var value:String
    var next:Node?
    
    init(value:String) {
        self.value = value
    }
}

// 1. Create a linked list with three nodes and recursively call value

print("1.")
let node1 = Node(value: "First Node")
let node2 = Node(value: "I am second")
let node3 = Node(value: "Chocolate")
node1.next = node2
node2.next = node3

func printVales(node:Node?) -> Void {
    guard let currentNode = node else {
        return
    }
    print(currentNode.value)
    printVales(node: currentNode.next)
}

printVales(node: node1)


// 2. Implement a factorial function using recursion.

print("2.")
func factorial(_ num:UInt64) -> UInt64 {
    if num < 2 {
        return 1
    }
    return num * factorial(num - 1)
}

print(factorial(3))

// 3. Implement a fibonacci function that takes a number N and returns N-th number

print("3.")
func fibos(_ num:UInt64) -> UInt64 {
    if num < 3 {
        return 1
    }
    
    return fibos(num - 1) + fibos(num - 2)
}

print(fibos(6))

// 4. Implement recursive function that returns digits in array out of integer param

print("4.")
func digits(_ num:UInt64) -> [UInt64] {
    if num < 10 {
        return [num]
    }
    let leadingDigits =  Int(num / 10)
    let lastDigit = num % 10
    return digits(UInt64(leadingDigits)) + [lastDigit]
}

print(digits(200))

// 5. write a function pow that takes two number X and Y as input and return x to the power of y

print("5.")
func pow(_ base:UInt64, _ power:UInt64) -> UInt64 {
    if power < 2 {
        return base
    }
    return base * pow(base, power - 1)
}

print(pow(2, 4))

// 6. Binary Search

print("6.")
func binarySearch(guess: NSNumber, list: [NSNumber]) -> Bool? {
    let currentGuessIndex = Int(list.count/2)
    if guess.intValue == list[currentGuessIndex].intValue {
        return true
    }
    if guess.intValue > list[currentGuessIndex].intValue {
        let rightArray = list[(currentGuessIndex + 1)...(list.count-1)]
        binarySearch(guess: guess, list: Array(rightArray))
    } else {
        let leftArray = list[0...currentGuessIndex - 1]
        binarySearch(guess: guess, list: Array(leftArray))
    }
}
