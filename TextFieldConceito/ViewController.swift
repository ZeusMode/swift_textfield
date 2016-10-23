//
//  ViewController.swift
//  TextFieldConceito
//
//  Created by Wesley Cintra Nascimento on 19/10/16.
//  Copyright © 2016 Wesley Cintra Nascimento. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Estados da View
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Habilita o delegate do textField
        textField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    @IBAction func transportaTexto(_ sender: UIButton) {
        
        // Dispensar o teclado
        if textField.resignFirstResponder() {
            // Transporta o texto digitado para label
            labelAlterado.text = textField.text
        }
    }

    // MARK: - Outlets
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var labelAlterado: UILabel!
    @IBOutlet weak var btnTransporte: UIButton!
    
    // MARK: - TextField Delegates
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // Transporta o texto
        transportaTexto(btnTransporte)
        
        // Dispensa o teclado
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason){
        
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // Campo deve ter no mínimo 5 caracteres
        if (textField.text?.characters.count)! < 5 {
            
            // Exibe erro
            let alerta = UIAlertController(title: "Erro de Consistência", message: "O campo deve conter pelo menos 5 caracteres", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(action)
            present(alerta, animated: true, completion: nil)
            
            return false
        }
        
        return true
    }
    
    // MARK: - Tratamento de gestos
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // Dispensar o teclado
        self.becomeFirstResponder()
    }
}

