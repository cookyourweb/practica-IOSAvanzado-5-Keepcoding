//
//  Globals.swift
//  PracticaIOSAvanzado
//
//  Created by vero on 14/2/23.
//

import Foundation

var authToken: String = ""
var apiClient: ApiClient?

func isUserAuthenticated() -> Bool {
    return !authToken.isEmpty
}

