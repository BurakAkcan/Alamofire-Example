//
//  JsonTableView.swift
//  Alamofire Example
//
//  Created by Burak AKCAN on 15.07.2022.
//

import Foundation
import UIKit

protocol JsonTableViewProtocol{
    func update(items:[UsersModel])

}
protocol JsonTableViewOutput:class{
    func onSelect(item:UsersModel)
}

final class JsonTableView:NSObject,UITableViewDelegate,UITableViewDataSource{
   private lazy var items:[UsersModel] = []
    
    /// Json TableView output Models
    weak var delegate:JsonTableViewOutput?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = items[indexPath.row].title
        cell.detailTextLabel?.text = items[indexPath.row].body
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.onSelect(item: items[indexPath.row])
    }
    
    
}

extension JsonTableView:JsonTableViewProtocol{
    func update(items: [UsersModel]) {
        self.items = items
     
    }
}
