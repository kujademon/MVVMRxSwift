//
//  Restaurant.swift
//  MVVMRxSwift
//
//  Created by Pitchaorn on 12/11/2564 BE.
//

import Foundation

struct Restaurant: Decodable {
    let name: String
    let cuisine:Cuisine
}

enum Cuisine: String, Decodable {
    case european
    case indian
    case mexican
    case french
    case english
}
