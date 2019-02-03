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
    
    let pages = [
        
        page(imageView: "images" , textt: "Hallo Lieber Frunde!" , subtitleText: "\n\nFacebook has more than 2.2 billion monthly active users as of January 2018. Its popularity has led to prominent media coverage for the company"),
        page(imageView: "images2", textt: "wie gets ihnen!" , subtitleText: "ACI Worldwide Inc. is a payment systems company headquartered in Naples, Florida. ACI develops a broad line of software primarily focused on facilitating real-time electronic payments" ),
        page(imageView: "images3", textt: "was machst du", subtitleText: "WhatsApp Messenger is a freeware and cross-platform messaging and Voice over IP service owned by Facebook. The application allows the sending of text messages and voice calls, as well as video calls, images and other media, documents, and user location"),
        page(imageView: "images5", textt: "wir machst schach spilen" , subtitleText: "Twitter is an American online news and social networking service on which users post and interact with messages known as tweets"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
}
