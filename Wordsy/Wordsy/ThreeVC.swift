//
//  ThreeVC.swift
//  Wordsy
//
//  Created by Arya Tschand on 10/18/19.
//  Copyright © 2019 PEC. All rights reserved.
//

import UIKit
import SwiftyJSON
import FirebaseDatabase
import ProgressHUD

class ThreeVC: UIViewController {

    var word = "testing"
    var definition = "Consume food"
    var wordArray: [[String]] = []
    var col1 = false
    var col2 = false
    var col3 = false
    var ref = DatabaseReference()
    var randomNumberIndex: Int = 0
    
    override func viewWillAppear(_ animated: Bool) {
        ref = Database.database().reference()
        reset()
    }
    
    /*
    func newWord(CompletionHandler: @escaping (Bool?, Error?) -> Void){
        do {
            let url = NSURL(string: "https://h2grow.herokuapp.com/api")!
            let request = NSMutableURLRequest(url: url as URL)
            request.httpMethod = "POST"
            
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.httpBody = try JSONSerialization.data(withJSONObject: [""], options: .prettyPrinted)
            let task = URLSession.shared.dataTask(with: request as URLRequest){ data, response, error in
                randomNumberIndex = Int.random(in: 1 ..< 4)
                ref.child("\(randomNumberIndex)").observeSingleEvent(of: .value, with: { (snapshot) in
                    
                    let value = snapshot.value as? NSDictionary
                    word = value!["Word"] as! String
                    definition = value!["Definition" ] as! String
                    CompletionHandler(true,nil)
                    
                })
                
            }
            task.resume()
        } catch {
            print(error)
        }
    } */
    
    func newWord() {
        var data = SavedData()
        randomNumberIndex = Int.random(in: 1 ..< data.ThreeWords.count)
        word = data.ThreeWords[randomNumberIndex]
        definition = data.ThreeDefinitionss[randomNumberIndex]
        
    }
    
    @IBOutlet weak var DefinitionLabel: UILabel!
    
    @IBOutlet weak var Button1: UIButton!
    @IBAction func Button1(_ sender: Any) {
        Button1.backgroundColor = UIColor.orange
        Button4.backgroundColor = UIColor.blue
        Button7.backgroundColor = UIColor.blue
        col1 = true
        checkCorrect(number: 1)
    }
    
    
    @IBOutlet weak var Button2: UIButton!
    @IBAction func Button2(_ sender: Any) {
        Button2.backgroundColor = UIColor.orange
        Button5.backgroundColor = UIColor.blue
        Button8.backgroundColor = UIColor.blue
        col2 = true
        checkCorrect(number: 2)
    }
    
    @IBOutlet weak var Button3: UIButton!
    @IBAction func Button3(_ sender: Any) {
        Button3.backgroundColor = UIColor.orange
        Button6.backgroundColor = UIColor.blue
        Button9.backgroundColor = UIColor.blue
        col3 = true
        checkCorrect(number: 3)
    }
    
    @IBOutlet weak var Button4: UIButton!
    @IBAction func Button4(_ sender: Any) {
        Button4.backgroundColor = UIColor.orange
        Button1.backgroundColor = UIColor.blue
        Button7.backgroundColor = UIColor.blue
        col1 = true
        checkCorrect(number: 4)
    }
    
    @IBOutlet weak var Button5: UIButton!
    @IBAction func Button5(_ sender: Any) {
        Button5.backgroundColor = UIColor.orange
        Button2.backgroundColor = UIColor.blue
        Button8.backgroundColor = UIColor.blue
        col2 = true
        checkCorrect(number: 5)
    }
    
    @IBOutlet weak var Button6: UIButton!
    @IBAction func Button6(_ sender: Any) {
        Button6.backgroundColor = UIColor.orange
        Button3.backgroundColor = UIColor.blue
        Button9.backgroundColor = UIColor.blue
        col3 = true
        checkCorrect(number: 6)
    }
    
    @IBOutlet weak var Button7: UIButton!
    @IBAction func Button7(_ sender: Any) {
        Button7.backgroundColor = UIColor.orange
        Button1.backgroundColor = UIColor.blue
        Button4.backgroundColor = UIColor.blue
        col1 = true
        checkCorrect(number: 7)
    }
    
    @IBOutlet weak var Button8: UIButton!
    @IBAction func Button8(_ sender: Any) {
        Button8.backgroundColor = UIColor.orange
        Button5.backgroundColor = UIColor.blue
        Button2.backgroundColor = UIColor.blue
        col2 = true
        checkCorrect(number: 8)
    }
    
    @IBOutlet weak var Button9: UIButton!
    @IBAction func Button9(_ sender: Any) {
        Button9.backgroundColor = UIColor.orange
        Button3.backgroundColor = UIColor.blue
        Button6.backgroundColor = UIColor.blue
        col3 = true
        checkCorrect(number: 9)
    }
    
    func getWord() -> String {
        var toreturn: String = ""
        if Button1.backgroundColor == UIColor.orange {
            toreturn = toreturn + wordArray[0][0]
        } else if Button4.backgroundColor == UIColor.orange {
            toreturn = toreturn + wordArray[0][1]
        } else if Button7.backgroundColor == UIColor.orange {
            toreturn = toreturn + wordArray[0][2]
        }
        if Button2.backgroundColor == UIColor.orange {
            toreturn = toreturn + wordArray[1][0]
        } else if Button5.backgroundColor == UIColor.orange {
            toreturn = toreturn + wordArray[1][1]
        } else if Button8.backgroundColor == UIColor.orange {
            toreturn = toreturn + wordArray[1][2]
        }
        if Button3.backgroundColor == UIColor.orange {
            toreturn = toreturn + wordArray[2][0]
        } else if Button6.backgroundColor == UIColor.orange {
            toreturn = toreturn + wordArray[2][1]
        } else if Button9.backgroundColor == UIColor.orange {
            toreturn = toreturn + wordArray[2][2]
        }
        return toreturn
    }
    
    func checkCorrect(number: Int) {
        if col1 == true && col2 == true && col3 == true {
            col1 = false
            col2 = false
            col3 = false
            let selectedWord = getWord()
            if selectedWord == word {
                ProgressHUD.showSuccess()
                if Button1.backgroundColor == UIColor.orange {
                    Button1.backgroundColor = UIColor.green
                }
                if Button2.backgroundColor == UIColor.orange {
                    Button2.backgroundColor = UIColor.green
                }
                if Button3.backgroundColor == UIColor.orange {
                    Button3.backgroundColor = UIColor.green
                }
                if Button4.backgroundColor == UIColor.orange {
                    Button4.backgroundColor = UIColor.green
                }
                if Button5.backgroundColor == UIColor.orange {
                    Button5.backgroundColor = UIColor.green
                }
                if Button6.backgroundColor == UIColor.orange {
                    Button6.backgroundColor = UIColor.green
                }
                if Button7.backgroundColor == UIColor.orange {
                    Button7.backgroundColor = UIColor.green
                }
                if Button8.backgroundColor == UIColor.orange {
                    Button8.backgroundColor = UIColor.green
                }
                if Button9.backgroundColor == UIColor.orange {
                    Button9.backgroundColor = UIColor.green
                }
                reset()
            } else  {
                ProgressHUD.showError()
                if Button1.backgroundColor == UIColor.orange {
                    Button1.backgroundColor = UIColor.red
                }
                if Button2.backgroundColor == UIColor.orange {
                    Button2.backgroundColor = UIColor.red
                }
                if Button3.backgroundColor == UIColor.orange {
                    Button3.backgroundColor = UIColor.red
                }
                if Button4.backgroundColor == UIColor.orange {
                    Button4.backgroundColor = UIColor.red
                }
                if Button5.backgroundColor == UIColor.orange {
                    Button5.backgroundColor = UIColor.red
                }
                if Button6.backgroundColor == UIColor.orange {
                    Button6.backgroundColor = UIColor.red
                }
                if Button7.backgroundColor == UIColor.orange {
                    Button7.backgroundColor = UIColor.red
                }
                if Button8.backgroundColor == UIColor.orange {
                    Button8.backgroundColor = UIColor.red
                }
                if Button9.backgroundColor == UIColor.orange {
                    Button9.backgroundColor = UIColor.red
                }
                reset()
            }
        }
    }
    
    func reset() {
        /*
        newWord() {
            (returnval, error) in
            if (returnval)!
            {
                DispatchQueue.main.async {
                    DefinitionLabel.text = definition
                    let index1 = Int.random(in: 0 ..< 3)
                    let index2 = Int.random(in: 0 ..< 3)
                    let index3 = Int.random(in: 0 ..< 3)
                    var characterArray: [String] = []
                    let letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", ]
                    let emptyArray = ["", "", ""]
                    wordArray = []
                    wordArray.append(emptyArray)
                    wordArray.append(emptyArray)
                    wordArray.append(emptyArray)
                    wordArray[0][index1] = String(word[0])
                    wordArray[1][index2] = String(word[1])
                    wordArray[2][index3] = String(word[2])
                    for x in 0...5 {
                        var finished = false
                        while finished == false {
                            let random = Int.random(in: 0 ..< 26)
                            if letters[random] != String(word[x/2]) {
                                characterArray.append(letters[random])
                                finished = true
                            }
                        }
                    }
                    var counter = 0
                    for x in 0...8 {
                        if wordArray[x/3][x%3] == "" {
                            wordArray[x/3][x%3] = characterArray[counter]
                            counter += 1
                        }
                    }
                    Button1.setTitle(wordArray[0][0], for: .normal)
                    Button2.setTitle(wordArray[1][0], for: .normal)
                    Button3.setTitle(wordArray[2][0], for: .normal)
                    Button4.setTitle(wordArray[0][1], for: .normal)
                    Button5.setTitle(wordArray[1][1], for: .normal)
                    Button6.setTitle(wordArray[2][1], for: .normal)
                    Button7.setTitle(wordArray[0][2], for: .normal)
                    Button8.setTitle(wordArray[1][2], for: .normal)
                    Button9.setTitle(wordArray[2][2], for: .normal)
                    Button1.backgroundColor = UIColor.blue
                    Button2.backgroundColor = UIColor.blue
                    Button3.backgroundColor = UIColor.blue
                    Button4.backgroundColor = UIColor.blue
                    Button5.backgroundColor = UIColor.blue
                    Button6.backgroundColor = UIColor.blue
                    Button7.backgroundColor = UIColor.blue
                    Button8.backgroundColor = UIColor.blue
                    Button9.backgroundColor = UIColor.blue
                }
            } else {
                print(error)
            }
        }
        DispatchQueue.main.async { // Correct
        }
        
    }
 */
    newWord()
        DefinitionLabel.text = definition
        let index1 = Int.random(in: 0 ..< 3)
        let index2 = Int.random(in: 0 ..< 3)
        let index3 = Int.random(in: 0 ..< 3)
        var characterArray: [String] = []
        let letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", ]
        let emptyArray = ["", "", ""]
        wordArray = []
        wordArray.append(emptyArray)
        wordArray.append(emptyArray)
        wordArray.append(emptyArray)
        wordArray[0][index1] = String(word[0])
        wordArray[1][index2] = String(word[1])
        wordArray[2][index3] = String(word[2])
        for x in 0...5 {
            var finished = false
            while finished == false {
                let random = Int.random(in: 0 ..< 26)
                if letters[random] != String(word[x/2]) {
                    characterArray.append(letters[random])
                    finished = true
                }
            }
        }
        var counter = 0
        for x in 0...8 {
            if wordArray[x/3][x%3] == "" {
                wordArray[x/3][x%3] = characterArray[counter]
                counter += 1
            }
        }
        Button1.setTitle(wordArray[0][0], for: .normal)
        Button2.setTitle(wordArray[1][0], for: .normal)
        Button3.setTitle(wordArray[2][0], for: .normal)
        Button4.setTitle(wordArray[0][1], for: .normal)
        Button5.setTitle(wordArray[1][1], for: .normal)
        Button6.setTitle(wordArray[2][1], for: .normal)
        Button7.setTitle(wordArray[0][2], for: .normal)
        Button8.setTitle(wordArray[1][2], for: .normal)
        Button9.setTitle(wordArray[2][2], for: .normal)
        Button1.backgroundColor = UIColor.blue
        Button2.backgroundColor = UIColor.blue
        Button3.backgroundColor = UIColor.blue
        Button4.backgroundColor = UIColor.blue
        Button5.backgroundColor = UIColor.blue
        Button6.backgroundColor = UIColor.blue
        Button7.backgroundColor = UIColor.blue
        Button8.backgroundColor = UIColor.blue
        Button9.backgroundColor = UIColor.blue
    }
}

extension String {
  subscript (i: Int) -> Character {
    return self[index(startIndex, offsetBy: i)]
  }
  subscript (bounds: CountableRange<Int>) -> Substring {
    let start = index(startIndex, offsetBy: bounds.lowerBound)
    let end = index(startIndex, offsetBy: bounds.upperBound)
    return self[start ..< end]
  }
  subscript (bounds: CountableClosedRange<Int>) -> Substring {
    let start = index(startIndex, offsetBy: bounds.lowerBound)
    let end = index(startIndex, offsetBy: bounds.upperBound)
    return self[start ... end]
  }
  subscript (bounds: CountablePartialRangeFrom<Int>) -> Substring {
    let start = index(startIndex, offsetBy: bounds.lowerBound)
    let end = index(endIndex, offsetBy: -1)
    return self[start ... end]
  }
  subscript (bounds: PartialRangeThrough<Int>) -> Substring {
    let end = index(startIndex, offsetBy: bounds.upperBound)
    return self[startIndex ... end]
  }
  subscript (bounds: PartialRangeUpTo<Int>) -> Substring {
    let end = index(startIndex, offsetBy: bounds.upperBound)
    return self[startIndex ..< end]
  }
}
extension Substring {
  subscript (i: Int) -> Character {
    return self[index(startIndex, offsetBy: i)]
  }
  subscript (bounds: CountableRange<Int>) -> Substring {
    let start = index(startIndex, offsetBy: bounds.lowerBound)
    let end = index(startIndex, offsetBy: bounds.upperBound)
    return self[start ..< end]
  }
  subscript (bounds: CountableClosedRange<Int>) -> Substring {
    let start = index(startIndex, offsetBy: bounds.lowerBound)
    let end = index(startIndex, offsetBy: bounds.upperBound)
    return self[start ... end]
  }
  subscript (bounds: CountablePartialRangeFrom<Int>) -> Substring {
    let start = index(startIndex, offsetBy: bounds.lowerBound)
    let end = index(endIndex, offsetBy: -1)
    return self[start ... end]
  }
  subscript (bounds: PartialRangeThrough<Int>) -> Substring {
    let end = index(startIndex, offsetBy: bounds.upperBound)
    return self[startIndex ... end]
  }
  subscript (bounds: PartialRangeUpTo<Int>) -> Substring {
    let end = index(startIndex, offsetBy: bounds.upperBound)
    return self[startIndex ..< end]
  }
}
