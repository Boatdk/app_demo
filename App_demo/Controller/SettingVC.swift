//
//  SettingVC.swift
//  App_demo
//
//  Created by Supanut Laddayam on 21/12/2562 BE.
//  Copyright © 2562 Supanut Laddayam. All rights reserved.
//

import UIKit

class SettingVC: UIViewController {

    var endPoint = "http://192.168.4.1/wifiinfo"
    var pageValue = 1
    
    @IBOutlet weak var ssidTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func postMethod(endPoint: String) {
        guard let ssid = self.ssidTextField.text else { return }
        guard let password = self.passwordTextField.text else { return }
        
        let parameter = ["sws": "1",
                         "page": "wifixx",
                         "ssid": ssid,
                         "password": password]
        
        guard let url = URL(string: endPoint) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameter, options: []) else {return}
        request.httpBody = httpBody
        
        let session =  URLSession.shared
        session.dataTask(with: request) { (data, response, error) in

            if let data = data {
                do {
                    print(data)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    @IBAction func dismissTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func confirmTap(_ sender: Any) {
        postMethod(endPoint: endPoint)
        dismiss(animated: true, completion: nil)
    }
    

}
