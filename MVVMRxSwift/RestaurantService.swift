//
//  RestaurantService.swift
//  MVVMRxSwift
//
//  Created by Pitchaorn on 12/11/2564 BE.
//

import Foundation
import RxSwift


protocol RestaurantServiceProtocol {
    func fetchRestaurants() -> Observable<[Restaurant]>
}

class RestaurantService: RestaurantServiceProtocol {
    
    func fetchRestaurants() -> Observable<[Restaurant]>{
        
        return Observable.create { observer -> Disposable in
            
//            let task = URLSession.shared.dataTask(with: URL(string: "url-here")!) { data, _, _ in
//                guard let data = data else {
//                    observer.onError(NSError(domain: "", code: -1, userInfo: nil))
//                    return
//                }
//                do {
//                    
//                    let restaurants = try JSONDecoder().decode([Restaurant].self, from: data)
//                    
//                    observer.onNext(restaurants)
//                    
//                } catch(let error) {
//                    observer.onError(error)
//                }
//            }
//            task.resume()
//            return Disposables.create {
//                task.cancel()
//            }
            
            guard let path = Bundle.main.path(forResource: "restaurants", ofType: "json") else {
                observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                return Disposables.create {}
            }
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let restaurants = try JSONDecoder().decode([Restaurant].self, from: data)
                
                observer.onNext(restaurants)
                
            } catch(let error) {
                observer.onError(error)
            }
            
            return Disposables.create { }
        }
        
    }
    
}
