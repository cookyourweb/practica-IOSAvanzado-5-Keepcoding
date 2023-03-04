//
//  Keychain.swift
//  practicaIOSAvanzado
//
//  Created by vero on 22/2/23.
//

import Foundation
import CoreData


// MARK: KeyChain

func saveDataKeychain(_ token: String, _ email: String) {
    // User
    let userName = email
    let token = token.data(using: .utf8)!
    
//    Atributes
    
    let attributes: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrAccount as String: userName,
        kSecValueData as String: token
    ]
    // Save user with - no se si está funcionando bien
    
    if SecItemAdd(attributes as CFDictionary, nil) == noErr {
        debugPrint("User saved correctly")
    } else {
        debugPrint("There was an error saving the user")
    }
    
    
}


func readDataKeychain(_ email: String) -> String {
    var tokenUser = ""
    // Establecer el usuario que queremos encontrar
    let userName = email
    // Preparamos la consulta
    let query: [String: Any] = [
        
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrAccount as String: userName,
        kSecMatchLimit as String: kSecMatchLimitOne,
        kSecReturnAttributes as String: true,
        kSecReturnData as String: true
        
        
    ]
    
    
//
    var item: CFTypeRef?
//    parametros in de entrada -item recibe y le pasa variable como parametro. Para motificar ese parametro se le pasa el & que es la referencia a la memoria de donde está esa variable
    
    if SecItemCopyMatching(query as CFDictionary, &item) == noErr {
        // extraemos la informacion con un desempaquetado
//        desempaquetamos y el valor lo convertimos a un diccionario
        
        if let item = item as? [String: Any],
           let tokenData = item[kSecValueData as String] as? Data,
           let token = String(data: tokenData, encoding: .utf8) {
            
            debugPrint("Usuario recuperado")

            tokenUser = token
            
        }
    }
    return tokenUser
    
    
}


func deleteTokenKeychain(_ email: String) {
    let userName = email
    let query : [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrAccount as String: userName
    ]
    
    if ( SecItemDelete(query as CFDictionary)) == noErr {
        debugPrint("Token deleted successfully (KeyChain)")
    } else {
        debugPrint("Error during deleting token of KeyChein")
        
    }
    
}
