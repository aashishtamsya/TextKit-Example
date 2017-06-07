//
//  ViewController.swift
//  TextKit Example
//
//  Created by Aashish Tamsya on 06/06/17.
//  Copyright © 2017 Aashish Tamsya. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    fileprivate var styleApplied: UIFontTextStyle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(FirstViewController.textSizeChanged(withNotification:)), name:  NSNotification.Name.UIContentSizeCategoryDidChange, object: nil)
        imageView.isHidden = true
    }
    
    func textSizeChanged(withNotification notification: Notification) {
        textView.font = UIFont.preferredFont(forTextStyle: styleApplied ?? .body)
    }
    
    func applyStyleToSelection(_ style: UIFontTextStyle) {
        let range = textView.selectedRange
        let preferredFont = UIFont.preferredFont(forTextStyle: style)
        
        textView.textStorage.beginEditing()
        let attributes = [NSFontAttributeName : preferredFont]
        textView.textStorage.setAttributes(attributes, range: range)
        textView.textStorage.endEditing()
        
    }
}

// MARK: - Actions
extension FirstViewController {
    @IBAction func headlineStyleButtonSelected(_ sender: UIButton) {
        applyStyleToSelection(.headline)
        styleApplied = UIFontTextStyle.headline
    }
    
    @IBAction func subHeadlineStyleButtonSelected(_ sender: UIButton) {
        applyStyleToSelection(.subheadline)
        styleApplied = UIFontTextStyle.subheadline
    }
    
    @IBAction func bodyStyleButtonSelected(_ sender: UIButton) {
        applyStyleToSelection(.body)
        styleApplied = UIFontTextStyle.body
    }
    
    @IBAction func footnoteStyleButtonSelected(_ sender: UIButton) {
        applyStyleToSelection(.footnote)
        styleApplied = UIFontTextStyle.footnote
    }
    
    @IBAction func captionOneStyleButtonSelected(_ sender: UIButton) {
        applyStyleToSelection(.caption1)
        styleApplied = UIFontTextStyle.caption1
    }
    
    @IBAction func captionTwoStyleButtonSelected(_ sender: UIButton) {
        applyStyleToSelection(.caption2)
        styleApplied = UIFontTextStyle.caption2
    }
    
    @IBAction func toggleImageButtonSelected(_ sender: UIButton) {
        
        if imageView.isHidden {
            let convertedFrame = textView.convert(imageView.frame, from: self.view)
            textView.textContainer.exclusionPaths = [UIBezierPath(rect: convertedFrame)]
        } else {
            textView.textContainer.exclusionPaths = []
        }
        imageView.isHidden = !imageView.isHidden
    }
}
