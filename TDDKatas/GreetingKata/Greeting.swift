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
            var nameList = [String]()
            var shoutNameList = [String]()
            for name in names {

                if name!.contains("\"") {
                    nameList.append(name!.replacingOccurrences(of:"\"", with:""))
                }else if name!.contains(",") {
                    let splittedNames = name!.components(separatedBy: ", ")
                    for newName in splittedNames {
                        if newName.uppercased() == newName {
                            shoutNameList.append(newName)
                        }else{
                            nameList.append(newName)
                        }
                    }
                } else if name!.uppercased() == name! {
                    shoutNameList.append(name!)
                }else{
                    nameList.append(name!)
                }
            }

            if !nameList.isEmpty && shoutNameList.isEmpty {
                return normalGreeting(nameList)
            } else if nameList.isEmpty && !shoutNameList.isEmpty {
                return shoutGreeting(shoutNameList)
            } else {
                return mixedGreeting(nameList, shoutNameList)
            }
        }

        return "Hello, my friend."
    }

    func normalGreeting(_ names: [String]) -> String {
        var greeting = "Hello, "
        for name in names {
            if names.count > 1 && name == names.last! {
                greeting.append(" and \(name)")
            }
            else {
                greeting.append("\(name)")
                if names.count > 1 && name != names[names.count-2] {
                    greeting.append(", ")
                }
            }
        }

        greeting.append(".")
        return greeting
    }

    func shoutGreeting(_ names: [String]) -> String {
        var greeting = "HELLO "
        for name in names {
            if name == names.last! && names.count > 1 {
                greeting.append(" AND \(name)")
            }
            else {
                greeting.append("\(name)")
                if names.count > 1 && name != names[names.count-2] {
                    greeting.append(", ")
                }
            }
        }

        greeting.append("!")
        return greeting
    }

    func mixedGreeting(_ names: [String], _ shoutingNames: [String]) -> String {
        let greeting = normalGreeting(names)
        let shouts = shoutGreeting(shoutingNames)

        return "\(greeting) AND \(shouts)"
    }


}
