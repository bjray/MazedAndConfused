//
//  Sidewinder.swift
//  MazedAndConfused
//
//  Created by B.J. Ray on 12/28/15.
//  Copyright © 2015 Just My Org. All rights reserved.
//

import Foundation
import GameplayKit

public class Sidewinder {
  var maze: MazeGrid
  
  init(aGrid: MazeGrid) {
    aGrid.eachRow { (aRow) -> Void in
      var run = [MazeCell]()
      
      for aCell in aRow {
        run.append(aCell)
        let atEasternBoundary = (aCell.east == nil)
        let atNorthernBoundary = (aCell.north == nil)
        let index = GKRandomDistribution(lowestValue: 0, highestValue: 1).nextInt()
        let shouldCloseOut = atEasternBoundary || (!atNorthernBoundary && index == 0)
        if shouldCloseOut {
          
          let aMember = run.sample()
          if let northCell: MazeCell = aMember.north {
            aMember.link(northCell)
          }
          run.removeAll()
        } else {
          //eastern cell...
          aCell.link(aCell.east!)
        }
      }
    }
    maze = aGrid
  }
}