//
//  main.swift
//  3_28_李胜欣_最小生成树的应用：室内布线
//
//  Created by seingshinlee on 2018/6/1.
//  Copyright © 2018年 3_28_李胜欣_最小生成树的应用：室内布线. All rights reserved.
//

import Foundation

/// 全局变量
// ⚠️创建一间房子的实例，房子1 -> 填0，房子2 -> 填1，······
let myRoom = myRoomGroups(0)
// ⚠️创建一个门的实例，门角的数组集合1 -> 填0，门角的数组集合2 -> 填1，······
let myPointOfDoorSets = myPointOfDoorGroups(0, myRoom)
// ⚠️创建一组插座的数组集合，一组插座的数组集合1 -> 填0，一组插座的数组集合2 -> 填1，······
let myOutletSets = myOutletSetsGroups(0, myRoom)
// 创建一个以所有的插座为顶点构成的无向完全图的实例
var myGraph = Graph<Int>()
// 判断门当前的位置
var myPositionOfDoor: Int

/// 辅助全局变量
// <- findAcrossLowcost(_:_:_:_:_:_:)
// 四条墙边上的临时插座，[1-2]->temp1，[2-4]->temp2，[1-3]->temp3，[3-4]->temp4
var temp1, temp2, temp3, temp4: Outlet
// 墙边上的临时插座与其他插座的最短布线长度，
var cost1, cost2, cost3, cost4: Double
// <- findAcrossLowcost(_:_:_:_:_:_:) <- ()
temp1 = myOutletSets[0]
temp2 = myOutletSets[0]
temp3 = myOutletSets[0]
temp4 = myOutletSets[0]

// 不合法插座坐标输入检测代码
for index in myOutletSets.enumerated() {

    // 插座在门上
    if ((myPointOfDoorSets[0].x < index.element.x && index.element.x < myPointOfDoorSets[3].x) ||
        (myPointOfDoorSets[0].y < index.element.y && index.element.y < myPointOfDoorSets[3].y)) &&
        (myPointOfDoorSets[0].z < index.element.z && index.element.z < myPointOfDoorSets[3].z) {
        print("❌插座坐标\(index.offset + 1)不合法，导致插座出现在门上，请重新修改，再编译程序\n")
    }

    // 插座坐标出现负值
    if index.element.x < 0 || index.element.y < 0 || index.element.z < 0 {
        print("❌出现负值，请重新修改原来插座\(index.offset + 1)的坐标的值，覆盖原来的值，再继续编译程序\n")
    }

    // 插座坐标在坐标平面上但超出范围
    if index.element.x > myRoom.lengthOfRoom || index.element.y > myRoom.widthOfRoom || index.element.z > myRoom.heightOfRoom {
        print("❌超出范围，请重新修改原来插座\(index.offset + 1)的坐标的值，覆盖原来的值，再继续编译程序\n")
    }

    // 插座坐标不在在坐标平面上
    if index.element.x != 0 &&
        index.element.y != 0 &&
        index.element.z != 0 &&
        index.element.x != myRoom.lengthOfRoom &&
        index.element.y != myRoom.widthOfRoom  &&
        index.element.z != myRoom.heightOfRoom {
        print("❌该插座\(index.offset + 1)坐标不在墙的任何一面，请终止程序修改原来插座\(index.offset + 1)的坐标的值，再编译程序\n")
        break
    }
}

// 判断门的位置,并输出到控制台
myPositionOfDoor = judgePositionOfDoor(myPointOfDoorSets[0], myPointOfDoorSets[1], myPointOfDoorSets[2], myRoom)!
if myPositionOfDoor == 1 {
    print("########## 第四步：门在墙[1] ###########\n")
} else if myPositionOfDoor == 2 {
    print("########## 第四步：门在墙[2] ###########\n")
} else if myPositionOfDoor == 3 {
    print("########## 第四步：门在墙[3] ###########\n")
} else {
    print("########## 第四步：门在墙[4] ###########\n")
}


print("########## 第五步：任意两插座的最短布线 #########")
print("--------------------------------------------------------------------------------------┐")
// 下三角邻接矩阵
for firstIndex in myOutletSets.enumerated() {
    for secondIndex in myOutletSets.enumerated() {

        // 去掉上三角和自身部分
        if firstIndex.offset >= secondIndex.offset {
            continue
        }

        // 求得两个插座之间所有权值中最小的权值
        if isTogether(firstIndex.element, secondIndex.element, myRoom) == true {
            let cost = findTogetherLowcost(firstIndex.element, secondIndex.element, myPointOfDoorSets[0], myPointOfDoorSets[1], myPointOfDoorSets[2], myRoom)
            print("""
                   ________                                                                           │
                  /│      /│     ┌------┐                                                             │
                 /#│_____/ │     │ .    │                                                             │
                │##│____│__│ --> │   .  │ --> \(cost)
                │#/     │ /      └------┘                                                             │
                │/______│/                                                                            │
                插座[\(firstIndex.offset + 1)]-插座[\(secondIndex.offset + 1)]
                """)
        } else if isBeside(firstIndex.element, secondIndex.element, myRoom) == true {
            let cost = findBesideLowcost(firstIndex.element, secondIndex.element, myPointOfDoorSets[0], myPointOfDoorSets[1], myPointOfDoorSets[2], myRoom)
            print("""
                   ________                                                                           │
                  /│######/│     ┌------┬------┐     ┌------┬------┐                                  │
                 /#│#####/ │     │      │    . │     │      .___.  │                                  │
                │##│####│  │ --> │  .   │      │ --> │  .   │      │ --> \(cost)
                │#/     │ /      └------┴------┘     └------┴------┘                                  │
                │/______│/                                                                            │
                插座[\(firstIndex.offset + 1)]-插座[\(secondI     ndex.offset + 1)]
                """)
        } else if isAcross(firstIndex.element, secondIndex.element, myRoom) == true {
            let cost = findAcrossLowcost(firstIndex.element, secondIndex.element, myPointOfDoorSets[0], myPointOfDoorSets[1], myPointOfDoorSets[2], myRoom)
            print("""
                   ________                                 ┌                        ┐                │
                  /│      /│     ┌------┬------┬------┐     │ ┌------┬------┬------┐ │                │
                 /#│_____/#│     │  .   │      │      │     │ │  .   │      │      │ │                │
                │##│____│##│ --> │      │      │   .  │ --> │ │      .______.   .  │ │ --> \(cost)
                │#/     │#/      └------┴------┴------┘     │ └------┴------┴------┘ │                │
                │/______│/                                  └                        ┘                │
                插座[\(firstIndex.offset + 1)]-插座[\(secondIndex.offset + 1)]
                """)
        }

        print("--------------------------------------------------------------------------------------┤\n")
    }
}

// 按照插座输入的顺序完成以房子上面的所有插座为顶点的无向完全图的创建
print("########## 第六步：画完全无向图 #########")
// 下三角邻接矩阵
for firstIndex in myOutletSets.enumerated() {
    for secondIndex in myOutletSets.enumerated() {

        // 去掉上三角和本身的情况
        if firstIndex.offset >= secondIndex.offset {
            continue
        }

        // 创建一个实例，用于赋值计算墙上任意两个插座的最短布线长度
        let myWeight = findTwoLowcost(firstIndex.element, secondIndex.element, myPointOfDoorSets[0], myPointOfDoorSets[1], myPointOfDoorSets[2], myRoom)

        // 画完全图的过程
        myGraph.addWire(outlet1: firstIndex.offset, outlet2: secondIndex.offset, weight: myWeight!)
        print(myGraph)
    }
}

// 创建一个kruskalAlgorithm的实例对象result
let result = kruskalAlgorithm(myGraph)
print("""
    ┌------------------------------------------------------┐
    │                       RESULT                         │
    └------------------------------------------------------┘
    最小生成树为:\(result.tree)
    最小生成树权值的理论计算真实值: \(result.lowcost)
    最小生成树权值向上取整数的实际值: \(Int(result.lowcost + 1))
    --------------------------------------------------------
    """)

