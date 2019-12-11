//
//  CustomView.swift
//  App_demo
//
//  Created by Supanut Laddayam on 11/12/2562 BE.
//  Copyright © 2562 Supanut Laddayam. All rights reserved.
//

import Foundation
import UIKit

class CustomView: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        layer.cornerRadius = 6
    }
    
    
}
