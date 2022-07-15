//
//  JsonViewController.swift
//  Alamofire Example
//
//  Created by Burak AKCAN on 15.07.2022.
//

import UIKit

class JsonViewController: UIViewController {
    
   private let jsonTableView:JsonTableView = JsonTableView()
    private let jsonService:JsonPlaceHolderProtocol = JsonPlaceHolderService()
    @IBOutlet weak var tableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = jsonTableView
        tableView.dataSource = jsonTableView
        jsonTableView.delegate = self
        initService()
       
    }
    
    func initService(){
        jsonService.fetchAll { [weak self] (models) in
            self?.jsonTableView.update(items: models)
            self?.tableView.reloadData()
        } onFail: { (data) in
            print(data?.debugDescription)
        }

    }
}

extension JsonViewController:JsonTableViewOutput{
    func onSelect(item: UsersModel) {
        print(item.body)
    }
    
    
}
