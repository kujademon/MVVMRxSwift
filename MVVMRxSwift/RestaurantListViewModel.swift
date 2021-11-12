//
//  RestaurantListViewModel.swift
//  MVVMRxSwift
//
//  Created by Pitchaorn on 12/11/2564 BE.
//

import Foundation
import RxSwift

final class RestaurantListViewModel {
    let title = "Restaurants"
    
    private let restaurantService: RestaurantServiceProtocol
    
    init(restaurantService: RestaurantServiceProtocol = RestaurantService()) {
        self.restaurantService = restaurantService
    }
    
    func fetchRestaurantViewModels() -> Observable<[RestaurantViewModel]>{
        restaurantService.fetchRestaurants().map{ $0.map{ RestaurantViewModel(restaurant: $0) } }
    }
}
