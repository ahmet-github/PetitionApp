//
//  PetitionStruct.swift
//  Project7
//
//  Created by Ahmet İyidoğan on 8/5/22.
//

import Foundation


struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
