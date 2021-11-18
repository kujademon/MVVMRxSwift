//
//  ViewController.swift
//  MVVMRxSwift
//
//  Created by Pitchaorn on 11/11/2564 BE.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    private var viewModel: RestaurantListViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    static func instantiate(viewModel: RestaurantListViewModel) -> ViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyboard.instantiateInitialViewController() as! ViewController
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.contentInsetAdjustmentBehavior = .never
        
        
        viewModel.fetchRestaurantViewModels().observe(on: MainScheduler.instance).bind(to: tableView.rx.items(cellIdentifier: "cell")){
            index, viewModel, cell in
            cell.textLabel?.text = viewModel.displayText
        }.disposed(by: disposeBag)
        
//        Observable
//            .zip(tableView.rx.itemSelected, tableView.rx.modelSelected(RestaurantViewModel.self))
//            .bind { [unowned self] indexPath, model in
//                self.tableView.deselectRow(at: indexPath, animated: true)
//                print("Selected " + model.displayText + " at \(indexPath)")
//            }
//            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(RestaurantViewModel.self)
                .subscribe(onNext: { [weak self] item in
                    // other actions with Item object
                    print("Selected " + item.displayText)
                }).disposed(by: disposeBag)
    }
    
    
}

