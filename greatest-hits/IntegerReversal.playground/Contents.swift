import Foundation

/*
 ___     _                      ___                          _
|_ _|_ _| |_ ___ __ _ ___ _ _  | _ \_____ _____ _ _ ___ __ _| |
 | || ' \  _/ -_) _` / -_) '_| |   / -_) V / -_) '_(_-</ _` | |
|___|_||_\__\___\__, \___|_|   |_|_\___|\_/\___|_| /__/\__,_|_|
                |___/
 
 // Challenge: Given an int, reverse its digits.
 // x = 123, return 321
 // x= -123, return -321

 */

func reverse(_ x: Int) -> Int {
    var digits: [Int] = []
    var num = 0
    var strReversedNumbers = ""
    
    if x < 0 {
        num = x * -1
        strReversedNumbers = "-"
    } else {
        num = x
    }
    
    digits.append(num % 10)
    
    while num >= 10 {
        num = num / 10
        digits.append(num % 10)
    }
    
    for digit in digits {
        strReversedNumbers.append(String(digit))
    }
    
    return Int(strReversedNumbers)!
}

func reverseAdvanced(_ x: Int) -> Int {
    var x = x
    let isNegative = x < 0
    
    if isNegative {
        x = abs(x)
    }
    
    var reverse = 0
    var lastDigit = 0
    
    while x >= 1 {
        lastDigit = x % 10 // get the last digit
        reverse = reverse * 10 + lastDigit // shift by order of magnitude each time
        print("x: \(x) lastDigit: \(lastDigit) reverse: \(reverse)")
        x = x / 10
    }
    
    return isNegative ? reverse * -1 : reverse
}

reverse(123)    // 321
reverse(-123)   // -321
reverseAdvanced(123) // 321
reverseAdvanced(-235267) // -762532
