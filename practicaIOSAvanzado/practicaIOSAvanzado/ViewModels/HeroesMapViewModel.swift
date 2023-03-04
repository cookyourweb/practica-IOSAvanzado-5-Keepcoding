//
//  HeroesMapViewModel.swift
//  PracticaIOSAvanzado
//
//  Created by vero on 14/2/23.
//

import Foundation

class HeroesMapViewModel: NSObject {
    
    override init() {
        
    }
    var updateUI: ((_ hero: HeroModel, _ location: [HeroLocation])-> Void)?
    
    func getData(_ hero: HeroModel){
        
        let apiClient = ApiClient(token: readDataKeychain(getEmail()))
       
        apiClient.getLocationHeroes(with: hero.id) { [weak self] location, error in
            self?.updateUI?(hero, location)
            
        } 
      
    }
}
