//
//  AppCoordinator.swift
//  MVVMRxSwift
//
//  Created by Pitchaorn on 11/11/2564 BE.
//

import UIKit

class AppCoordinator{
    
    private let window: UIWindow
    
    init(window: UIWindow){
        self.window = window
    }
    
    func start(){
        let vc = ViewController.instantiate(viewModel: RestaurantListViewModel())
        let navigationController = UINavigationController(rootViewController: vc)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
