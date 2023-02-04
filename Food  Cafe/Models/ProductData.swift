//
//  ProductData.swift
//  Food  Cafe
//
//  Created by Thathsarani Nayanathara  on 2/3/23.
//

import Foundation

struct ProductData : Codable{
    
    var id = UUID().uuidString
    var displayName: String = ""
    var sugarCon: String = ""
    var saltCon: String = ""
    var fatCon: String = ""
    var caloriesCon: String = ""
    var createOn: Date = Date()
    var bio: String = ""
    var avatarPath: String = ""
}
