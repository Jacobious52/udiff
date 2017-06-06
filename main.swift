//
//  main.swift
//  udiff
//
//  Created by Jacob Gonzalez on 3/6/17.
//  Copyright © 2017 Jacob Gonzalez. All rights reserved.
//

import Foundation

class Program {
    
    enum OutputFormat {
        case Bools
        case Strings
        case Emoji
    }
    
    var filenames: [URL] = []
    var record: [String:[Bool]] = [:]
    
    func output(format: OutputFormat) {
        
        let sorted = record.sorted { a, b in
            a.key.characters.count < b.key.characters.count
        }
        
        let max = record.max { a, b in
            a.key.characters.count < b.key.characters.count
        }
        let maxLength: Int
        if let max = max {
            maxLength = max.key.characters.count
        } else {
            maxLength = 0
        }
        
        if format == .Bools || format == .Emoji {
            print("Line".padding(toLength: maxLength, withPad: "_", startingAt: 0), terminator: " | ")
        }
        
        let header = filenames.map {
            $0.lastPathComponent
        }.joined(separator: " | ")
        
        print(header)
        
        
        for item in sorted {
            let row: String
            
            switch format {
            case .Strings:
                row = item.value.map {
                    $0 ? item.key.padding(toLength: maxLength, withPad: " ", startingAt: 0) : String(repeating: " ", count: maxLength)
                }.joined(separator: " | ")
                
            case .Bools:
                row = item.value.map {
                    String($0).padding(toLength: 5, withPad: " ", startingAt: 0)
                }.joined(separator: " | ")
                
                print(item.key.padding(toLength: maxLength, withPad: " ", startingAt: 0), terminator: " | ")
            
            case .Emoji:
                row = item.value.map {
                    $0 ? " ✅ " : " ❌ "
                }.joined(separator: " | ")
                
                print(item.key.padding(toLength: maxLength, withPad: " ", startingAt: 0), terminator: " | ")
            }
            
            print(row)
        }
    }
    
    func main() {
        let argc = CommandLine.arguments.count - 1
        if argc < 2 {
            print("need at least 2 files. got \(argc)")
            return
        }
        
        var format = OutputFormat.Strings
        
        var union = Set<String>()
        var sets = [Set<String>]()
        
        var argStart = 1
        if CommandLine.arguments[1].hasPrefix("--") {
            argStart = 2
            switch CommandLine.arguments[1] {
            case "--strings":
                format = .Strings
            case "--bools":
                format = .Bools
            case "--emoji":
                format = .Emoji
            default:
                print("unknown format. using --strings")
                format = .Strings
            }
        }
        
        filenames = [URL]()
        for filename in CommandLine.arguments[argStart...argc] {
            guard let url = URL(string: filename) else {
                continue
            }
            filenames.append(url)
        }
        for filename in filenames {
            guard let contents = try? String.init(contentsOfFile: filename.absoluteString) else {
                print("could not read file \(filename)")
                return
            }
            
            var set = Set<String>()
            
            contents.enumerateLines {line,_ in
                let trimmed = line.trimmingCharacters(in: .whitespacesAndNewlines)
                union.insert(trimmed)
                set.insert(trimmed)
            }
            
            sets.append(set)
        }
    
        
        for key in union {
            var row = [Bool](repeating: false, count: sets.count)
            for (i, set) in sets.enumerated() {
                if set.contains(key) {
                    row[i] = true
                }
            }
            record[key] = row
        }
        
        output(format: format)
    }
}

let program = Program()
program.main()
