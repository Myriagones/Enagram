//
//  ListMediaViewController.swift
//  Enagram
//
//  Created by Perso on 18/07/2020.
//  Copyright © 2020 Antoine Subra. All rights reserved.
//

import UIKit

class ListMediaViewController: UIViewController {
  var presenter: ListMediaPresenterInput!
  
  @IBOutlet weak var collectionview: UICollectionView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let configurator = ListMediaConfigurator()
    configurator.configure(viewController: self)
    presenter.viewDidLoad()
  }
}

extension ListMediaViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return presenter.numberOfRow()
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: "mediasCell", for: indexPath) as? MediaCollectionViewCell {
      presenter.showMedias(cell: cell, index: indexPath)
      return cell
    }
    return UICollectionViewCell()
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    let squareWidth = view.frame.width - 20
    return CGSize(width: squareWidth, height: squareWidth)
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
  }
}

extension ListMediaViewController: ListMediaPresenterOutput {
  func reloadData() {
    collectionview.reloadData()
  }
}
