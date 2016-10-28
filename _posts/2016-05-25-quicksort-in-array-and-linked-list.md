---
published: true
layout: post
title: quicksort in array and linked list
tags:
  - technology
  - java
  - leetcode
  - algorithm
categories: technology
---

[Quicksort](https://en.wikipedia.org/wiki/Quicksort) is a usual algorithm for sorting, with average time complexity $O(n log(n))$ and worst $O(n^2)$, and (stack depth) space complexity $O(log(n))$. As an exercise, I wrote down the quicksort for array and linked list in Java here.

For the array, the code is kind of trivial. Select the first element as the pivot, then scan and swap the elements less than pivot with the elements at the pointer position, in the end swap the pivot and the last smaller-than-pivot element, so that we obtain the position of the pivot and go on.

Bonus: We could implement the `findKthLargest` using quick select.

```java
// Solution.java

import java.util.Arrays;

public class Solution {
  public void quickSort(int[] array) {
    if (array == null || array.length <= 1){
      return;
    }
    quick(array, 0, array.length);
  }
  
  public int findKthLargest(int[] array, int k) {
    // f([11,12,13], 1) => 13
    // f([11,12,13], 2) => 12
    assert(1 <= k && k <= array.length);
    int targetIdx = array.length - k;
    int start = 0;
    int end = array.length;
    while (start + 1 < end) {
      int i = partition(array, start, end);
      if (i == targetIdx) {
        return array[i];
      } else if (i < targetIdx) {
        start = i + 1;
      } else {
        end = i;
      }
    }
    return array[start];
  }

  private void quick(int[] array, int start, int end){
    if (start + 1 >= end){
      return;
    }
    int mid = partition(array, start, end);
    quick(array, start, mid);
    quick(array, mid + 1, end);
  }

  private int partition(int[] array, int start, int end){
    // start inclusive
    // end exclusive
    // return the pivot position

    if (start + 1 >= end){
      return start;
    }

    int pivot = array[start];
    int i = start;
    for (int j = start + 1; j < end; ++j) {
      if (array[j] <= pivot) {
        i += 1;
        swap(array, i, j);
      }
    }
    swap(array, start, i);
    return i;
  }

  private void swap(int[] array, int x, int y){
    int tmp = array[x];
    array[x] = array[y];
    array[y] = tmp;
  }

  public static void main(String[] args) {
    int[] array = new int[] {5,6,3,2,6,3,2,5,1};
    Solution s = new Solution();
    s.quickSort(array);
    System.out.println(Arrays.toString(array));
  }
}
```

For the linked list, the code is less intuitive. The key point is that we can directly move the the nodes to the beginning in linked list, as a result the pivot is the start node that has been shifted in the end.

```java
// Solution.java

class ListNode {
  public int value;
  public ListNode next;
  public ListNode(int value) {
    this.value = value;
    next = null;
  }
}

public class Solution {
  public ListNode quickSort(ListNode head) {
    if (head == null || head.next == null){
      return head;
    }
    return quick(head, null);
  }

  private ListNode quick(ListNode start, ListNode end){
    if (start == null || start == end || start.next == end){
      return start;
    }

    ListNode[] result = partition(start, end);
    ListNode resultLeft = quick(result[0], result[1]);
    ListNode resultRight = quick(result[1].next, end);
    return resultLeft;
  }

  private ListNode[] partition(ListNode start, ListNode end){
    // start inclusive
    // end exclusive
    // return the new start node and the pivot node

    if (start == null || start == end || start.next == end){
      return new ListNode[] {start, start};
    }
    ListNode dummy = new ListNode(0);
    dummy.next = start;

    for (ListNode j = start; j != null && j.next != null && j.next != end; j = j.next) {
      while (j.next != null && j.next.value <= start.value){
        ListNode tmp = j.next;
        j.next = j.next.next;
        tmp.next = dummy.next;
        dummy.next = tmp;
      }
    }

    return new ListNode[] {dummy.next, start};
  }
}
```

Quicksort and the concepts of partition is kind of important in interview and coding. Hopefully I can always understand and remember the algorithm clearly.
