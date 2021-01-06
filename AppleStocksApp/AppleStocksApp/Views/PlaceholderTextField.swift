//
//  PlaceholderTextField.swift
//  AppleStocksApp
//
//  Created by Kristina Motte on 1/6/21.
//

import SwiftUI

struct PlaceholderTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}
