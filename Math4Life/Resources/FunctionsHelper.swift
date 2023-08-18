//
//  FunctionsHelper.swift
//  Math4Life
//
//  Created by PGK Shiva Kumar on 14/12/22.
//

import Foundation

class FunctionsHelper {
    
    private init() { }
    static var sharedInstance = FunctionsHelper()
    
    func getRandomNumber(incomingInt : Int) -> Int{
        var returnInt: Int?
        returnInt = Int.random(in: 0...incomingInt)
        return returnInt ?? 0
    }
}
