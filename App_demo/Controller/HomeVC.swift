//
//  ViewController.swift
//  App_demo
//
//  Created by Supanut Laddayam on 11/12/2562 BE.
//  Copyright © 2562 Supanut Laddayam. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    var endPoint = "http://192.168.4.1/wifiinfo"

    //MARK: - status section Orange
    var stu_btn1 = true
    var stu_btn2 = false
    var stu_btn3 = false
    var stu_btn4 = false
    var stu_btn5 = false

    var stu_btn6 = true
    var stu_btn7 = false
    var stu_btn8 = false
    var stu_btn9 = false
    
    var stu_btn10 = true
    var stu_btn11 = false
    var stu_btn12 = false
    var stu_btn13 = false
    
    var stu_btn14 = true
    var stu_btn15 = false
    var stu_btn16 = false
    var stu_btn17 = false
    
    var stu_btn18 = true
    var stu_btn19 = false
    var stu_btn20 = false
    var stu_btn21 = false
    
    var stu_btn22 = true
    var stu_btn23 = false
    
    var stu_btn24 = false
    var stu_btn25 = false
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    private func initalStatus() {
        stu_btn1 = true
        
        stu_btn6 = true
        
        stu_btn10 = true
        
        stu_btn14 = true
        
        stu_btn18 = true
        
        
        //section ORANGE
        postMethod(endPoint: endPoint, switchValue: "1", pageValue: "1", stuValue: "1")
        
        //section BLUE
        postMethod(endPoint: endPoint, switchValue: "6", pageValue: "1", stuValue: "1")
        
        //section GREEN
        postMethod(endPoint: endPoint, switchValue: "10", pageValue: "1", stuValue: "1")
        
        //section RED
        postMethod(endPoint: endPoint, switchValue: "14", pageValue: "1", stuValue: "1")
        
        //section YELLOW
        postMethod(endPoint: endPoint, switchValue: "18", pageValue: "1", stuValue: "1")
    }
        
    private func postMethod(endPoint: String,switchValue: String, pageValue: String, stuValue: String ) {
            let parameter = ["sws": switchValue, "page": pageValue, "stu": stuValue]
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
//                        let res = try JSONDecoder().decode(passingVariable.self, from: data)
//                        print(res.page)
//                        DispatchQueue.main.async {
//                        }
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }

    
    // MARK: - Handle DidTap section ORANGE
    //btn1
    @IBAction func button1_DidTap(_ sender: Any) {
        if stu_btn1 == false {
            postMethod(endPoint: endPoint, switchValue: "1", pageValue: "1", stuValue: "1")
            stu_btn1 = true
            stu_btn2 = false
            stu_btn3 = false
            stu_btn4 = false
            stu_btn5 = false
        }
        
        else if stu_btn1 == true {
            postMethod(endPoint: endPoint, switchValue: "1", pageValue: "1", stuValue: "0")
            stu_btn1 = false
            stu_btn2 = false
            stu_btn3 = false
            stu_btn4 = false
            stu_btn5 = false
        }
    }
    
    //btn2
    @IBAction func button2_DidTap(_ sender: Any) {
        if stu_btn2 == false {
            stu_btn2 = true
            postMethod(endPoint: endPoint, switchValue: "2", pageValue: "1", stuValue: "1")
            
            stu_btn1 = false
            stu_btn3 = false
            stu_btn4 = false
            stu_btn5 = false
        }
    
        else if stu_btn2 == true {
            postMethod(endPoint: endPoint, switchValue: "2", pageValue: "1", stuValue: "0")
            stu_btn1 = false
            stu_btn2 = false
            stu_btn3 = false
            stu_btn4 = false
            stu_btn5 = false
        }
    }
    
    //btn3
    @IBAction func button3_DidTap(_ sender: Any) {
        if stu_btn3 == false {
            stu_btn3 = true
             postMethod(endPoint: endPoint, switchValue: "3", pageValue: "1", stuValue: "1")
            stu_btn1 = false
            stu_btn2 = false
            stu_btn4 = false
            stu_btn5 = false
        }
        
        else if stu_btn3 == true {
             postMethod(endPoint: endPoint, switchValue: "3", pageValue: "1", stuValue: "0")
            stu_btn1 = false
            stu_btn2 = false
            stu_btn3 = false
            stu_btn4 = false
            stu_btn5 = false
        }
    }
    
    //btn4
    @IBAction func button4_DidTap(_ sender: Any) {
         if stu_btn4 == false {
            stu_btn4 = true
             postMethod(endPoint: endPoint, switchValue: "4", pageValue: "1", stuValue: "1")
            stu_btn1 = false
            stu_btn2 = false
            stu_btn3 = false
            stu_btn5 = false
        }
               
        else if stu_btn4 == true {
            //Set Other button_status
             postMethod(endPoint: endPoint, switchValue: "4", pageValue: "1", stuValue: "0")
            stu_btn1 = false
            stu_btn2 = false
            stu_btn3 = false
            stu_btn4 = false
            stu_btn5 = false
        }
    }
    
    //btn5
    @IBAction func button5_DidTap(_ sender: Any) {
        if stu_btn5 == false {
                stu_btn5 = true
                 postMethod(endPoint: endPoint, switchValue: "5", pageValue: "1", stuValue: "1")
                stu_btn1 = false
                stu_btn2 = false
                stu_btn3 = false
                stu_btn4 = false
            }
        
            else if stu_btn5 == true {
             postMethod(endPoint: endPoint, switchValue: "5", pageValue: "1", stuValue: "0")
                stu_btn1 = false
                stu_btn2 = false
                stu_btn3 = false
                stu_btn4 = false
                stu_btn5 = false
            }
        }
    
    // MARK: - Handle DidTap section BLUE
    //btn6
    @IBAction func button6_DidTap(_ sender: Any) {
        if stu_btn6 == false {
            stu_btn6 = true
            postMethod(endPoint: endPoint, switchValue: "6", pageValue: "1", stuValue: "1")
        }
               
        else if stu_btn6 == true {
            postMethod(endPoint: endPoint, switchValue: "6", pageValue: "1", stuValue: "0")
            stu_btn6 = false
        }
    }
    
    //btn7
    @IBAction func button7_DidTap(_ sender: Any) {
        if stu_btn7 == false {
            stu_btn7 = true
            postMethod(endPoint: endPoint, switchValue: "7", pageValue: "1", stuValue: "1")
        }
                      
        else if stu_btn7 == true {
            postMethod(endPoint: endPoint, switchValue: "7", pageValue: "1", stuValue: "0")
            stu_btn7 = false
        }
    }
    
    //btn8
    @IBAction func button8_DidTap(_ sender: Any) {
        if stu_btn8 == false {
            stu_btn8 = true
            postMethod(endPoint: endPoint, switchValue: "8", pageValue: "1", stuValue: "1")
        }
                      
        else if stu_btn8 == true {
            postMethod(endPoint: endPoint, switchValue: "8", pageValue: "1", stuValue: "0")
            stu_btn8 = false
        }
    }
    
    //btn9
    @IBAction func button9_DidTap(_ sender: Any) {
        if stu_btn9 == false {
            stu_btn9 = true
            postMethod(endPoint: endPoint, switchValue: "9", pageValue: "1", stuValue: "1")
        }
                      
        else if stu_btn9 == true {
            postMethod(endPoint: endPoint, switchValue: "9", pageValue: "1", stuValue: "0")
            stu_btn9 = false
        }
    }
    
    //MARK: - Handle DidTap section GREEN
    //btn10
    @IBAction func button10_DidTap(_ sender: Any) {
        if stu_btn10 == false {
            stu_btn10 = true
            postMethod(endPoint: endPoint, switchValue: "10", pageValue: "1", stuValue: "1")
        }
                      
        else if stu_btn10 == true {
            postMethod(endPoint: endPoint, switchValue:"10", pageValue: "1", stuValue: "0")
            stu_btn10 = false
        }
    }
    
    //btn11
    @IBAction func button11_DidTap(_ sender: Any) {
        if stu_btn11 == false {
            stu_btn11 = true
            postMethod(endPoint: endPoint, switchValue: "11", pageValue: "1", stuValue: "1")
        }
                      
        else if stu_btn11 == true {
            postMethod(endPoint: endPoint, switchValue:"11", pageValue: "1", stuValue: "0")
            stu_btn11 = false
        }
    }
    
    //btn12
    @IBAction func button12_DidTap(_ sender: Any) {
        if stu_btn12 == false {
            stu_btn12 = true
            postMethod(endPoint: endPoint, switchValue: "12", pageValue: "1", stuValue: "1")
        }
                      
        else if stu_btn12 == true {
            postMethod(endPoint: endPoint, switchValue:"12", pageValue: "1", stuValue: "0")
            stu_btn12 = false
        }
    }
    
    //btn13
    @IBAction func button13_DidTap(_ sender: Any) {
        if stu_btn13 == false {
            stu_btn13 = true
            postMethod(endPoint: endPoint, switchValue: "13", pageValue: "1", stuValue: "1")
        }
                      
        else if stu_btn13 == true {
            postMethod(endPoint: endPoint, switchValue:"13", pageValue: "1", stuValue: "0")
            stu_btn13 = false
        }
    }
    
    //MARK: - Handel DidTap section RED
    //btn14
    @IBAction func button14_DidTap(_ sender: Any) {
        if stu_btn14 == false {
            stu_btn14 = true
            postMethod(endPoint: endPoint, switchValue: "14", pageValue: "1", stuValue: "1")
        }
                      
        else if stu_btn14 == true {
            postMethod(endPoint: endPoint, switchValue:"14", pageValue: "1", stuValue: "0")
            stu_btn14 = false
        }
    }
    
    //btn15
    @IBAction func button15_DidTap(_ sender: Any) {
        if stu_btn15 == false {
            stu_btn15 = true
            postMethod(endPoint: endPoint, switchValue: "15", pageValue: "1", stuValue: "1")
        }
                      
        else if stu_btn15 == true {
            postMethod(endPoint: endPoint, switchValue:"15", pageValue: "1", stuValue: "0")
            stu_btn15 = false
        }
    }
    
    //btn16
    @IBAction func button16_DidTap(_ sender: Any) {
        if stu_btn16 == false {
            stu_btn16 = true
            postMethod(endPoint: endPoint, switchValue: "16", pageValue: "1", stuValue: "1")
        }
                      
        else if stu_btn16 == true {
            postMethod(endPoint: endPoint, switchValue:"16", pageValue: "1", stuValue: "0")
            stu_btn16 = false
        }
    }
    
    //btn17
    @IBAction func button17_DidTap(_ sender: Any) {
        if stu_btn17 == false {
            stu_btn17 = true
            postMethod(endPoint: endPoint, switchValue: "17", pageValue: "1", stuValue: "1")
        }
                      
        else if stu_btn17 == true {
            postMethod(endPoint: endPoint, switchValue:"17", pageValue: "1", stuValue: "0")
            stu_btn17 = false
        }
    }
    
    //Handle DidTap section YELLOW
    //btn18
    @IBAction func button18_DidTap(_ sender: Any) {
        if stu_btn18 == false {
            postMethod(endPoint: endPoint, switchValue: "18", pageValue: "1", stuValue: "1")
            stu_btn18 = true
            
            stu_btn19 = false
            stu_btn20 = false
            stu_btn21 = false
        }
        
        else if stu_btn18 == true {
            postMethod(endPoint: endPoint, switchValue: "18", pageValue: "1", stuValue: "0")
            stu_btn18 = false
            stu_btn19 = false
            stu_btn20 = false
            stu_btn21 = false
        }
    }
    
    //btn19
    @IBAction func button19_DidTap(_ sender: Any) {
        if stu_btn19 == false {
            postMethod(endPoint: endPoint, switchValue: "19", pageValue: "1", stuValue: "1")
            stu_btn19 = true
            
            stu_btn18 = false
            stu_btn20 = false
            stu_btn21 = false
        }
        
        else if stu_btn19 == true {
            postMethod(endPoint: endPoint, switchValue: "19", pageValue: "1", stuValue: "0")
            stu_btn18 = false
            stu_btn19 = false
            stu_btn20 = false
            stu_btn21 = false
  
        }
    }
    
    //btn20
    @IBAction func button20_DidTap(_ sender: Any) {
        if stu_btn20 == false {
           postMethod(endPoint: endPoint, switchValue: "20", pageValue: "1", stuValue: "1")
           stu_btn20 = true
                
           stu_btn18 = false
           stu_btn19 = false
           stu_btn21 = false
        }
              
        else if stu_btn20 == true {
            postMethod(endPoint: endPoint, switchValue: "20", pageValue: "1", stuValue: "0")
            stu_btn18 = false
            stu_btn19 = false
            stu_btn20 = false
            stu_btn21 = false
        
        }
    }
    
    //btn21
    @IBAction func button21_DidTap(_ sender: Any) {
        if stu_btn21 == false {
           postMethod(endPoint: endPoint, switchValue: "21", pageValue: "1", stuValue: "1")
           stu_btn21 = true
                  
           stu_btn18 = false
           stu_btn19 = false
           stu_btn20 = false
        }
              
        else if stu_btn21 == true {
            postMethod(endPoint: endPoint, switchValue: "21", pageValue: "1", stuValue: "0")
            stu_btn18 = false
            stu_btn19 = false
            stu_btn20 = false
            stu_btn21 = false
        
        }
    }
    
    //MARK: - Handle DidTap section VIOLET
    //btn22
    @IBAction func button22_DidTap(_ sender: Any) {
        if stu_btn22 == false {
            postMethod(endPoint: endPoint, switchValue: "22", pageValue: "1", stuValue: "0")
            stu_btn22 = true
            stu_btn23 = false
        }
        
        else if stu_btn22 == true {
            postMethod(endPoint: endPoint, switchValue: "22", pageValue: "1", stuValue: "1")
            stu_btn22 = false
            stu_btn23 = false
        }
    }
    
    //btn23
    @IBAction func button23_DidTAp(_ sender: Any) {
        if stu_btn23 == false {
            postMethod(endPoint: endPoint, switchValue: "23", pageValue: "1", stuValue: "1")
            stu_btn22 = false
            stu_btn23 = true
        }
        
        else if stu_btn23 == true {
            postMethod(endPoint: endPoint, switchValue: "23", pageValue: "2", stuValue: "2")
            stu_btn22 = false
            stu_btn23 = false
        }
    }
    
    
    //MARK: - Handle DidTap section GREY
    //btn24
    @IBAction func button24_DidTap(_ sender: Any) {
        if stu_btn24 == false {
            postMethod(endPoint: endPoint, switchValue: "24", pageValue: "1", stuValue: "1")
            stu_btn24 = true
            stu_btn25 = false
        }
        
        else if stu_btn24 == true {
            postMethod(endPoint: endPoint, switchValue: "24", pageValue: "1", stuValue: "0")
            stu_btn24 = false
            stu_btn25 = false
        }
    }
    
    //btn25
    @IBAction func button25_DidTap(_ sender: Any) {
        if stu_btn25 == false {
            postMethod(endPoint: endPoint, switchValue: "25", pageValue: "1", stuValue: "1")
            stu_btn25 = true
            stu_btn24 = false
        }
        
        else if stu_btn25 == true {
            postMethod(endPoint: endPoint, switchValue: "25", pageValue: "1", stuValue: "0")
            stu_btn24 = false
            stu_btn25 = false
        }
    }
}
