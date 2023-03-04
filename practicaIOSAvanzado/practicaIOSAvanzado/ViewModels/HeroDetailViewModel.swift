//
//  HeroDetailViewModel.swift
//  PracticaIOSAvanzado
//
//  Created by vero on 14/2/23.
//

import Foundation

class HeroDetailViewModel: NSObject {
    override init() {
        
    }
    
    var updateUI: ((_ hero: HeroModel?, _ error: String) -> Void)?
    
    func getDataForASpecificHearo(name: String) {
        let apiClient = ApiClient(token: readDataKeychain(getEmail()))

        apiClient.getHeroByName(name: name) { [weak self] hero, error  in
            
            guard error == nil else {
                self?.updateUI?(nil, "Error getting Hero Details")
                return
            }

            guard let hero = hero else {
                self?.updateUI?(nil, "Error getting Hero Details")
                return
            }
            
            self?.updateUI?(hero, "")
        }
    }
}
