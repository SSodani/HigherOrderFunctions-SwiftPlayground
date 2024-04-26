import UIKit

struct IndieApp {
    let name: String
    let monthlyPrice: Double
    let users: Int
}

let appPortfolio = [IndieApp(name: "Creator View", monthlyPrice: 11.99, users: 4356),
                    IndieApp(name: "FitHero", monthlyPrice: 0.00, users: 1756),
                    IndieApp(name: "Buckets", monthlyPrice: 3.99, users: 7598),
                    IndieApp(name: "Connect Four", monthlyPrice: 1.99, users: 34081)]

//MARK: - Filter
//Defination - The filter function loops over every item in a collection, and returns a collection containing only items that satisfy an include condition. It's like applying an if-statement to a collection, and only keeping the values that pass the condition

let freeApps = appPortfolio.filter{$0.monthlyPrice == 0.00 }
print(freeApps)

let highUsers = appPortfolio.filter { $0.users > 5000 }
print(highUsers)

//other way to write
let highUsers_otherWay = appPortfolio.filter { indieApp in
    return indieApp.users > 5000
}
print(highUsers_otherWay)


//MARK: - Map
//Defination - The map function that we use here is available on any Collection type in Swift. The function takes a closure that is called for every element in the Collection, and returns a new element from the closure.

let appNames = appPortfolio.map{ $0.name }
print(appNames)

let appNamesSorted = appPortfolio.map{ $0.name }.sorted()
print(appNamesSorted)

let increasedPrices = appPortfolio.map { $0.monthlyPrice * 1.5 }
print(increasedPrices)

//MARK: - Reduce
//Defination: Reduce aims to combine all elements in an Array into one single value. In example below "0"/ "100" are the initialResult and "+" , "-" or closure function "{ $0 + $1.users }" is the partial result
/*initialResult:
  The value to use as the initial accumulating value. initialResult is passed to nextPartialResult the first time the closure is executed.
  nextPartialResult:
  A closure that combines an accumulating value and an element of the sequence into a new accumulating value, to be used in the next call of the nextPartialResult closure or returned to the caller.*/


let numbers = [3, 5, 9, 12, 18]

 
let sum = numbers.reduce(0, +)
print(sum)

let difference = numbers.reduce(100, -)
print(difference)

let totalUsers = appPortfolio.reduce(0, { $0 + $1.users })
print(totalUsers)


//MARK: - Chaining
let recurringRevenue = appPortfolio.map { $0.monthlyPrice * Double($0.users) }.reduce(0, +)
print(recurringRevenue)

//MARK: - Compact Map: removes nil from the array
let nilNumbers: [Int?] = [1, nil, 6, 5, nil, 9]
let nonNilNumbers = nilNumbers.compactMap{ $0 }
print(nonNilNumbers)

//MARK: - Flat Map: a simple way of converting multi-dimensional arrays into single-dimensional arrays
let arrayOfArrays: [[Int]] = [[1, 2, 3],
                              [4, 5, 6],
                              [7, 8, 9]]

let singleArray = arrayOfArrays.flatMap { $0 }
print(singleArray)

let singleArrayWithOperation = arrayOfArrays.flatMap{ $0.map { $0 * 2} }
print(singleArrayWithOperation)



