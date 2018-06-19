
/**********  求最小生成树(Kruskal)  **********/

func kruskalAlgorithm<T>(_ graph: Graph<T>) -> (lowcost: Double, tree: Graph<T>) {
    var lowcost: Double = 0
    var tree = Graph<T>()

    // 函数签名：func sorted(by areInIncreasingOrder: (Wire<T>, Wire<T>) throws -> Bool) rethrows -> [Wire<T>]
    let sortedWireListByWeight =  graph.wireList.sorted(by: { $0.weight < $1.weight }) // 按照权值大小升序排序
    print("\n######## 第七步：两两插座最短布线按升序排序 ########")
    print("\(sortedWireListByWeight)\n")
    var unionFind = UnionFindSets<T>()

    for outlet in graph.outlets { // 表示图的顶点
        unionFind.addSetWith(outlet) // 表示添加顶点集
    }

    for wire in sortedWireListByWeight { // 按照边的权值列表排序
        let v1 = wire.head // 该边的一个头端点
        let v2 = wire.tail // 该边的另一个尾端点
        if !unionFind.inSameSet(v1, and: v2) { // 顶点v1和顶点v2同一个集合
            lowcost += wire.weight
            tree.addWire(wire)
            unionFind.unionSetsContaining(v1, and: v2) // 合并两个顶点v1和顶点v2为一个顶点
        }
    }

    return (lowcost: lowcost, tree: tree)
}
