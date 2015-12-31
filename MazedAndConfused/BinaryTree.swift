//
//  BinaryTree.swift
//  MazedAndConfused
//
//  Created by B.J. Ray on 12/28/15.
//  Copyright © 2015 Just My Org. All rights reserved.
//

import Foundation

public class BinaryTree {
  public var maze: MazeGrid
  
  public init(aGrid: MazeGrid) {
    aGrid.eachCell { (aCell) -> Void in
      var neighbors = [MazeCell]()
      
      if aCell.north != nil {
        neighbors.append(aCell.north!)
      }
      if aCell.east != nil {
        neighbors.append(aCell.east!)
      }
      
      if neighbors.count > 0 {
        let neighbor = neighbors.sample()
        aCell.link(neighbor)
      }
      
    }
    maze = aGrid
  }
}