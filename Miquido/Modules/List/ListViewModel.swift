//
//  ListViewModel.swift
//  Miquido
//
//  Created by KL on 09/08/2021.
//

import Foundation

protocol ListViewModelProtocol {
    var data: [Datum] { get }
    func fetchData(completion: @escaping (String?) -> ())
    func getTextForCell(atIndex index: Int) -> String
}

class ListViewModel: ListViewModelProtocol {
    
    private let dataService: DataServiceProtocol
    var data: [Datum] = []
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
    }
    
    func fetchData(completion: @escaping (String?) -> ()) {
        dataService.fetchData { [weak self] response in
            switch response {
            case .success(let listData):
                self?.data = listData.data
                completion(nil)
            case .failure(let error):
                completion(error.rawValue)
            }
        }
    }
    
    func getTextForCell(atIndex index: Int) -> String {
        let datum = data[index]
        return String(format: "%@ %@", datum.firstName, datum.lastName)
    }
}
