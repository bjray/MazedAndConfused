//
//  BSDGenerator.swift
//  MazedAndConfused
//
//  Created by B.J. Ray on 1/18/16.
//  Copyright © 2016 Just My Org. All rights reserved.
//

import Foundation
import GameplayKit

class BSDGenerator {
  
  
  
//  func splitSegment(parentSegment: DungeonSegment) -> (DungeonSegment,DungeonSegment)? {
//    var round = 0
//    print("Beginning round \(round) with \(parentSegment.name()).")
//    let vSplit: Int = splitLocation(parentSegment.height, padding: padding, minCellLength: minCellHeight)
//    let hSplit: Int = splitLocation(parentSegment.width, padding: padding, minCellLength: minCellWidth)
//    let useVSplit = GKRandomDistribution(lowestValue: 0, highestValue: 1).nextBool()
//    var splits: (segmentA: DungeonSegment,segmentB: DungeonSegment)?
//    
//    
//    if vSplit >= 0 && hSplit >= 0 {
//      if useVSplit {
//        splits = splitSegmentVertically(parentSegment, splitLocation: vSplit)
//        print("splitting vertically at \(vSplit) and creating \(splits!.segmentA.name()) and \(splits!.segmentB.name()).")
//      } else {
//        splits = splitSegmentHorizontally(parentSegment, splitLocation: hSplit)
//        print("splitting horizontally at \(hSplit) and creating \(splits!.segmentA.name()) and \(splits!.segmentB.name()).")
//      }
//    } else if vSplit < 0 && hSplit > 0 {
//      splits = splitSegmentHorizontally(parentSegment, splitLocation: hSplit)
//      print("splitting horizontally at \(hSplit) and creating \(splits!.segmentA.name()) and \(splits!.segmentB.name()).")
//    } else if vSplit > 0 && hSplit < 0{
//      splits = splitSegmentVertically(parentSegment, splitLocation: vSplit)
//      print("splitting vertically at \(vSplit) and creating \(splits!.segmentA.name()) and \(splits!.segmentB.name()).")
//    } else {
//      print("Can't split any further")
//    }
//    
//    round++
//    print("Ending round \(round).")
//    
//    if splits != nil {
//      parentSegment.segmentA = splits!.segmentA
//      parentSegment.segmentB = splits!.segmentB
//    }
//    
//    return splits
//  }
  
  func splitLocation(segementLength:Int, padding:Int, minCellLength:Int) -> Int {
    let min = 2 * padding + minCellLength
    let max = segementLength - min
    var result:Int
    
    if max >= min {
      result = GKRandomDistribution(lowestValue: min, highestValue: max).nextInt()
      print("Min: \(min) to max: \(max) with a split location at \(result).")
    } else {
      print("Unable to split segment length \(segementLength).")
      result = -1
    }
    
    return result
  }
  
  func splitSegmentVertically(parent:DungeonSegment, splitLocation:Int) -> (segmentA: DungeonSegment, segmentB: DungeonSegment) {
    let segmentA = DungeonSegment(x: parent.x, y: parent.y, width: parent.width, height: splitLocation, segmentId: "A")
    let segmentB = DungeonSegment(x: parent.x, y: parent.y + splitLocation, width: parent.width, height: parent.height - splitLocation, segmentId: "B")
    
    segmentA.parent = parent
    segmentB.parent = parent
    
    return (segmentA, segmentB)
  }
  
  func splitSegmentHorizontally(parent:DungeonSegment, splitLocation:Int) -> (segmentA: DungeonSegment, segmentB: DungeonSegment) {
    let segmentA = DungeonSegment(x: parent.x, y: parent.y, width: splitLocation, height: parent.height, segmentId: "A")
    let segmentB = DungeonSegment(x: parent.x + splitLocation, y: parent.y, width: parent.width - splitLocation, height: parent.height, segmentId: "B")
    
    segmentA.parent = parent
    segmentB.parent = parent
    
    return (segmentA, segmentB)
  }

}


//Example

//let area = Segment(x: 0, y: 0, width: 40, height: 100, segmentId: "_")
//let dungeon = BSDGenerator()
//
//func myTest(parentSegment: Segment) {
//  print("\n=========================")
//  let segPair = dungeon.splitSegment(parentSegment)
//  if (segPair != nil) {
//    print("Successfully split \(parentSegment.name()).")
//    let segA = segPair!.0
//    let segB = segPair!.1
//    myTest(segA)
//    myTest(segB)
//  } else {
//    print("area \(parentSegment.name()) can not be split anymore.")
//  }
//  
//}