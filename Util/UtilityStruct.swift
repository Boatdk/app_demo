//
//  UtilityStruct.swift
//  App_demo
//
//  Created by Supanut Laddayam on 11/12/2562 BE.
//  Copyright © 2562 Supanut Laddayam. All rights reserved.
//

import Foundation

struct passingVariable: Decodable {
    let page: String
    let sswitch: String
    
    init(json: [String: Any]) {
        page = json["page"] as? String ?? ""
        sswitch = json["sswitch"] as? String ?? ""
    }
}
