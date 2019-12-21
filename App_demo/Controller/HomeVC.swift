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
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    
    @IBOutlet weak var pressedBtn1: UIImageView!
    @IBOutlet weak var pressedBtn2: UIImageView!
    @IBOutlet weak var pressedBtn3: UIImageView!
    @IBOutlet weak var pressedBtn4: UIImageView!
    @IBOutlet weak var pressedBtn5: UIImageView!
    
    //MARK: - section Blue
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    @IBOutlet weak var pressedBtn6: UIImageView!
    @IBOutlet weak var pressedBtn7: UIImageView!
    @IBOutlet weak var pressedBtn8: UIImageView!
    @IBOutlet weak var pressedBtn9: UIImageView!
    
    
    //MARK: - section Green
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!
    @IBOutlet weak var button13: UIButton!
    
    @IBOutlet weak var pressBtn10: UIImageView!
    @IBOutlet weak var pressBtn11: UIImageView!
    @IBOutlet weak var pressBtn12: UIImageView!
    @IBOutlet weak var pressBtn13: UIImageView!
    
    //MARK: - section Red
    @IBOutlet weak var button14: UIButton!
    @IBOutlet weak var button15: UIButton!
    @IBOutlet weak var button16: UIButton!
    @IBOutlet weak var button17: UIButton!
    
    @IBOutlet weak var pressBtn14: UIImageView!
    @IBOutlet weak var pressBtn15: UIImageView!
    @IBOutlet weak var pressBtn16: UIImageView!
    @IBOutlet weak var pressBtn17: UIImageView!
    
    //MARK: - section Yellow
    @IBOutlet weak var button18: UIButton!
    @IBOutlet weak var button19: UIButton!
    @IBOutlet weak var button20: UIButton!
    @IBOutlet weak var button21: UIButton!
    
    @IBOutlet weak var pressBtn18: UIImageView!
    @IBOutlet weak var pressBtn19: UIImageView!
    @IBOutlet weak var pressBtn20: UIImageView!
    @IBOutlet weak var pressBtn21: UIImageView!
    
    //MARK: - section Violet
    @IBOutlet weak var button22: UIButton!
    @IBOutlet weak var button23: UIButton!
    
    @IBOutlet weak var pressBtn22: UIImageView!
    @IBOutlet weak var pressBtn23: UIImageView!
    
    //MARK: - section Grey
    @IBOutlet weak var button24: UIButton!
    @IBOutlet weak var button25: UIButton!
    
    @IBOutlet weak var pressBtn24: UIImageView!
    @IBOutlet weak var pressBtn25: UIImageView!
    
    //MARK: - section Volume Contorl
    @IBOutlet weak var volumeContorl: UISlider!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            initalStatus()
        volumeContorl.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_2))
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
        pressedBtn1.image = UIImage(named: "oorage1")
        
        //section BLUE
        postMethod(endPoint: endPoint, switchValue: "6", pageValue: "1", stuValue: "1")
        pressedBtn6.image = UIImage(named: "pressBlue1")
        
        //section GREEN
        postMethod(endPoint: endPoint, switchValue: "10", pageValue: "1", stuValue: "1")
        pressBtn10.image = UIImage(named: "pressGreen1")
        
        //section RED
        postMethod(endPoint: endPoint, switchValue: "14", pageValue: "1", stuValue: "1")
        pressBtn14.image = UIImage(named: "pressRed1")
        
        //section YELLOW
        postMethod(endPoint: endPoint, switchValue: "18", pageValue: "1", stuValue: "1")
        pressBtn18.image = UIImage(named: "pressYellow1")
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
            
            pressedBtn1.image = UIImage(named: "orange1")
            
            stu_btn1 = true
            stu_btn2 = false
            stu_btn3 = false
            stu_btn4 = false
            stu_btn5 = false
        }
        
        else if stu_btn1 == true {
            postMethod(endPoint: endPoint, switchValue: "1", pageValue: "1", stuValue: "0")
            
            pressedBtn1.image = UIImage(named: "oorage1")
            
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
            
            pressedBtn2.image = UIImage(named: "orange2")
            
            stu_btn1 = false
            stu_btn3 = false
            stu_btn4 = false
            stu_btn5 = false
        }
    
        else if stu_btn2 == true {
            postMethod(endPoint: endPoint, switchValue: "2", pageValue: "1", stuValue: "0")
            
            pressedBtn2.image = UIImage(named: "oorage2")
            
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
            
            pressedBtn3.image = UIImage(named: "orange3")
        }
        
        else if stu_btn3 == true {
             postMethod(endPoint: endPoint, switchValue: "3", pageValue: "1", stuValue: "0")
            stu_btn1 = false
            stu_btn2 = false
            stu_btn3 = false
            stu_btn4 = false
            stu_btn5 = false
            
            pressedBtn3.image = UIImage(named: "oorage3")
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
            
            pressedBtn4.image = UIImage(named: "orange4")
        }
               
        else if stu_btn4 == true {
            //Set Other button_status
             postMethod(endPoint: endPoint, switchValue: "4", pageValue: "1", stuValue: "0")
            stu_btn1 = false
            stu_btn2 = false
            stu_btn3 = false
            stu_btn4 = false
            stu_btn5 = false
            
            pressedBtn4.image = UIImage(named: "oorage4")
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
            
            pressedBtn5.image = UIImage(named: "oorage5")
            }
        
            else if stu_btn5 == true {
             postMethod(endPoint: endPoint, switchValue: "5", pageValue: "1", stuValue: "0")
                stu_btn1 = false
                stu_btn2 = false
                stu_btn3 = false
                stu_btn4 = false
                stu_btn5 = false
            
            pressedBtn5.image = UIImage(named: "oorage5")
            }
        }
    
    // MARK: - Handle DidTap section BLUE
    //btn6
    @IBAction func button6_DidTap(_ sender: Any) {
        if stu_btn6 == false {
            stu_btn6 = true
            postMethod(endPoint: endPoint, switchValue: "6", pageValue: "1", stuValue: "1")
            pressedBtn6.image = UIImage(named: "blue1")
        }
               
        else if stu_btn6 == true {
            postMethod(endPoint: endPoint, switchValue: "6", pageValue: "1", stuValue: "0")
            
            pressedBtn6.image = UIImage(named: "pressBlue1")
            
            stu_btn6 = false
        }
    }
    
    //btn7
    @IBAction func button7_DidTap(_ sender: Any) {
        if stu_btn7 == false {
            stu_btn7 = true
            postMethod(endPoint: endPoint, switchValue: "7", pageValue: "1", stuValue: "1")
            
            pressedBtn7.image = UIImage(named: "blue2")
        }
                      
        else if stu_btn7 == true {
            postMethod(endPoint: endPoint, switchValue: "7", pageValue: "1", stuValue: "0")
            
            pressedBtn7.image = UIImage(named: "pressBlue2")
            
            stu_btn7 = false
        }
    }
    
    //btn8
    @IBAction func button8_DidTap(_ sender: Any) {
        if stu_btn8 == false {
            stu_btn8 = true
            postMethod(endPoint: endPoint, switchValue: "8", pageValue: "1", stuValue: "1")
            pressedBtn8.image = UIImage(named: "blue3")
        }
                      
        else if stu_btn8 == true {
            postMethod(endPoint: endPoint, switchValue: "8", pageValue: "1", stuValue: "0")
            stu_btn8 = false
            
            pressedBtn8.image = UIImage(named: "pressBlue3")
        }
    }
    
    //btn9
    @IBAction func button9_DidTap(_ sender: Any) {
        if stu_btn9 == false {
            stu_btn9 = true
            postMethod(endPoint: endPoint, switchValue: "9", pageValue: "1", stuValue: "1")
             pressedBtn9.image = UIImage(named: "blue4")
        }
                      
        else if stu_btn9 == true {
            postMethod(endPoint: endPoint, switchValue: "9", pageValue: "1", stuValue: "0")
            stu_btn9 = false
            pressedBtn9.image = UIImage(named: "pressBlue4")
        }
    }
    
    //MARK: - Handle DidTap section GREEN
    //btn10
    @IBAction func button10_DidTap(_ sender: Any) {
        if stu_btn10 == false {
            stu_btn10 = true
            postMethod(endPoint: endPoint, switchValue: "10", pageValue: "1", stuValue: "1")
            pressBtn10.image = UIImage(named: "green1")
        }
                      
        else if stu_btn10 == true {
            postMethod(endPoint: endPoint, switchValue:"10", pageValue: "1", stuValue: "0")
            stu_btn10 = false
            pressBtn10.image = UIImage(named: "pressGreen1")
        }
    }
    
    //btn11
    @IBAction func button11_DidTap(_ sender: Any) {
        if stu_btn11 == false {
            stu_btn11 = true
            postMethod(endPoint: endPoint, switchValue: "11", pageValue: "1", stuValue: "1")
            pressBtn11.image = UIImage(named: "green2")
        }
                      
        else if stu_btn11 == true {
            postMethod(endPoint: endPoint, switchValue:"11", pageValue: "1", stuValue: "0")
            stu_btn11 = false
            pressBtn11.image = UIImage(named: "pressGreen2")
        }
    }
    
    //btn12
    @IBAction func button12_DidTap(_ sender: Any) {
        if stu_btn12 == false {
            stu_btn12 = true
            postMethod(endPoint: endPoint, switchValue: "12", pageValue: "1", stuValue: "1")
            pressBtn12.image = UIImage(named: "green3")
        }
                      
        else if stu_btn12 == true {
            postMethod(endPoint: endPoint, switchValue:"12", pageValue: "1", stuValue: "0")
            stu_btn12 = false
            pressBtn12.image = UIImage(named: "pressGreen3")
        }
    }
    
    //btn13
    @IBAction func button13_DidTap(_ sender: Any) {
        if stu_btn13 == false {
            stu_btn13 = true
            postMethod(endPoint: endPoint, switchValue: "13", pageValue: "1", stuValue: "1")
            pressBtn13.image = UIImage(named: "green4")
        }
                      
        else if stu_btn13 == true {
            postMethod(endPoint: endPoint, switchValue:"13", pageValue: "1", stuValue: "0")
            stu_btn13 = false
            pressBtn13.image = UIImage(named: "pressGreen4")
        }
    }
    
    //MARK: - Handel DidTap section RED
    //btn14
    @IBAction func button14_DidTap(_ sender: Any) {
        if stu_btn14 == false {
            stu_btn14 = true
            postMethod(endPoint: endPoint, switchValue: "14", pageValue: "1", stuValue: "1")
            pressBtn14.image = UIImage(named: "red1")
        }
                      
        else if stu_btn14 == true {
            postMethod(endPoint: endPoint, switchValue:"14", pageValue: "1", stuValue: "0")
            stu_btn14 = false
            pressBtn14.image = UIImage(named: "pressRed1")
        }
    }
    
    //btn15
    @IBAction func button15_DidTap(_ sender: Any) {
        if stu_btn15 == false {
            stu_btn15 = true
            postMethod(endPoint: endPoint, switchValue: "15", pageValue: "1", stuValue: "1")
            pressBtn15.image = UIImage(named: "red2")
        }
                      
        else if stu_btn15 == true {
            postMethod(endPoint: endPoint, switchValue:"15", pageValue: "1", stuValue: "0")
            stu_btn15 = false
            pressBtn15.image = UIImage(named: "pressRed2")
        }
    }
    
    //btn16
    @IBAction func button16_DidTap(_ sender: Any) {
        if stu_btn16 == false {
            stu_btn16 = true
            postMethod(endPoint: endPoint, switchValue: "16", pageValue: "1", stuValue: "1")
            pressBtn16.image = UIImage(named: "red3")
        }
                      
        else if stu_btn16 == true {
            postMethod(endPoint: endPoint, switchValue:"16", pageValue: "1", stuValue: "0")
            stu_btn16 = false
            pressBtn16.image = UIImage(named: "pressRed3")
        }
    }
    
    //btn17
    @IBAction func button17_DidTap(_ sender: Any) {
        if stu_btn17 == false {
            stu_btn17 = true
            postMethod(endPoint: endPoint, switchValue: "17", pageValue: "1", stuValue: "1")
            pressBtn17.image = UIImage(named: "red4")
        }
                      
        else if stu_btn17 == true {
            postMethod(endPoint: endPoint, switchValue:"17", pageValue: "1", stuValue: "0")
            stu_btn17 = false
            pressBtn17.image = UIImage(named: "pressRed4")
        }
    }
    
    //MARK:- Handle DidTap section YELLOW
    //btn18
    @IBAction func button18_DidTap(_ sender: Any) {
        if stu_btn18 == false {
            postMethod(endPoint: endPoint, switchValue: "18", pageValue: "1", stuValue: "1")
            stu_btn18 = true
            
            stu_btn19 = false
            stu_btn20 = false
            stu_btn21 = false
            
            pressBtn18.image = UIImage(named: "yellow1")
        }
        
        else if stu_btn18 == true {
            postMethod(endPoint: endPoint, switchValue: "18", pageValue: "1", stuValue: "0")
            stu_btn18 = false
            stu_btn19 = false
            stu_btn20 = false
            stu_btn21 = false
            
            pressBtn18.image = UIImage(named: "pressYellow1")
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
            
            pressBtn19.image = UIImage(named: "yellow2")
        }
        
        else if stu_btn19 == true {
            postMethod(endPoint: endPoint, switchValue: "19", pageValue: "1", stuValue: "0")
            stu_btn18 = false
            stu_btn19 = false
            stu_btn20 = false
            stu_btn21 = false
  
            pressBtn19.image = UIImage(named: "pressYellow2")
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
        
            pressBtn20.image = UIImage(named: "yellow3")
        }
              
        else if stu_btn20 == true {
            postMethod(endPoint: endPoint, switchValue: "20", pageValue: "1", stuValue: "0")
            stu_btn18 = false
            stu_btn19 = false
            stu_btn20 = false
            stu_btn21 = false
        
            pressBtn20.image = UIImage(named: "pressYellow3")
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
            
            pressBtn21.image = UIImage(named: "yellow4")
        }
              
        else if stu_btn21 == true {
            postMethod(endPoint: endPoint, switchValue: "21", pageValue: "1", stuValue: "0")
            stu_btn18 = false
            stu_btn19 = false
            stu_btn20 = false
            stu_btn21 = false
            
            pressBtn21.image = UIImage(named: "pressYellow4")
        
        }
    }
    
    //MARK: - Handle DidTap section VIOLET
    //btn22
    @IBAction func button22_DidTap(_ sender: Any) {
        if stu_btn22 == false {
            postMethod(endPoint: endPoint, switchValue: "22", pageValue: "1", stuValue: "0")
            stu_btn22 = true
            stu_btn23 = false
            pressBtn22.image = UIImage(named: "violet1")
        }
        
        else if stu_btn22 == true {
            postMethod(endPoint: endPoint, switchValue: "22", pageValue: "1", stuValue: "1")
            stu_btn22 = false
            stu_btn23 = false
            
            pressBtn22.image = UIImage(named: "pressViolet1")
        }
    }
    
    //btn23
    @IBAction func button23_DidTAp(_ sender: Any) {
        if stu_btn23 == false {
            postMethod(endPoint: endPoint, switchValue: "23", pageValue: "1", stuValue: "1")
            stu_btn22 = false
            stu_btn23 = true
            pressBtn23.image = UIImage(named: "violet2")
        }
        
        else if stu_btn23 == true {
            postMethod(endPoint: endPoint, switchValue: "23", pageValue: "2", stuValue: "2")
            stu_btn22 = false
            stu_btn23 = false
            pressBtn23.image = UIImage(named: "pressViolet2")
        }
    }
    
    
    //MARK: - Handle DidTap section GREY
    //btn24
    @IBAction func button24_DidTap(_ sender: Any) {
        if stu_btn24 == false {
            postMethod(endPoint: endPoint, switchValue: "24", pageValue: "1", stuValue: "1")
            stu_btn24 = true
            stu_btn25 = false
            pressBtn24.image = UIImage(named: "grey1")
        }
        
        else if stu_btn24 == true {
            postMethod(endPoint: endPoint, switchValue: "24", pageValue: "1", stuValue: "0")
            stu_btn24 = false
            stu_btn25 = false
            pressBtn24.image = UIImage(named: "pressGrey1")
        }
    }
    
    //btn25
    @IBAction func button25_DidTap(_ sender: Any) {
        if stu_btn25 == false {
            postMethod(endPoint: endPoint, switchValue: "25", pageValue: "1", stuValue: "1")
            stu_btn25 = true
            stu_btn24 = false
            pressBtn25.image = UIImage(named: "grey2")
        }
        
        else if stu_btn25 == true {
            postMethod(endPoint: endPoint, switchValue: "25", pageValue: "1", stuValue: "0")
            stu_btn24 = false
            stu_btn25 = false
            pressBtn25.image = UIImage(named: "pressGrey2")
        }
    }
}
