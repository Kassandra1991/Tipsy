//
//  ViewController.swift
//  Tipsy
//
//  Created by Aleksandra Asichka on 2023-02-10.
//

import UIKit

class ViewController: UIViewController {
    
    enum Constants {
        static let labelSize = 25.0
        static let tfSize = 40.0
        static let minTFSize = 17.0
        static let spasingStackView = 26.0
    }
    
    private lazy var  stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = Constants.spasingStackView
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var enterBillTotalLabel: UILabel = {
        let label = UILabel()
        label.tintColor = .lightGray
        label.font.withSize(Constants.labelSize)
        label.text = "Enter bill total"
        return label
    }()
    
    private lazy var enterAmountTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "e.g. 123.56"
        tf.textAlignment = .center
        tf.font?.withSize(Constants.tfSize)
        tf.minimumFontSize = Constants.minTFSize
        tf.tintColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
        return tf
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }

    private func setupViews() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(enterBillTotalLabel)
        stackView.addArrangedSubview(enterAmountTextField)
    }

    private func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        enterBillTotalLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            enterBillTotalLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 50),
            enterBillTotalLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -50),
            enterBillTotalLabel.heightAnchor.constraint(equalToConstant: 30.0)
            ])
        enterAmountTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            enterBillTotalLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            enterBillTotalLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            enterAmountTextField.heightAnchor.constraint(equalToConstant: 48.0)
            ])
    }
}

