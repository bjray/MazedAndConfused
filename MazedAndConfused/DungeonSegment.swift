//
//  DungeonSegment.swift
//  MazedAndConfused
//
//  Created by B.J. Ray on 1/18/16.
//  Copyright © 2016 Just My Org. All rights reserved.
//

import Foundation

class DungeonSegment {
  let x, y, width, height: Int
  var segmentA: DungeonSegment?
  var segmentB: DungeonSegment?
  var parent: DungeonSegment? {
    didSet {
      self.level = parent!.level + 1
    }
  }
  var level: Int
  var segmentId: String
  
  init(x:Int, y:Int, width:Int, height: Int, segmentId: String) {
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.segmentId = segmentId
    self.level = 0
  }
  
  func hasChildren() -> Bool {
    if segmentA != nil && segmentB != nil {
      return true
    } else {
      return false
    }
  }
  
  func describe() -> String {
    return "Origin: (\(x),\(y)), width: \(width), height: \(height) "
  }
  
  func name() -> String {
    var myName = ""
    if let pName:String = self.parent?.name() {
      myName += pName + "-"
    }
    myName += "\(self.segmentId)\(self.level)"
    return myName
  }
  
}
