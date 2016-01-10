//
//  Member.swift
//  CardTilt
//
//  Created by Ray Fix on 6/25/14.
//  Edited by Ray Fix on 4/12/15.
//  Copyright (c) 2014-2015 Razeware LLC. All rights reserved.
//

import Foundation

class Member {
  let imageName: String?
  let name: String?
  let title: String?
  let location: String?
  let about: String?
  let web: String?
  let facebook: String?
  let twitter: String?
  
  init(dictionary:NSDictionary) {
    imageName = dictionary["image"]    as? String
    name      = dictionary["name"]     as? String
    title     = dictionary["title"]    as? String
    location  = dictionary["location"] as? String
    web       = dictionary["web"]      as? String
    facebook  = dictionary["facebook"] as? String
    twitter   = dictionary["twitter"]  as? String
    
    // fixup the about text to add newlines
    let unescapedAbout = dictionary["about"] as? String
    about = unescapedAbout?.stringByReplacingOccurrencesOfString("\\n", withString:"\n", options:[], range:nil)
  }
  
  class func loadMembersFromFile(path:String) -> [Member] {
    var members:[Member] = []
    
    do {
    if let data:NSData? = try NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe) {
        if let json: NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
            
            let team = json["team"] as? [NSDictionary]
            for memberDictionary in team! {
                let member = Member(dictionary: memberDictionary)
                members.append(member)
            }
            
        }
    }
    } catch {
      print ("error")
    }
    
    return members
  }
    
}
