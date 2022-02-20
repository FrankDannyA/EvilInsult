//
//  Task.swift
//  EvilInsult
//
//  Created by Даниил Франк on 20.02.2022.
//

import Foundation

class Task {
    //MARK: - Properties
    var insult: EvilInsult?
    
    //MARK: - Methods
    func createTaskWithUrl(_ urlString: String) {
        guard let insultURL = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: insultURL) { data, _, error in
            if let error = error {
                print("Ошибка")
                print(error)
                return
            }
            
            guard let data = data else { return }
            do {
                let insultFromJson = try JSONDecoder().decode(EvilInsult.self, from: data)
                self.insult = insultFromJson
            } catch let error{
                print(error)
            }
        }.resume()
    }
}
