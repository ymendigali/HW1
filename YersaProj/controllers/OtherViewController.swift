//
//  OtherViewController.swift
//  lecture3DemoSimpleApp
//
//  Created by Yersultan Mendigali on 22.01.2021.
//

import UIKit

class OtherViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    
    public var completionHandler:((String?) -> Void)?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func tapSaveButton(_ sender: UIButton) {
        
        NotificationCenter.default.post(name: Notification.Name("text"), object: textField)
        
        completionHandler?(textField.text)
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
}

