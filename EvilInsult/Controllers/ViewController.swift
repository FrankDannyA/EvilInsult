//
//  ViewController.swift
//  EvilInsult
//
//  Created by Даниил Франк on 20.02.2022.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Properties
    let task = Task()
    var insult: EvilInsult?
    let urlString = "https://evilinsult.com/generate_insult.php?lang=en&type=json"
    
    //MARK: - IB Outlets
    @IBOutlet var insultLabel: UILabel!
    @IBOutlet var exuseLabel: UILabel!
    @IBOutlet var loadingIndicator: UIActivityIndicatorView!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - IB Action
    @IBAction func getInsultAction(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.task.createTaskWithUrl(self.urlString)
            self.insult = self.task.insult
        }
        
        if insult == nil {
            loadingIndicator.isHidden = false
            loadingIndicator.startAnimating()
        } else {
            loadingIndicator.stopAnimating()
            loadingIndicator.isHidden = true
            insultLabel.text = insult?.insult
        }
        
        
    }
    
    //MARK: - Private func
    private func setupUI(){
        exuseLabel.isHidden = true
        loadingIndicator.isHidden = true
    }
}

