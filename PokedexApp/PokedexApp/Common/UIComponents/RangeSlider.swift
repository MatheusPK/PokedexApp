//
//  RangeSlider.swift
//  PokedexApp
//
//  Created by Matheus P.K on 29/08/22.
//

import Foundation
import UIKit


class RangeSlider: UIView {
    let minValue: CGFloat
    let maxValue: CGFloat
    var currentLeftValue: CGFloat {
        didSet {
            leftToggleValueIndicator.text = String(format: "%.0f", currentLeftValue)
        }
    }
    var currentRightValue: CGFloat {
        didSet {
            rightToggleValueIndicator.text = String(format: "%.0f", currentRightValue)
        }
    }
    
    var leftToggleOffsetConstraint: NSLayoutConstraint? = nil
    var rightToggleOffsetConstraint: NSLayoutConstraint? = nil
    
    let leftToggle: CustomToggleButton = {
        let toggle = CustomToggleButton()
        toggle.translatesAutoresizingMaskIntoConstraints = false
        return CustomToggleButton()
    }()
    
    let leftToggleValueIndicator: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = K.FONTS.POKEMON_TYPE
        label.textColor = K.COLORS.TEXT.GREY
        return label
    }()
    
    let rightToggle: CustomToggleButton = {
        let toggle = CustomToggleButton()
        toggle.translatesAutoresizingMaskIntoConstraints = false
        return CustomToggleButton()
    }()
    
    let rightToggleValueIndicator: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = K.FONTS.POKEMON_TYPE
        label.textColor = K.COLORS.TEXT.GREY
        return label
    }()
    
    let sliderBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = K.COLORS.BACKGROUND.DEFAULT_INPUT
        view.layer.cornerRadius = 2
        return view
    }()
    
    let rangeBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = K.COLORS.TYPE.PSYCHIC
        view.layer.cornerRadius = 2
        return view
    }()
    
    init(minValue: CGFloat, maxValue: CGFloat) {
        self.minValue = minValue
        self.maxValue = maxValue
        self.currentLeftValue = minValue
        self.currentRightValue = maxValue
        super.init(frame: .zero)
        setup()
        addNumberRangeDragGestureRecoginzer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addNumberRangeDragGestureRecoginzer() {
        let leftToggleGesture = UIPanGestureRecognizer(target: self, action: #selector(leftDragSlider))
        let rightToggleGesture = UIPanGestureRecognizer(target: self, action: #selector(rightDragSlider))
        leftToggle.addGestureRecognizer(leftToggleGesture)
        rightToggle.addGestureRecognizer(rightToggleGesture)
    }
    
    @objc func leftDragSlider(_ sender: UIPanGestureRecognizer) {
        guard let targetView = sender.view else { return }
        let translation = sender.translation(in: targetView)
        
        let newX = targetView.frame.maxX + translation.x
        let rangeToSize = sliderBar.frame.width - 2 * targetView.frame.width
        let rangeStep = (maxValue - minValue) / rangeToSize
        let currentStep = (newX - targetView.frame.width) * rangeStep
        
        if newX > sliderBar.frame.minX + targetView.frame.width, newX < rightToggle.frame.minX {
            leftToggleOffsetConstraint?.constant += translation.x
            currentLeftValue = floor(currentStep)
        }
        sender.setTranslation(CGPoint.zero, in: self)
    }
    
    @objc func rightDragSlider(_ sender: UIPanGestureRecognizer) {
        guard let targetView = sender.view else { return }
        let translation = sender.translation(in: targetView)
        
        let newX = targetView.frame.minX + translation.x
        let rangeToSize = sliderBar.frame.width - 2 * targetView.frame.width
        let rangeStep = (maxValue + 2 - minValue) / rangeToSize
        let currentStep = (newX - targetView.frame.width) * rangeStep
        
        if newX < sliderBar.frame.maxX - targetView.frame.width, newX > leftToggle.frame.maxX  {
            rightToggleOffsetConstraint?.constant += translation.x
            currentRightValue = ceil(currentStep)
        }
        sender.setTranslation(CGPoint.zero, in: self)
    }
    
}

extension RangeSlider: ViewCode {
    func setupComponents() {
        leftToggle.addSubview(leftToggleValueIndicator)
        rightToggle.addSubview(rightToggleValueIndicator)
        sliderBar.addSubview(rangeBar)
        sliderBar.addSubview(leftToggle)
        sliderBar.addSubview(rightToggle)
        addSubview(sliderBar)
    }
    
    func setupConstraints() {
        setupContentView()
        setupSliderBar()
        setupToggles()
        setupRangeBar()
        setupTogglesLabels()
    }
    
    func setupExtraConfiguration() {
        leftToggleValueIndicator.text = String(format: "%.0f", currentLeftValue)
        rightToggleValueIndicator.text = String(format: "%.0f", currentRightValue)
    }
    
    private func setupContentView() {
        heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func setupSliderBar() {
        NSLayoutConstraint.activate([
            sliderBar.leftAnchor.constraint(equalTo: leftAnchor),
            sliderBar.rightAnchor.constraint(equalTo: rightAnchor),
            sliderBar.centerYAnchor.constraint(equalTo: centerYAnchor),
            sliderBar.heightAnchor.constraint(equalToConstant: 4),
        ])
    }
    
    private func setupToggles() {
        leftToggleOffsetConstraint = leftToggle.leftAnchor.constraint(equalTo: sliderBar.leftAnchor)
        rightToggleOffsetConstraint = rightToggle.rightAnchor.constraint(equalTo: sliderBar.rightAnchor)
        NSLayoutConstraint.activate([
            leftToggleOffsetConstraint!,
            leftToggle.centerYAnchor.constraint(equalTo: sliderBar.centerYAnchor),
            rightToggleOffsetConstraint!,
            rightToggle.centerYAnchor.constraint(equalTo: sliderBar.centerYAnchor)
        ])
    }
    
    private func setupTogglesLabels() {
        NSLayoutConstraint.activate([
            leftToggleValueIndicator.topAnchor.constraint(equalTo: leftToggle.bottomAnchor, constant: 10),
            leftToggleValueIndicator.centerXAnchor.constraint(equalTo: leftToggle.centerXAnchor),
            rightToggleValueIndicator.topAnchor.constraint(equalTo: rightToggle.bottomAnchor, constant: 10),
            rightToggleValueIndicator.centerXAnchor.constraint(equalTo: rightToggle.centerXAnchor)
        ])
    }
    
    private func setupRangeBar() {
        NSLayoutConstraint.activate([
            rangeBar.leftAnchor.constraint(equalTo: leftToggle.leftAnchor),
            rangeBar.rightAnchor.constraint(equalTo: rightToggle.rightAnchor),
            rangeBar.centerYAnchor.constraint(equalTo: sliderBar.centerYAnchor),
            rangeBar.heightAnchor.constraint(equalTo: sliderBar.heightAnchor)
        ])
    }
    
}
