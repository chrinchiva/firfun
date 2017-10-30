//
//  ViewController.swift
//  firefun
//
//  Created by petersoeun on 10/26/17.
//  Copyright © 2017 RoboCam. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myListView: UITableView!
    var usernameList:[String]=[]
    var passwordList:[String]=[]
    var ref : DatabaseReference!
    var handleUsername: DatabaseHandle?
    var handlePassword: DatabaseHandle?
    
    @IBAction func onClickButtonSaveUsername(_ sender: Any) {
        if myTextField.text != ""{
            self.ref?.child("username").childByAutoId().setValue(myTextField.text)
            myTextField.text = ""
        }
        
    }
    @IBAction func onClickSavePassword(_ sender: Any) {
        if (myTextField.text != "" ){
            self.ref.child("password").childByAutoId().setValue(myTextField.text)
            myTextField.text = ""
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usernameList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.UsernameLabelView.text = usernameList[indexPath.row]
        //cell.PasswordLabelView.text = passwordList[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
// handling username data
        handleUsername = ref?.child("username").observe(.childAdded, with: { (snapshot) in
            if let item = snapshot.value as? String
            {
                self.usernameList.append(item)
                self.myListView.reloadData()
            }
        })
// handling passwor data
        handlePassword = ref.child("password").observe(.childAdded, with: { (snapshot) in
            if let item = snapshot.value as? String
            {
                self.passwordList.append(item)
                self.myListView.reloadData()
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

