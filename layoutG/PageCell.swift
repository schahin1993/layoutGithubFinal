//
//  PageCell.swift
//  layoutG
//
//  Created by Mac_far on 2/3/19.
//  Copyright © 2019 Mac_far. All rights reserved.
//

import UIKit



class pageCell: UICollectionViewCell {
    
    var page : page? {
        didSet {
            guard let unwrapedPG = page else {return}
            
            logo.image = UIImage(named: unwrapedPG.imageView)
            let atrebuttext = NSMutableAttributedString(string: unwrapedPG.textt, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
            
            atrebuttext.append(NSAttributedString(string: "\n\n\(unwrapedPG.subtitleText)" , attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13) , NSAttributedString.Key.foregroundColor: UIColor.gray]))
            
            txtLbl.attributedText = atrebuttext
            txtLbl.textAlignment = .center
        }
    }
    
    
    private let logo : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "images"))
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    private let txtLbl : UITextView = {
        
        let textView = UITextView()
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
        
    }()
    
    let prevButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.gray, for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    let nextButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor( .red , for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    private let freeSpaceControll : UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.pageIndicatorTintColor = .pink
        pc.currentPageIndicatorTintColor = .red
        return pc
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        setupBtn()
        addSubview(txtLbl)
        setupBack()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupBack() {

        let topView = UIView()
        addSubview(topView)
        topView.addSubview(logo)

        topView.translatesAutoresizingMaskIntoConstraints = false
        logo.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        logo.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
//        logo.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.9)
        logo.widthAnchor.constraint(equalToConstant: 150).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 120).isActive = true

        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        txtLbl.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        txtLbl.rightAnchor.constraint(equalTo: rightAnchor , constant: -30).isActive = true
        txtLbl.leftAnchor.constraint(equalTo: leftAnchor , constant: 30).isActive = true

    }

    
    fileprivate func setupBtn() {
        let controllStackView = UIStackView(arrangedSubviews: [prevButton , freeSpaceControll , nextButton])
        addSubview(controllStackView)
        controllStackView.distribution = .fillEqually
        controllStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            controllStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            controllStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            controllStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            controllStackView.heightAnchor.constraint(equalToConstant: 40)
            ])
        
    }
    
}
