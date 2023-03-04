//
//  HeroesListViewModel.swift
//  PracticaIOSAvanzado
//
//  Created by vero on 14/2/23.
//

import Foundation

class HeroesListViewModel: NSObject {
 
    override init() {
        
    }
    var updateUI: ((_ heroes: [HeroModel])-> Void)?
    
    func getData(){
        
        let apiClient = ApiClient(token: readDataKeychain(getEmail()))
        apiClient.getHeroes { [ weak self ] heroes, error in
            self?.updateUI?(heroes)
           
        }
      
    }
    
    
    
}
