//
//  QuestaoViewController.swift
//  iQuiz
//
//  Created by Jose Luis Damaren Junior on 16/04/23.
//

import UIKit

class QuestaoViewController: UIViewController {
    
    var pontuacao = 0
    var numeroQuestao = 0

    @IBOutlet weak var questaoLabel: UILabel!
    @IBOutlet var botoesRespostas: [UIButton]!
    
    @IBAction func respostaBotaoPressionado(_ sender: UIButton) {
        let acertou = sender.tag == questoes[numeroQuestao].respostaCorreta
        
        if acertou {
            pontuacao += 1
            sender.backgroundColor = UIColor(red: 0.043, green: 0.631, blue: 0.208, alpha: 1)
        } else {
            sender.backgroundColor = UIColor(red: 0.829, green: 0.066, blue: 0.066, alpha: 1)
        }
        
        if numeroQuestao < questoes.count - 1 {
            numeroQuestao += 1
            Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(configurarQuestao), userInfo: nil, repeats: false)
        } else {
            navegaParaTelaDesempenho()
        }
    }
    
    func navegaParaTelaDesempenho() {
        performSegue(withIdentifier: "irParaTelaDesempenho", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configurarLayout()
        configurarQuestao()
    }
    
    func configurarLayout() {
        navigationItem.hidesBackButton = true
        questaoLabel.numberOfLines = 0
        for botao in botoesRespostas {
            botao.layer.cornerRadius = 12
        }
    }
    
    @objc func configurarQuestao() {
        questaoLabel.text = questoes[numeroQuestao].titulo
        for botao in botoesRespostas {
            let titulo = questoes[numeroQuestao].respostas[botao.tag]
            botao.setTitle(titulo, for: .normal)
            botao.backgroundColor = UIColor(red: 0.453, green: 0.196, blue: 1, alpha: 1)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let desempenhoVC = segue.destination as? DesempenhoViewController else {
            return
        }
        desempenhoVC.pontuacao = pontuacao
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
