//
//  MediaDetailViewController.swift
//  Enagram
//
//  Created by Perso on 20/07/2020.
//  Copyright © 2020 Antoine Subra. All rights reserved.
//

import UIKit

class MediaDetailViewController: UIViewController {
  var presenter: MediaDetailPresenterInput!
  private var numberOfPages: Int = 0
  private var currentIndex = 0
  
  private lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.isPagingEnabled = true
    scrollView.delegate = self
    return scrollView
  }()
  
  private var stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .horizontal
    return stackView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Enagram"
    presenter.viewDidLoad()
    view.backgroundColor = .white
    setupViews()
  }
  
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (nil) in
      let offset = CGFloat(self.currentIndex) * size.width
      self.scrollView.setContentOffset(CGPoint(x: offset, y: 0), animated: false)
    }
  }
  
  private func setupViews() {
    view.addSubview(scrollView)
    scrollView.addSubview(stackView)
    setupLayout()
  }
  
  func setupLayout() {
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: view.topAnchor),
      scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      
      stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      stackView.heightAnchor.constraint(equalTo: view.heightAnchor)
    ])
  }
}

extension MediaDetailViewController: MediaDetailPresenterOutput {
  func display(media: MediaModelView, index: Int, max: Int) {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = media.image
    imageView.contentMode = .scaleAspectFit
  
    stackView.addArrangedSubview(imageView)
    
    NSLayoutConstraint.activate([
      imageView.widthAnchor.constraint(equalTo: view.widthAnchor),
      imageView.heightAnchor.constraint(equalTo: view.heightAnchor)
    ])
  
    numberOfPages = max
  }
}

extension MediaDetailViewController: UIScrollViewDelegate {
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    let index = Int(scrollView.contentOffset.x / scrollView.bounds.size.width)
    currentIndex = index
//    numberPage.text = String(format: "%i/%i", index, numberOfPages)
  }
}


