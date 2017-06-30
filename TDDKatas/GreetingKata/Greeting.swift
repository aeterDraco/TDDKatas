//
//  Greeting.swift
//  TDDKatas
//
//  Created by Ricardo Quintero on 2017. 06. 28..
//  Copyright © 2017. Ricardo Quintero. All rights reserved.
//

import Foundation

class Greeting: NSObject {

    func greet(_ names: String?...) -> String {

        if names.count > 0 && names.first != nil {
            let sortedNames = sortNames(names as! [String])

            if !sortedNames.normalList.isEmpty && sortedNames.shoutingList.isEmpty {
                return normalGreeting(sortedNames.normalList)
            } else if sortedNames.normalList.isEmpty && !sortedNames.shoutingList.isEmpty {
                return shoutGreeting(sortedNames.shoutingList)
            } else {
                return mixedGreeting(sortedNames.normalList, sortedNames.shoutingList)
            }
        }

        return "Hello, my friend."
    }

    func sortNames(_ names: [String]) -> (normalList: [String], shoutingList: [String]) {
        var normalList = [String]()
        var shoutingList = [String]()

        for name in names {
            if name.contains("\"") {
                normalList.append(name.replacingOccurrences(of:"\"", with:""))
            }else if name.contains(",") {
                let splittedNames = name.components(separatedBy: ", ")
                let subSorted = sortNames(splittedNames)
                normalList.append(contentsOf: subSorted.normalList)
                shoutingList.append(contentsOf: subSorted.shoutingList)
            } else if name.uppercased() == name {
                shoutingList.append(name)
            }else{
                normalList.append(name)
            }
        }

        return (normalList, shoutingList)
    }

    func normalGreeting(_ names: [String]) -> String {
        return createGreeting("Hello, ", ".", " and ", names)
    }

    func shoutGreeting(_ names: [String]) -> String {
        return createGreeting("HELLO ", "!", " AND ", names)
    }

    func createGreeting(_ start: String, _ ending: String, _ andString: String, _ names: [String]) -> String {
        var greeting = start
        for name in names {
            if names.count > 1 && name == names.last! {
                greeting.append("\(andString)\(name)")
            }
            else {
                greeting.append("\(name)")
                if names.count > 1 && name != names[names.count-2] {
                    greeting.append(", ")
                }
            }
        }

        greeting.append(ending)
        return greeting
    }


    func mixedGreeting(_ names: [String], _ shoutingNames: [String]) -> String {
        let greeting = normalGreeting(names)
        let shouts = shoutGreeting(shoutingNames)

        return "\(greeting) AND \(shouts)"
    }


}
