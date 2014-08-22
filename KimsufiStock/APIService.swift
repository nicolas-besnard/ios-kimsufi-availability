//
//  APIService.swift
//  KimsufiStock
//
//  Created by Nicolas Besnard on 22/08/2014.
//  Copyright (c) 2014 Nicolas Besnard. All rights reserved.
//

import Foundation

protocol APIServiceProtocol
{
    func didReceivedUserVO(userVO: UserVO)
}

class APIService
{
    let manager = AFHTTPRequestOperationManager()
    let endpoint = "http://localhost:3000/"
    
    var delegate: APIServiceProtocol?
    
    init(delegate: APIServiceProtocol)
    {
        self.manager.requestSerializer = AFJSONRequestSerializer()
        self.delegate = delegate
    }
    
    func createAccount(token: String)
    {
        var parameters = [String: AnyObject]()
        
        parameters["user"] = ["token": token]

        manager.POST(endpoint + "users",
            parameters: parameters,
            success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                
                println("success")
                let json = JSONValue(responseObject)
                
                if json["status"].string! == "error"
                {
                    println("error")
                    println(json["msg"])
                }
                else if json["status"].string! == "ok"
                {
                    let id = json["user"]["id"].integer!
                    let token = json["user"]["token"].string!
                    
                    let userVO = UserVO(id: id, token: token)
                    self.delegate?.didReceivedUserVO(userVO)
                }
            },
            failure: { (operation: AFHTTPRequestOperation!, error: NSError!) in
                println("fail")
                println(error.localizedDescription)
            }
        )
    }
        
    func updateUser(user: User)
    {
        var parameters = [String: AnyObject]()
        
        parameters["user"] = ["need_ks1": user.ks1, "need_ks2": user.ks2, "need_ks3": user.ks3, "need_ks4": user.ks4, "need_ks5a": user.ks5a, "need_ks5b": user.ks5b, "need_ks6": user.ks6]
        
        let jsonSerializer = AFJSONRequestSerializer()
        
        jsonSerializer.setValue("Token token=\(user.token)", forHTTPHeaderField: "Authorization")
        
        manager.requestSerializer = jsonSerializer
        
        manager.PUT(endpoint + "users/\(user.id)",
            parameters: parameters,
            success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                
                println("success")
                let json = JSONValue(responseObject)
                
                if json["status"].string! == "error"
                {
                    println("error")
                    println(json["msg"])
                }
                else if json["status"].string! == "ok"
                {
                    println("ok")
                    println(json)
                }
            },
            failure: { (operation: AFHTTPRequestOperation!, error: NSError!) in
                println("fail")
                println(error.localizedDescription)
            }
        )
    }
}