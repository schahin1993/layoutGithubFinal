//
//  ViewController.swift
//  layoutG
//
//  Created by Mac_far on 2/3/19.
//  Copyright © 2019 Mac_far. All rights reserved.
//

import UIKit


extension UIColor {
    static var pink = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
}

class ViewController: UIViewController {
    
    let logo : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "images"))
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    
    let txtLbl : UITextView = {
        
        let textView = UITextView()
        let atrebuttext = NSMutableAttributedString(string: "Hallo Lieber Frunde!", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        
        atrebuttext.append(NSAttributedString(string: "\n\nFacebook has more than 2.2 billion monthly active users as of January 2018. Its popularity has led to prominent media coverage for the company", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13) , NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = atrebuttext
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
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBtn()
        view.addSubview(txtLbl)
        setupBack()
    }
    
    
    fileprivate func setupBtn() {
        let controllStackView = UIStackView(arrangedSubviews: [prevButton , freeSpaceControll , nextButton])
        view.addSubview(controllStackView)
        controllStackView.distribution = .fillEqually
        controllStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            controllStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            controllStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            controllStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            controllStackView.heightAnchor.constraint(equalToConstant: 40)
            ])
        
    }
    
    private func setupBack() {
        
        let topView = UIView()
        view.addSubview(topView)
        topView.addSubview(logo)
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        logo.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        logo.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
        logo.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.9)
        logo.widthAnchor.constraint(equalToConstant: 150).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        txtLbl.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        txtLbl.rightAnchor.constraint(equalTo: view.rightAnchor , constant: -30).isActive = true
        txtLbl.leftAnchor.constraint(equalTo: view.leftAnchor , constant: 30).isActive = true
        
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
    }
    

}

