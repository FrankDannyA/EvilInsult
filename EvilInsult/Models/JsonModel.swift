//
//  JsonModel.swift
//  EvilInsult
//
//  Created by Даниил Франк on 20.02.2022.
//

import Foundation

struct EvilInsult: Codable {
        let number, language, insult, created: String
        let shown, createdby, active, comment: String
}
