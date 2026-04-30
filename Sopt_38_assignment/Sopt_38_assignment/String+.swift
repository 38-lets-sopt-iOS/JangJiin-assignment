//
//  String+.swift
//  Sopt_38_assignment
//
//  Created by 장지인 on 4/30/26.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        let regularExpression =
        "^[A-Z0-9a-z._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,}$"

        let predicate =
        NSPredicate(format: "SELF MATCHES %@", regularExpression)

        return predicate.evaluate(with: self)
    }
    var isValidPW: Bool {
            let regularExpression =
            "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[^A-Za-z0-9]).{10,}$"

            let predicate = NSPredicate(format: "SELF MATCHES %@",regularExpression)

            return predicate.evaluate(with: self)
        }
}
