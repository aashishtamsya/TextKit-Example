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
    
    func setParagraphAlignment(alignment: NSTextAlignment) {
        let range = textView.selectedRange
        
        let currentAttributes = textView.textStorage.attributes(at: range.location, effectiveRange: nil)
        
        let newParagraphStyle = NSMutableParagraphStyle()
        newParagraphStyle.alignment = alignment
        
        let attributes = currentAttributes.union(dictionaries: [NSParagraphStyleAttributeName: newParagraphStyle])
        
        textView.textStorage.beginEditing()
        textView.textStorage.setAttributes(attributes, range: range)
        textView.textStorage.endEditing()
    }
    
    func setUnderline() {
        let range = textView.selectedRange
        let currentAttributes = textView.textStorage.attributes(at: range.location, effectiveRange: nil)
        var attributes: [String: Any] = currentAttributes
        if currentAttributes[NSUnderlineStyleAttributeName] == nil {
            attributes = attributes.union(dictionaries: [NSUnderlineStyleAttributeName: 1])
        } else if currentAttributes[NSUnderlineStyleAttributeName] as! Int == 0 {
            attributes[NSUnderlineStyleAttributeName] = 1
        } else {
            attributes[NSUnderlineStyleAttributeName] = 0
        }
        textView.textStorage.beginEditing()
        textView.textStorage.setAttributes(attributes, range: range)
        textView.textStorage.endEditing()
    }
    
    func changeColor(_ colorType: ColorType) {
        
        let range = textView.selectedRange
        let currentAttributes = textView.textStorage.attributes(at: range.location, effectiveRange: nil)
        
        var color: UIColor = UIColor.black
        
        switch colorType {
        case .black:
            color = .black
        case .red:
            color = .red
        }
        
        
        var attributes = currentAttributes
        if currentAttributes[NSForegroundColorAttributeName] == nil || currentAttributes[NSForegroundColorAttributeName] as! UIColor != color {
            attributes = currentAttributes.union(dictionaries: [NSForegroundColorAttributeName: color])
        }
    
        textView.textStorage.beginEditing()
        textView.textStorage.setAttributes(attributes, range: range)
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
        setUnderline()
    }
    
    @IBAction func alignTextLeft(_ sender: UIButton) {
        setParagraphAlignment(alignment: .left)
    }
    
    @IBAction func alignTextCenter(_ sender: UIButton) {
        setParagraphAlignment(alignment: .center)
    }
    
    @IBAction func alignTextRight(_ sender: UIButton) {
        setParagraphAlignment(alignment: .right)
    }
    
    @IBAction func makeTextColorRed(_ sender: UIButton) {
        changeColor(.red)
    }
    
    @IBAction func makeTextColorBlack(_ sender: UIButton) {
        changeColor(.black)
    }

}
