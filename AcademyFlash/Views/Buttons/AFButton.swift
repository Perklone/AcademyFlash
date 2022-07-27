//
//  AFButton.swift
//  AcademyFlash
//
//  Created by Rizky Maulana on 27/07/22.
//

import UIKit

class AFButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    convenience init(color:UIColor, title:String) {
        self.init(frame: .zero)
        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = .white
        configuration?.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        configuration = .filled()
        configuration?.cornerStyle = .medium
        configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer({ AttributeContainer in
            var output = AttributeContainer
            output.font = UIFont.preferredFont(forTextStyle: .headline)
            return output
        })
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}
