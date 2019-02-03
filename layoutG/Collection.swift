//
//  Collection.swift
//  layoutG
//
//  Created by Mac_far on 2/3/19.
//  Copyright © 2019 Mac_far. All rights reserved.

import UIKit


struct page {
    let imageView : String
    let textt : String
    let subtitleText : String
}


class SwipingController: UICollectionViewController , UICollectionViewDelegateFlowLayout {
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: {(_) in
         self.collectionViewLayout.invalidateLayout()
        
        if self.freeSpaceControll.currentPage == 0 {
            self.collectionView.contentOffset = .zero
        } else {
                let indexpath = IndexPath(item: self.freeSpaceControll.currentPage, section: 0)
                self.collectionView.scrollToItem(at: indexpath, at: .centeredHorizontally , animated: true)
        }
        
        }) { (_) in
            
            }
    }
    
    let pages = [
        
        page(imageView: "images" , textt: "Hallo Lieber Frunde!" , subtitleText: "\n\nFacebook has more than 2.2 billion monthly active users as of January 2018. Its popularity has led to prominent media coverage for the company"),
        page(imageView: "images2", textt: "wie gets ihnen!" , subtitleText: "ACI Worldwide Inc. is a payment systems company headquartered in Naples, Florida. ACI develops a broad line of software primarily focused on facilitating real-time electronic payments" ),
        page(imageView: "images3", textt: "was machst du", subtitleText: "WhatsApp Messenger is a freeware and cross-platform messaging and Voice over IP service owned by Facebook. The application allows the sending of text messages and voice calls, as well as video calls, images and other media, documents, and user location"),
        page(imageView: "images5", textt: "wir machst schach spilen" , subtitleText: "Twitter is an American online news and social networking service on which users post and interact with messages known as tweets"),
    ]
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        
        freeSpaceControll.currentPage = Int (x / view.frame.width)
        
//        print(x , x / view.frame.width)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBtn()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(pageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! pageCell
        
        let pg = pages[indexPath.item]
        cell.page = pg

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width , height: view.frame.height)
    }
    
    private let prevButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self , action: #selector(handlePrev), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    @objc private func handlePrev() {
        let prevtPage = max(freeSpaceControll.currentPage - 1 , 0)
        freeSpaceControll.currentPage = prevtPage
        let indexpath = IndexPath(item: prevtPage , section: 0)
        collectionView.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)
    }
    
    private let nextButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor( .red , for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    @objc private func handleNext() {
        let nextPage = min(freeSpaceControll.currentPage + 1 , pages.count - 1)
        freeSpaceControll.currentPage = nextPage
        let indexpath = IndexPath(item: nextPage , section: 0)
        collectionView.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)
    }
    
    
    private lazy var freeSpaceControll : UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.pageIndicatorTintColor = .pink
        pc.currentPageIndicatorTintColor = .red
        return pc
    }()
    
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
    
    
}
