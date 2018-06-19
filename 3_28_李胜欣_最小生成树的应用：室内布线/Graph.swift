
/**********  房子对应的无向完全加权图结构体  **********/

// 自定义字符串可转换协议CustomStringConvertible
public struct Graph<T: Hashable>: CustomStringConvertible {

    // 房子对应的无向完全加权图的属性
    public private(set) var wireList: [Wire<T>] // 多个插线的数组
    public private(set) var outlets: Set<T> // 多个插座的集合
    public private(set) var adjacencyList: [T: [(outlet: T, weight: Double)]] // 表示所有两两插座与其权值的数组
    public var description: String { // 具体的自定义字符串可转换协议
        var description: String = "树 "
        for wire in wireList {
            description += wire.description + " "
        }
        return description
    }

    // 默认的初始化函数init()
    public init() {
        wireList = [Wire<T>]()
        outlets = Set<T>()
        adjacencyList = [T: [(outlet: T, weight: Double)]]()
    }

    // 无向完全图的初始化加边函数
    public mutating func addWire(outlet1 o1: T, outlet2 o2: T, weight w: Double) {
        wireList.append(Wire(head: o1, tail: o2, weight: w)) // 在插线数组中追加新的一组
        outlets.insert(o1) // 插入o1
        outlets.insert(o2) // 插入o2

        adjacencyList[o1] = adjacencyList[o1] ?? [] // 选择
        adjacencyList[o1]?.append((outlet: o2, weight: w)) // 追加新的一组到o1

        adjacencyList[o2] = adjacencyList[o2] ?? [] // 选择
        adjacencyList[o2]?.append((outlet: o1, weight: w)) // 追加新的一组到o2
    }

    // 无向完全图的初始化加边函数的重载
    public mutating func addWire(_ wire: Wire<T>) {
        addWire(outlet1: wire.head, outlet2: wire.tail, weight: wire.weight)
    }
}
