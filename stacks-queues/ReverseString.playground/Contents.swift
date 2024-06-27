import UIKit

// https://www.fullstack.cafe/interview-questions/stacks

/*
 Giving a String, write a function that reverses the String
 using a stack.
 */

func solution(_ text: String) -> String {
    var chars = Array(text)
    
    // create a Stack
    var result = [String]()
    
    for c in chars {
        result.append(String(c))
    }
    
    // pop Chars
    for i in 0..<result.count {
        chars[i] = Character(result.popLast()!)
    }
    
    return String(chars)
}

solution("abc") // cba
solution("Would you like to play a game?")
