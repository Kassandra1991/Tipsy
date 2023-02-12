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
        label.textColor = .lightGray
        label.font.withSize(Constants.labelSize)
        label.text = "Enter bill total"
        return label
    }()
    
    private lazy var enterAmountTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "e.g. 123.56"
        tf.textAlignment = .center
        tf.font = UIFont.systemFont(ofSize: 40, weight: .regular)
        tf.minimumFontSize = Constants.minTFSize
        tf.textColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
        return tf
    }()
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.contentMode = .scaleToFill
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = Constants.spasingStackView
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var selectTipLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font.withSize(Constants.labelSize)
        label.text = "Select tip"
        return label
    }()
    
    private lazy var procentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 0
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private lazy var chooseSplitLabel: UILabel = {
        let label = UILabel()
        label.tintColor = .lightGray
        label.font.withSize(Constants.labelSize)
        label.text = "Choose Split"
        return label
    }()
    
    private lazy var stepperStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 27
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    private let zeroProcentButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: .regular)
        button.setTitleColor(#colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1), for: .normal)
        button.setTitle("0%", for: .normal)
        return button
    }()

    private let tenProcentButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: .regular)
        button.setTitleColor(#colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1), for: .normal)
        button.setTitle("10%", for: .normal)
        return button
    }()
    
    private let twentyProcentButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: .regular)
        button.setTitleColor(#colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1), for: .normal)
        button.setTitle("20%", for: .normal)
        return button
    }()
    
    private lazy var stepperLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 35, weight: .regular)
        label.textColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
        label.textAlignment = .center
        label.text = "2"
        return label
    }()
    
    private lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        return stepper
    }()
    
    private let calculateButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: .regular)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Calculate", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
//        view.backgroundColor = .blue
//        stackView.backgroundColor = .green
//        enterBillTotalLabel.backgroundColor = .yellow
//        enterAmountTextField.backgroundColor = .gray
//        mainView.backgroundColor = .orange
//        mainStackView.backgroundColor = .yellow
//        selectTipLabel.backgroundColor = .brown
//        procentStackView.backgroundColor = .black
//        chooseSplitLabel.backgroundColor = .yellow
//        stepperStackView.backgroundColor = .black
    }

    private func setupViews() {
        view.addSubview(stackView)
        view.addSubview(mainView)
        view.addSubview(calculateButton)
        stackView.addArrangedSubview(enterBillTotalLabel)
        stackView.addArrangedSubview(enterAmountTextField)
        mainView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(selectTipLabel)
        mainStackView.addArrangedSubview(procentStackView)
        mainStackView.addArrangedSubview(chooseSplitLabel)
        mainStackView.addArrangedSubview(stepperStackView)
        procentStackView.addArrangedSubview(zeroProcentButton)
        procentStackView.addArrangedSubview(tenProcentButton)
        procentStackView.addArrangedSubview(twentyProcentButton)
        stepperStackView.addArrangedSubview(stepperLabel)
        stepperStackView.addArrangedSubview(stepper)
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
            enterBillTotalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            enterBillTotalLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -50),
            enterBillTotalLabel.heightAnchor.constraint(equalToConstant: 30.0)
            ])
        enterAmountTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            enterBillTotalLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            enterBillTotalLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            enterAmountTextField.heightAnchor.constraint(equalToConstant: 48.0)
            ])
        mainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40.0)
        ])
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20.0),
            mainStackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20.0),
            mainStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20.0)
        ])
        selectTipLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            selectTipLabel.heightAnchor.constraint(equalToConstant: 30.0),
            selectTipLabel.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 30.0),
            selectTipLabel.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -30.0)
            ])
        procentStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            procentStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            procentStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor)
        ])
        chooseSplitLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chooseSplitLabel.heightAnchor.constraint(equalToConstant: 30.0),
            chooseSplitLabel.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 30.0),
            chooseSplitLabel.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -30.0)
            ])
        zeroProcentButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            zeroProcentButton.heightAnchor.constraint(equalToConstant: 54),
            zeroProcentButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 60)
        ])
        tenProcentButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tenProcentButton.heightAnchor.constraint(equalToConstant: 54),
        ])
        twentyProcentButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            twentyProcentButton.heightAnchor.constraint(equalToConstant: 54),
        ])
        stepperLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stepperLabel.heightAnchor.constraint(equalToConstant: 29),
            stepperLabel.widthAnchor.constraint(equalToConstant: 93)
        ])
        stepper.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stepper.heightAnchor.constraint(equalToConstant: 29),
            stepper.widthAnchor.constraint(equalToConstant: 94)
        ])
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            calculateButton.heightAnchor.constraint(equalToConstant: 54),
            calculateButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 200)
            ])
    }
}

