//
//  EscapedCharacterSearch.swift
//  TurkisCharSearch
//
//  Created by Salih GUC on 27/02/16.
//  Copyright © 2016 Salih GUC. All rights reserved.
//

import Foundation


class EscapedCharacterSearch: NSObject {
    
    
    static let sharedInstance = EscapedCharacterSearch()
    
    let turkishCharSet = ["i":"ı", "I":"İ", "o":"ö", "O":"Ö", "s":"ş", "S":"Ş", "u":"ü", "U":"Ü", "c":"ç", "C":"Ç", "g":"ğ", "G":"Ğ"]
    
    private func getPatterForTurkishCharacters(text: String) -> String {
        var pattern = ""
        for (var i = 0; i < text.characters.count; i++) {
            var isInSet = false
            let char = String(text[text.startIndex.advancedBy(i)])
            for set in turkishCharSet {
                if (set.0 == char || set.1 == char) {
                    pattern = pattern + "[" + set.0 + set.1 + "]"
                    isInSet = true
                }
            }
            
            if (!isInSet) {
                pattern = pattern + char
            }
        }
        return pattern
    }
    
    func searchWithTurkishChars(keyword: String, searchIn text: String) -> Bool {
        let pattern = getPatterForTurkishCharacters(keyword)
        
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: [.CaseInsensitive])
            if let _ = regex.firstMatchInString(text, options: [], range:  NSMakeRange(0, text.characters.count)) {
                return true
            }
        }catch let error as NSError {
            print(error)
        }
        
        return false
    }
}
