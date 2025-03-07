//
//  ServiceProtocol.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/7/25.
//

import Foundation

protocol NetworkingService {
    var networkingHandler: NetworkingHandlerProtocol { get set }
    
    init(networkingHandler: NetworkingHandlerProtocol)
}
