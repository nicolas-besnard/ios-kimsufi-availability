//
//  UserVO.swift
//  KimsufiStock
//
//  Created by Nicolas Besnard on 22/08/2014.
//  Copyright (c) 2014 Nicolas Besnard. All rights reserved.
//

import Foundation

class UserVO
{
    var id: Int
    var token: String
    var ks1: Bool = false
    var ks2: Bool = false
    var ks3: Bool = false
    var ks4: Bool = false
    var ks5a: Bool = false
    var ks5b: Bool = false
    var ks6: Bool = false
    
    init(id: Int, token: String)
    {
        self.id = id
        self.token = token
    }
    
    init(json: JSONValue)
    {
        self.id = json["user"]["id"].integer!
        self.token = json["user"]["token"].string!
        self.ks1 = json["user"]["need_ks1"].bool!
        self.ks2 = json["user"]["need_ks2"].bool!
        self.ks3 = json["user"]["need_ks3"].bool!
        self.ks4 = json["user"]["need_ks4"].bool!
        self.ks5a = json["user"]["need_ks5a"].bool!
        self.ks5b = json["user"]["need_ks5b"].bool!
        self.ks6 = json["user"]["need_ks6"].bool!
    }
}