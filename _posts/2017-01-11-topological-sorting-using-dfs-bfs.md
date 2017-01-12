---
published: true
layout: post
title: topological sorting using DFS and BFS
tags:
  - technology
  - java
  - leetcode
  - algorithm
categories: technology
---

[topological sorting](https://en.wikipedia.org/wiki/Topological_sorting) can be solved using DFS and BFS in asymptotical time complexity $O(V + E)$.

The problem [LeetCode #210 Course Schedule II](https://leetcode.com/problems/course-schedule-ii/) is an excellent exercise for us to practice the solution to topological sorting.

The problem is `int[] findOrder(int numCourses, int[][] prerequisites)`. For (the official) example, one answer to `4, [[1,0],[2,0],[3,1],[3,2]]` is `[0, 1, 2, 3]`. We should pay attention that we need to construct the adjacency list based on the provided edges. Moreover, we need to rememeber to **check the cycle**.

I really prefer BFS way. It's really easy to remember: always add the vertices with indegree 0 to the queue. After poping out a vertex from the queue, decrease the indegrees of its neighbors.

On the other hand, DFS tries to reach out the last vertex by going deep, and add the last vertex into the stack since it is the last one after sorting. In the meanwhile we need to record whether the vertex is in current DFS path (`int[] inPath`) and whether the vertex has been visited / sorted (`int[] visited`) for every vertex.

The BFS / breadth-first search / Kahn's algorithm way:

```java
public class Solution {
    public int[] findOrder(int numCourses, int[][] prerequisites) {
        Map<Integer, Set<Integer>> g = new HashMap<>();
        int[] inDegrees = new int[numCourses];
        buildGraph(numCourses, prerequisites, g, inDegrees);

        int[] res = new int[numCourses];
        int sortedLen = 0;
        Queue<Integer> q = new ArrayDeque<>();

        for (int i = 0; i < numCourses; ++i) {
            if (inDegrees[i] == 0) {
                q.add(i);
            }
        }
        while (q.size() > 0) {
            int curr = q.remove();
            for (int neigh: g.get(curr)) {
                inDegrees[neigh] -= 1;
                if (inDegrees[neigh] == 0) {
                    q.add(neigh);
                }
            }
            res[sortedLen] = curr;
            sortedLen += 1;
        }

        if (sortedLen != numCourses) {
            return new int[]{};
        }
        return res;
    }


    private void buildGraph(int numCourses, int[][] prerequisites,
        Map<Integer, Set<Integer>> g, int[] inDegrees) {
        for (int i = 0; i < numCourses; ++i) {
            g.put(i, new HashSet<Integer>());
        }
        for (int[] pre: prerequisites) {
            if (g.get(pre[1]).add(pre[0])) {
                inDegrees[pre[0]] += 1;
            }
        }
    }
}
```

The DFS / depth-first search way:

```java
public class Solution {
    public int[] findOrder(int numCourses, int[][] prerequisites) {
        Map<Integer, Set<Integer>> g = buildGraph(numCourses, prerequisites);

        boolean[] inPath = new boolean[numCourses];
        boolean[] visited = new boolean[numCourses];
        Deque<Integer> stack = new ArrayDeque<>();

        for (int i = 0; i < numCourses; ++i) {
            if (!visited[i] && !hasOrder(g, stack, inPath, visited, i)) {
                return new int[]{};
            }
        }

        int[] res = new int[numCourses];
        for (int i = 0; i < numCourses; ++i) {
            res[i] = stack.removeFirst();
        }
        return res;
    }

    private boolean hasOrder(Map<Integer, Set<Integer>> g,
        Deque<Integer> stack, boolean[] inPath, boolean[] visited, int i) {
        if (visited[i]) {
            return true;
        }
        visited[i] = true;
        inPath[i] = true;
        for (int neigh: g.get(i)) {
            if (inPath[neigh] || !hasOrder(g, stack, inPath, visited, neigh)) {
                return false;
            }
        }
        inPath[i] = false;
        stack.addFirst(i);
        return true;
    }

    private Map<Integer, Set<Integer>> buildGraph(int numCourses, int[][] prerequisites) {
        Map<Integer, Set<Integer>> g = new HashMap<>();
        for (int i = 0; i < numCourses; ++i) {
            g.put(i, new HashSet<Integer>());
        }
        for (int[] dep: prerequisites) {
            g.get(dep[1]).add(dep[0]);
        }
        //System.out.println(g);
        return g;
    }
}
```
