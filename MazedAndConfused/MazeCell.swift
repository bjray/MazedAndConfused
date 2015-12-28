//
//  MazeCell.swift
//  MazedAndConfused
//
//  Created by B.J. Ray on 12/28/15.
//  Copyright © 2015 Just My Org. All rights reserved.
//

import Foundation

public class MazeCell {
  var row: Int = 0
  var column: Int = 0
  var north, south, east, west: MazeCell?
  var key: String
  
  var links = Dictionary<String, Bool>()
  
  
  init(row: Int, col: Int) {
    self.row = row
    self.column = col
    self.key = "\(col)|\(row)"
  }
  
  
  func link(aCell: MazeCell, bidi: Bool = true) {
    self.links.updateValue(bidi, forKey: aCell.key)
    //    print("Linking \(aCell.key) to me (\(key))")
    if bidi {
      aCell.link(self, bidi: false)
    }
  }
  
  func unlink(aCell: MazeCell, bidi: Bool = true) {
    self.links.removeValueForKey(aCell.key)
    //    print("Unlinking \(aCell.key) from me (\(key))")
    if bidi {
      aCell.unlink(self, bidi: false)
    }
  }
  
  func isLinkedToCell(aCell:MazeCell) -> Bool {
    return links[aCell.key] != nil
  }
  
  func neighbors() -> Array<MazeCell> {
    var myNeighbors = [MazeCell]()
    
    if let aCell:MazeCell = north {
      myNeighbors.append(aCell)
    }
    
    if let aCell:MazeCell = south {
      myNeighbors.append(aCell)
    }
    
    if let aCell:MazeCell = east {
      myNeighbors.append(aCell)
    }
    
    if let aCell:MazeCell = west {
      myNeighbors.append(aCell)
    }
    return myNeighbors
  }
  
  func describe() -> String {
    var result = ""
    result += "Cell \(key)"
    return result
  }
}