//
//  ViewController.swift
//  iQuiz
//
//  Created by Jose Luis Damaren Junior on 14/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var botaoIniciarQuiz: UIButton!
    
    @IBAction func botaoPressionado(_ sender: Any) {
        print("o botão foi pressionado")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraLayout()
    }
    
    func configuraLayout() {
        botaoIniciarQuiz.layer.cornerRadius = 12.0
        navigationItem.hidesBackButton = true
    }


}

