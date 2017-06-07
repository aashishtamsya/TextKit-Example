//
//  SecondViewController.swift
//  TextKit Example
//
//  Created by Aashish Tamsya on 06/06/17.
//  Copyright © 2017 Aashish Tamsya. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    func changeTrait(trait: UIFontDescriptorSymbolicTraits) {
        let range = textView.selectedRange
        let currentAttributes = textView.textStorage.attributes(at: range.location, effectiveRange: nil)
        guard let currentFont = currentAttributes[NSFontAttributeName] as? UIFont else {
            return
        }
        
        let fontDescriptor = currentFont.fontDescriptor
        var changedFontDescriptor: UIFontDescriptor!
        
        
        if fontDescriptor.symbolicTraits.contains(trait) {
            let existingTraitsWithNewTrait = UIFontDescriptorSymbolicTraits(rawValue: fontDescriptor.symbolicTraits.rawValue & ~trait.rawValue)
            changedFontDescriptor = fontDescriptor.withSymbolicTraits(existingTraitsWithNewTrait)
        } else {
            changedFontDescriptor = fontDescriptor.withSymbolicTraits(UIFontDescriptorSymbolicTraits(rawValue: fontDescriptor.symbolicTraits.rawValue | trait.rawValue))
        }
        
        let updatedFont = UIFont(descriptor: changedFontDescriptor , size: 0)
        
        let newAttributes = [NSFontAttributeName: updatedFont]
        textView.textStorage.beginEditing()
        textView.textStorage.setAttributes(newAttributes, range: range)
        textView.textStorage.endEditing()
    }
}

// MARK: - Actions
extension SecondViewController {
    @IBAction func makeBold(_ sender: UIButton) {
        changeTrait(trait: .traitBold)
    }
    
    @IBAction func makeItalic(_ sender: UIButton) {
        changeTrait(trait: .traitItalic)
    }
    
    @IBAction func underlineText(_ sender: UIButton) {
        
    }
    
    @IBAction func alignTextLeft(_ sender: UIButton) {
        
    }
    
    @IBAction func alignTextCenter(_ sender: UIButton) {
        
    }
    
    @IBAction func alignTextRight(_ sender: UIButton) {
        
    }
    
    @IBAction func makeTextColorRed(_ sender: UIButton) {
        
    }
    
    @IBAction func makeTextColorBlack(_ sender: UIButton) {
        
    }

}
