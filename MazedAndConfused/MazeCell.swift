//
//  MazeCell.swift
//  MazedAndConfused
//
//  Created by B.J. Ray on 12/28/15.
//  Copyright © 2015 Just My Org. All rights reserved.
//

import Foundation

public class MazeCell {
  public var row: Int = 0
  public var column: Int = 0
  public var north, south, east, west: MazeCell?
  public var key: String
  
  public var links = Dictionary<String, Bool>()
  
  
  public init(row: Int, col: Int) {
    self.row = row
    self.column = col
    self.key = "\(col)|\(row)"
  }
  
  
  public func link(aCell: MazeCell, bidi: Bool = true) {
    self.links.updateValue(bidi, forKey: aCell.key)
    //    print("Linking \(aCell.key) to me (\(key))")
    if bidi {
      aCell.link(self, bidi: false)
    }
  }
  
  public func unlink(aCell: MazeCell, bidi: Bool = true) {
    self.links.removeValueForKey(aCell.key)
    //    print("Unlinking \(aCell.key) from me (\(key))")
    if bidi {
      aCell.unlink(self, bidi: false)
    }
  }
  
  public func isLinkedToCell(aCell:MazeCell) -> Bool {
    return links[aCell.key] != nil
  }
  
  public func neighbors() -> Array<MazeCell> {
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
  
  public func describe() -> String {
    var result = ""
    result += "Cell \(key)"
    return result
  }
}