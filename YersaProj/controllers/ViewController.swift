//
//  ViewController.swift
//  lecture3DemoSimpleApp
//
//  Created by admin on 06.01.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotification(_:)), name: Notification.Name("text"), object: nil)
    }
    
    @objc func didGetNotification(_ notification: Notification){
        let text = notification.object as! String?
        label.text = text
    }
    

    @IBAction func signIn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "SecondViewController") as! SecondViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBOutlet weak var label: UILabel!
    @IBAction func tapButton() {
    let vc = storyboard?.instantiateViewController(identifier: "OtherViewController") as!
        OtherViewController
        vc.modalPresentationStyle = .fullScreen
        vc.completionHandler = {text in
            self.label.text = text
        }
        
        present(vc, animated: true)
    }
    

}

