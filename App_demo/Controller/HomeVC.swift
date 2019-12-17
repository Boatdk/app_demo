//
//  ViewController.swift
//  App_demo
//
//  Created by Supanut Laddayam on 11/12/2562 BE.
//  Copyright © 2562 Supanut Laddayam. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    //MARK: - status section Orange
    var stu_btn1 = true
    var stu_btn2 = false
    var stu_btn3 = false
    var stu_btn4 = false
    var stu_btn5 = false
    
    //MARK: - section Orange
    @IBOutlet weak var button1: CustomButton!
    @IBOutlet weak var button2: CustomButton!
    @IBOutlet weak var button3: CustomButton!
    @IBOutlet weak var button4: CustomButton!
    @IBOutlet weak var button5: CustomButton!
    
    //MARK: - section Blue
    @IBOutlet weak var button6: Custom_border_blue!
    @IBOutlet weak var button7: Custom_border_blue!
    @IBOutlet weak var button8: Custom_border_blue!
    @IBOutlet weak var button9: Custom_border_blue!
    
    //MARK: - section Green
    @IBOutlet weak var button10: Custom_border_green!
    @IBOutlet weak var button11: Custom_border_green!
    @IBOutlet weak var button12: Custom_border_green!
    @IBOutlet weak var button13: Custom_border_green!
    
    //MARK: - section Red
    @IBOutlet weak var button14: CustomButton!
    @IBOutlet weak var button15: CustomButton!
    @IBOutlet weak var button16: CustomButton!
    @IBOutlet weak var button17: CustomButton!
    
    //MARK: - section Yellow
    @IBOutlet weak var button18: CustomButton!
    @IBOutlet weak var button19: CustomButton!
    @IBOutlet weak var button20: CustomButton!
    @IBOutlet weak var button21: CustomButton!
    
    //MARK: - section Violet
    @IBOutlet weak var button22: CustomSmallButton!
    @IBOutlet weak var button23: CustomSmallButton!
    
    //MARK: - section Grey
    @IBOutlet weak var button24: CustomSmallButton!
    @IBOutlet weak var button25: CustomSmallButton!
    
    //MARK: - section Volume Contorl
    @IBOutlet weak var volumeContorl: UISlider!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            initalStatus()
        print("btn1:\(stu_btn1) btn2:\(stu_btn2)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    private func initalStatus() {
        button1.isEnabled = false
        stu_btn1 = true
        stu_btn2 = false
        stu_btn3 = false
        stu_btn4 = false
    }
        
        private func postMethod(endPoint: String,switchValue: String, pageValue: String, responseLabel: UILabel ) {
            let parameter = ["sswitch": switchValue, "page": pageValue]
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
                        let res = try JSONDecoder().decode(passingVariable.self, from: data)
                        print(res.page)
                        DispatchQueue.main.async {
                            responseLabel.text = res.page
                        }
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
        //"switchs": "1","page": "1"
        //"http://192.168.4.1/wifiinfo"
        
//        @IBAction func handleTapPost(_ sender: Any) {
//            postMethod(endPoint: "http://192.168.4.1/wifiinfo", switchValue: "1", pageValue: "123", responseLabel: responseLabel1)
//        }
//
//
//        @IBAction func handleTapPost2(_ sender: Any) {
//            postMethod(endPoint: "http://192.168.4.1/wifiinfo", switchValue: "1", pageValue: "2", responseLabel: responseLabel2)
//        }
    
    
    // MARK: - Handle DidTap section Orange
    //btn1
    @IBAction func button1_DidTap(_ sender: Any) {
        if stu_btn1 == false {
            stu_btn1 = true
            button1.isEnabled = true
        }
        
        if stu_btn1 == true {
            button1.isEnabled = false
            button2.isEnabled = true
            button3.isEnabled = true
            button4.isEnabled = true
            button5.isEnabled = true
            
            stu_btn2 = false
            stu_btn3 = false
            stu_btn4 = false
            stu_btn5 = false
        }

        print("btn 1 status : \(stu_btn1)")
        print("btn 2 status : \(stu_btn2)")
        print("btn 3 status : \(stu_btn3)")
        print("btn 4 status : \(stu_btn4)")
        print("btn 5 status : \(stu_btn5)")
        print("----------------------")
    }
    
    //btn2
    @IBAction func button2_DidTap(_ sender: Any) {
        if stu_btn2 == false {
            stu_btn2 = true
            button2.isEnabled = true
        }
    
        if stu_btn2 == true {
            button2.isEnabled = false
            button1.isEnabled = true
            button3.isEnabled = true
            button4.isEnabled = true
            button5.isEnabled = true
            
            stu_btn1 = false
            stu_btn3 = false
            stu_btn4 = false
            stu_btn5 = false
        }

        print("btn 1 status : \(stu_btn1)")
        print("btn 2 status : \(stu_btn2)")
        print("btn 3 status : \(stu_btn3)")
        print("btn 4 status : \(stu_btn4)")
        print("btn 5 status : \(stu_btn5)")
        print("----------------------")
    }
    
    //btn3
    @IBAction func button3_DidTap(_ sender: Any) {
        if stu_btn3 == false {
            stu_btn3 = true
            button3.isEnabled = true
        }
        
        if stu_btn3 == true {
            button3.isEnabled = false
            button1.isEnabled = true
            button2.isEnabled = true
            button4.isEnabled = true
            button5.isEnabled = true
            
            stu_btn1 = false
            stu_btn2 = false
            stu_btn4 = false
            stu_btn5 = false
        }

        print("btn 1 status : \(stu_btn1)")
        print("btn 2 status : \(stu_btn2)")
        print("btn 3 status : \(stu_btn3)")
        print("btn 4 status : \(stu_btn4)")
        print("btn 5 status : \(stu_btn5)")
        print("----------------------")
    }
    
    //btn4
    @IBAction func button4_DidTap(_ sender: Any) {
         if stu_btn4 == false {
            //toggle to opposite
            stu_btn4 = true
            button4.isEnabled = true
        }
               
        if stu_btn4 == true {
            //Set Don't toggle same button
            button4.isEnabled = false
            button1.isEnabled = true
            button2.isEnabled = true
            button3.isEnabled = true
            button5.isEnabled = true
            
            //Set Other button_status
            stu_btn1 = false
            stu_btn2 = false
            stu_btn3 = false
            stu_btn5 = false
        }

            print("btn 1 status : \(stu_btn1)")
            print("btn 2 status : \(stu_btn2)")
            print("btn 3 status : \(stu_btn3)")
            print("btn 4 status : \(stu_btn4)")
            print("btn 5 status : \(stu_btn5)")
            print("----------------------")
        }
    
}
