//
//  CustomButton.swift
//  App_demo
//
//  Created by Supanut Laddayam on 11/12/2562 BE.
//  Copyright © 2562 Supanut Laddayam. All rights reserved.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    func setupButton() {
        layer.cornerRadius = 6
    }
    
    
}
