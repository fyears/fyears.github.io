---
published: true
layout: post
title: heapsort in array
tags:
  - technology
  - java
  - leetcode
  - algorithm
categories: technology
---

[Heapsort](https://en.wikipedia.org/wiki/Heapsort) is one of the algorithms for sorting, with average time complexity $O(n log(n))$ and worst $O(n log(n))$, and space complexity $O(1)$. I think it's kind of interesting, so I write down the Java implementation here. Previously I was familar with the top-down (`siftUp()`) method, but in this post I write down the buttom-up (`siftDown()`) way, based on Wikipedia.

Firstly `heapify()` using `siftDown()` with time $O(n)$ to build the max heap, then pop the top into the sorted part and `siftDown()` the heap part to maintain the heap property. Most importantly,

```java
int rootIdx = i;
int parentIdx = (i - 1) / 2;
int leftChildIdx = 2 * rootIdx + 1;
int rightChildIdx = 2 * rootIdx + 2;
```

Here is the inplace, buttom-up (`siftDown()`) version:

```java
public class Solution {
  public void heapsort(int[] array) {
    if (array == null || array.length <= 1) {
      return;
    }
    
    heapify(array);
    
    int heapSize = array.length - 1;
    while (heapSize > 0) {
      swap(array, 0, heapSize);
      heapSize -= 1;
      siftDown(array, 0, heapSize);
    }
  }
  
  private void heapify(int[] array) {
    // build the max heap
    
    int end = array.length - 1;
    int start = (end - 1) / 2;
    
    while (start >= 0) {
      siftDown(array, start, end);
      start -= 1;
    }
    
  }
  
  private void siftDown(int[] array, int start, int end) {
    // start and end are inclusive
    
    if (start < 0 || end >= array.length || start >= end) {
      return;
    }
    
    int rootIdx = start;
    
    while (rootIdx <= end) {
      int swapIdx = rootIdx;
      int leftChildIdx = 2 * rootIdx + 1;
      int rightChildIdx = 2 * rootIdx + 2;
      if (leftChildIdx <= end && array[swapIdx] < array[leftChildIdx]) {
        swapIdx = leftChildIdx;
      }
      if (rightChildIdx <= end && array[swapIdx] < array[rightChildIdx]) {
        swapIdx = rightChildIdx;
      }
      if (swapIdx == rootIdx) {
        return;
      }
      swap(array, rootIdx, swapIdx);
      rootIdx = swapIdx;
    }
  }
  
  private void swap(int[] array, int i, int j) {
    int tmp = array[i];
    array[i] = array[j];
    array[j] = tmp;
  }
}
```
