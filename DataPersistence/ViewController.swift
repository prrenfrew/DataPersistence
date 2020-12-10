//
//  ViewController.swift
//  DataPersistence
//
//  Created by MAC on 12/10/20.
//

import UIKit

/*
 Data Persistence - data that is saved between launches
 
 1. User Defaults - The data is saved basically in plaintext, so good for simple data that is not user sensitive
 2. KeyChain - The data is saved encrypted. Perfect for user-sensitive pieces of information, such as passwords
 3. CoreData - object relational mapping(ORM) framework. By default, it uses SQLite for its storage
 
 
 Other ways to do data persistence:
 FileManager
 NSKeyedArchiver
 SQLite
 */

class ViewController: UIViewController {
  @IBOutlet weak var darkModelLabel: UILabel!
  @IBOutlet weak var darkModeSwitch: UISwitch!
  
  var isDarkModeOn: Bool {
    get {
      return UserDefaults.standard.bool(forKey: "IsDarkModeOn")
    }
    set {
      UserDefaults.standard.set(newValue, forKey: "IsDarkModeOn")
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.updateUI()
  }


  @IBAction func darkModeSwitch(_ sender: UISwitch) {
    self.isDarkModeOn = sender.isOn
    self.updateUI()
  }
  
  private func updateUI() {
    self.darkModelLabel.text = self.isDarkModeOn ? "Dark Mode": "Bright Mode"
    self.darkModelLabel.textColor = self.isDarkModeOn ? .white : .black
    self.view.backgroundColor = self.isDarkModeOn ? .black : .white
    self.darkModeSwitch.isOn = self.isDarkModeOn
  }
}

