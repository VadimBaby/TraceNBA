//
//  UINavigationController.swift
//  TraceNBA
//
//  Created by Вадим Мартыненко on 14.11.2023.
//

import Foundation
import SwiftUI

extension UINavigationController { // now we can drag back our custom nav bar
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}
