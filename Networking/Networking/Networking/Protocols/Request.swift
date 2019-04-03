//
//  Request.swift
//  Networking
//
//  Created by Amaan on 4/2/19.
//  Copyright © 2019 FaizanEllahi. All rights reserved.
//

import Foundation
import Alamofire


protocol Request {

    func validate(validationType: ValidationType)
}


