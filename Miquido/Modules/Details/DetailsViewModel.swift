//
//  DetailsViewModel.swift
//  Miquido
//
//  Created by KL on 09/08/2021.
//

import Foundation

protocol DetailsViewModelProtocol {
    var nameText: String { get }
    var emailText: String { get }
}

final class DetailsViewModel: DetailsViewModelProtocol {
    
    private let dataService: DataServiceProtocol
    private let datum: Datum
    
    var nameText: String {
        return String(format: "%@ %@", datum.firstName, datum.lastName)
    }
    
    var emailText: String {
        return datum.email
    }
    
    init(dataService: DataServiceProtocol, datum: Datum) {
        self.dataService = dataService
        self.datum = datum
    }
}
