//
//  RestaurantViewModel.swift
//  MVVMRxSwift
//
//  Created by Pitchaorn on 12/11/2564 BE.
//

import Foundation

struct RestaurantViewModel {
    
    private let restaurant: Restaurant
    
    var displayText: String {
        return restaurant.name + " - " + restaurant.cuisine.rawValue.capitalized
    }
    
    init(restaurant: Restaurant){
        self.restaurant = restaurant
    }
    
}
