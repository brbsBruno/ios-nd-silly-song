//
//  ViewController.swift
//  Silly Song
//
//  Created by Bruno Barbosa on 16/12/16.
//  Copyright © 2016 Bruno Barbosa. All rights reserved.
//

import UIKit

class SillySongViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!

    @IBAction func reset(_ sender: Any) {
        
        nameField.text = nil
        lyricsView.text = nil
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        
        if let nameFieldText = self.nameField.text {
            
            if nameFieldText.characters.count > 0 {
                lyricsView.text = lyricsForName(lyricsTemplate:bananaFanaTemplate, fullName: nameFieldText)
            }
        }
    }
}

// MARK: - UITextFieldDelegate

extension SillySongViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func shortNameFromName(name :String) -> String {
    
    var shortName = name.lowercased()
    
    let vowels = CharacterSet.init(charactersIn: "aeiou")
    
    if let range = shortName.rangeOfCharacter(from: vowels) {
        
        shortName = shortName.substring(from: range.lowerBound)
    }
    
    return shortName
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    
    let shortName = shortNameFromName(name: fullName)
    
    let lyrics = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    return lyrics
}

