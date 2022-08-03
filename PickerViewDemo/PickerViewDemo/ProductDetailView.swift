//
//  ProductDetailView.swift
//  PickerViewDemo
//
//  Created by 이원빈 on 2022/07/27.
//

import UIKit

class ProductDetailView: UIView {
    let mainScrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var mainStackView: UIStackView = {
        var stackview = UIStackView(arrangedSubviews: [horizontalScrollView,
                                                       productNameTextField,
                                                       priceStackView,
                                                       productDiscountedPriceTextField,
                                                       productStockTextField,
                                                       descriptionTextView])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.distribution = .fill
        stackview.alignment = .fill
        stackview.spacing = 10
        return stackview
    }()
    
    let horizontalScrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var horizontalStackView: UIStackView = {
        var stackview = UIStackView(arrangedSubviews: [testImage1,
                                                       testImage2,
                                                       testImage3,
                                                       testImage4,
                                                       testImage5,
                                                       testImage6])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.distribution = .fill
        stackview.alignment = .fill
        stackview.spacing = 10
        return stackview
    }()
    
    let testImage1: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "chevron.right")
        image.backgroundColor = .lightGray
        image.widthAnchor.constraint(equalToConstant: 100).isActive = true
        image.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return image
    }()
    
    let testImage2: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "chevron.right")
        image.backgroundColor = .lightGray
        image.widthAnchor.constraint(equalToConstant: 100).isActive = true
        image.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return image
    }()
    
    let testImage3: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "chevron.right")
        image.backgroundColor = .lightGray
        image.widthAnchor.constraint(equalToConstant: 100).isActive = true
        image.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return image
    }()
    
    let testImage4: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "chevron.right")
        image.backgroundColor = .lightGray
        image.widthAnchor.constraint(equalToConstant: 100).isActive = true
        image.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return image
    }()
    
    let testImage5: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "chevron.right")
        image.backgroundColor = .lightGray
        image.widthAnchor.constraint(equalToConstant: 100).isActive = true
        image.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return image
    }()
    
    let testImage6: UIButton = {
        var uibutton = UIButton()
        uibutton.translatesAutoresizingMaskIntoConstraints = false
        uibutton.backgroundColor = .lightGray
        uibutton.setImage(UIImage(systemName: "plus"), for: .normal)
        uibutton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        uibutton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return uibutton
    }()
    
    let productNameTextField: UITextField = {
        var textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = " 상품명"
        textfield.heightAnchor.constraint(equalToConstant: 35).isActive = true
        textfield.layer.borderColor = UIColor.lightGray.cgColor
        textfield.layer.borderWidth = 1
        textfield.layer.cornerRadius = 2
        return textfield
    }()
    
    lazy var priceStackView: UIStackView = {
        var stackview = UIStackView(arrangedSubviews: [productPriceTextField,
                                                       currencySegmentControl])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.distribution = .fillProportionally
        stackview.alignment = .fill
        stackview.spacing = 10
        return stackview
    }()
    
    let productPriceTextField: UITextField = {
        var textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = " 상품가격"
        textfield.heightAnchor.constraint(equalToConstant: 35).isActive = true
        textfield.widthAnchor.constraint(equalToConstant: 260).isActive = true
        textfield.layer.borderColor = UIColor.lightGray.cgColor
        textfield.layer.borderWidth = 1
        textfield.layer.cornerRadius = 2
        return textfield
    }()
    
    let currencySegmentControl: UISegmentedControl = {
        var segment = UISegmentedControl(items: ["KRW","USD"])
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    let productDiscountedPriceTextField: UITextField = {
        var textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = " 할인금액"
        textfield.heightAnchor.constraint(equalToConstant: 35).isActive = true
        textfield.layer.borderColor = UIColor.lightGray.cgColor
        textfield.layer.borderWidth = 1
        textfield.layer.cornerRadius = 2
        return textfield
    }()
    
    let productStockTextField: UITextField = {
        var textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = " 재고수량"
        textfield.heightAnchor.constraint(equalToConstant: 35).isActive = true
        textfield.layer.borderColor = UIColor.lightGray.cgColor
        textfield.layer.borderWidth = 1
        textfield.layer.cornerRadius = 2
        return textfield
    }()
    
    let descriptionTextView: UITextView = {
        var textview = UITextView()
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.text = "asdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjklasdfjl;aksasdfasdfasdfasdfasdjfklas;dfjkl"
        textview.isScrollEnabled = false
        textview.font = UIFont.preferredFont(forTextStyle: .title2)
        return textview
    }()
    
    var rootViewController: UIViewController?
    
    init(_ rootViewController: UIViewController) {
        super.init(frame: .null)
        self.rootViewController = rootViewController
        
        rootViewController.view.addSubview(mainScrollView)
        mainScrollView.addSubview(mainStackView)
        horizontalScrollView.addSubview(horizontalStackView)
        
        let frameLayoutConstraints = mainStackView.heightAnchor.constraint(equalTo: mainScrollView.frameLayoutGuide.heightAnchor)
        frameLayoutConstraints.priority = UILayoutPriority(rawValue: UILayoutPriority.defaultLow.rawValue)
        
        let frameLayoutConstraints2 = horizontalStackView.widthAnchor.constraint(equalTo: horizontalScrollView.frameLayoutGuide.widthAnchor)
        frameLayoutConstraints2.priority = UILayoutPriority(rawValue: UILayoutPriority.defaultLow.rawValue)
        
        NSLayoutConstraint.activate([
            mainScrollView.topAnchor.constraint(equalTo: rootViewController.view.safeAreaLayoutGuide.topAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: rootViewController.view.safeAreaLayoutGuide.bottomAnchor),
            mainScrollView.leadingAnchor.constraint(equalTo: rootViewController.view.safeAreaLayoutGuide.leadingAnchor),
            mainScrollView.trailingAnchor.constraint(equalTo: rootViewController.view.safeAreaLayoutGuide.trailingAnchor),
            
            frameLayoutConstraints,
            mainStackView.topAnchor.constraint(equalTo: mainScrollView.contentLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: mainScrollView.contentLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: mainScrollView.contentLayoutGuide.leadingAnchor, constant: 10),
            mainStackView.trailingAnchor.constraint(equalTo: mainScrollView.contentLayoutGuide.trailingAnchor, constant: -10),
            mainStackView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor, constant: -20),
            
            horizontalScrollView.heightAnchor.constraint(equalToConstant: 100),
            horizontalScrollView.topAnchor.constraint(equalTo: mainStackView.topAnchor),
            horizontalScrollView.bottomAnchor.constraint(equalTo: productNameTextField.topAnchor, constant: -10),
            horizontalScrollView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            horizontalScrollView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            
            horizontalStackView.topAnchor.constraint(equalTo: horizontalScrollView.contentLayoutGuide.topAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: horizontalScrollView.contentLayoutGuide.bottomAnchor),
            horizontalStackView.heightAnchor.constraint(equalTo: horizontalScrollView.heightAnchor),
            horizontalStackView.leadingAnchor.constraint(equalTo: horizontalScrollView.contentLayoutGuide.leadingAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: horizontalScrollView.contentLayoutGuide.trailingAnchor),
            frameLayoutConstraints2
            
        ])
        
        testImage1.isHidden = true
        testImage2.isHidden = true
        testImage3.isHidden = true
        testImage4.isHidden = true
        testImage5.isHidden = true
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// scroll view 제약 주는 법
// 일단 제일 기본 view 위에 scrollview 를 얹어준다
// scrollview 위에 어느 뷰를 추가하고, 그 뷰를 stackview 라 가정
// stackview 의 top, bottom, leading, trailing는 scrollview와 contentLayoutGuide로 맞춤
// stackview 의 width 를 scroll과 비슷하게 맞춤
// 여기서 관건 , frameLayoutGuide와 맞추는 제약 height 를 같게 만드는데, priority를 낮춰준다 !
