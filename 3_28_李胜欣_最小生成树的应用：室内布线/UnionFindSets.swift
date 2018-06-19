
/**********  并查集结构体  **********/

// 并查集的结构体定义，符合Hashable协议
public struct UnionFindSets<T: Hashable> {
    private var index = [T: Int]() // 索引
    private var parent = [Int]() // 父节点
    private var size = [Int]() // 大小

    // 默认的初始化函数 init()
    public init() {

    }

    // 追加元素
    public mutating func addSetWith(_ element: T) {
        index[element] = parent.count
        parent.append(parent.count)
        size.append(1)
    }

    // 在集合选出新元素作为新的代表，并指向它
    private mutating func setByIndex(_ index: Int) -> Int {
        if parent[index] == index {
            return index
        } else {
            parent[index] = setByIndex(parent[index]) // 递归调用setByIndex(_:)函数
            return parent[index]
        }
    }

    // 元素的集合
    public mutating func setOf(_ element: T) -> Int? { // 集合自身
        if let indexOfElement = index[element] {
            return setByIndex(indexOfElement)
        } else {
            return nil
        }
    }

    // 删除一个顶点，即通过合并，保留一个
    public mutating func unionSetsContaining(_ firstElement: T, and secondElement: T) {
        if let firstSet = setOf(firstElement), let secondSet = setOf(secondElement) {
            if firstSet != secondSet { // 两个集合不等
                if size[firstSet] < size[secondSet] { // 第一个集合的权值小于第二个集合的权值
                    parent[firstSet] = secondSet // 将第二个集合合并到第一个集合中，即第一个集合成为新代表
                    size[secondSet] += size[firstSet] // 权值相加赋给权值原来大的第二个集合
                } else { // 第一个集合的权值大于第二个集合的权值
                    parent[secondSet] = firstSet // 将第一个集合合并到第二个集合中，即第二个集合成为新代表
                    size[firstSet] += size[secondSet] // 权值相加赋给权值原来大的第一个集合
                }
            }
        }
    }

    // 两个顶点在同一个集合中
    public mutating func inSameSet(_ firstElement: T, and secondElement: T) -> Bool {
        if let firstSet = setOf(firstElement), let secondSet = setOf(secondElement) {
            return firstSet == secondSet
        } else {
            return false
        }
    }
}
