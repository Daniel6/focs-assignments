def bfs(graph, start):
    """Graph breadth-first search.
    
    1. create a sequence that contains only node a
    2. until the collection is empty:
    3.    remove node n from the head of the sequence and visit it
    4.
    5. to visit a node:
    6.    add unvisited adjacent nodes to the tail of the sequence"""
    remaining_nodes = Queue()
    visited = set()

    def visit(node):
        print(node)
        visited.add(node)
        for tail in graph.successors(node):
            if tail not in visited:
                tail.parent = node # add reference to parent
                remaining_nodes.put(tail)

    remaining_nodes.put(start)
    while not remaining_nodes.empty():
        n = remaining_nodes.get()
        visit(n)