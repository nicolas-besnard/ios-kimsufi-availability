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
}