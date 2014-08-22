//
//  MockService.swift
//  KimsufiStock
//
//  Created by Nicolas Besnard on 22/08/2014.
//  Copyright (c) 2014 Nicolas Besnard. All rights reserved.
//

import Foundation

class MockService
{
    func createAccount() -> UserVO
    {
        return UserVO(id: 1, token: "1")
    }
    
    func updateUser(user: User)
    {
        
    }
}