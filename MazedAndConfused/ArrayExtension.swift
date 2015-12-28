//
//  ArrayExtension.swift
//  MazedAndConfused
//
//  Created by B.J. Ray on 12/28/15.
//  Copyright © 2015 Just My Org. All rights reserved.
//

import Foundation
extension Array {
  
  func sample() -> Element {
    let index = arc4random_uniform(UInt32(self.count))
    return self[Int(index)]
  }
}
