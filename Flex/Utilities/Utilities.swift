//
//  Utilities.swift
//  Flex
//
//  Created by Oscar Garcia Vazquez on 11/21/20.
//

import UIKit

class Utilities {
    func textField(with Placeholder : String) -> UITextField {
        let tf = UITextField()
        tf.textAlignment = .center
        tf.keyboardType = .decimalPad
        tf.placeholder = Placeholder
        
        return tf
    }
}
