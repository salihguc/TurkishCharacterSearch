//
//  ViewController.swift
//  TurkisCharSearch
//
//  Created by Salih GUC on 27/02/16.
//  Copyright © 2016 Salih GUC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var textField: UITextField!
    

    private func searchText(text: String) {
        print(text)
        let pttrn = EscapedCharacterSearch.sharedInstance.searchWithTurkishChars(text, searchIn: "IstanbUl")
        print(pttrn)
    }
    
    @IBAction func textDidChange(sender: UITextField) {
        searchText(sender.text!)
    }
    
    

}

