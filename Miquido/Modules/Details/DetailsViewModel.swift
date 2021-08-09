//
//  DetailsViewModel.swift
//  Miquido
//
//  Created by KL on 09/08/2021.
//

import UIKit

protocol DetailsViewModelProtocol {
    var nameText: String { get }
    var emailText: String { get }
    var avatarStringUrl: String { get }
}

final class DetailsViewModel: DetailsViewModelProtocol {
    
    private let datum: Datum
    
    var nameText: String {
        return String(format: "%@ %@", datum.firstName, datum.lastName)
    }
    
    var emailText: String {
        return datum.email
    }
    
    var avatarStringUrl: String {
        return datum.avatar
    }
    
    init(datum: Datum) {
        self.datum = datum
    }
}
