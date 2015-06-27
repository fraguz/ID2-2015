////// NEIGHBORS //////

// function to return neighbors of a cell

interface NeighborFn { 
  int[] fn(int[][] matrix, int x, int y);
}

// return preceding neighbors in a triangle-shaped grid 

class TriangleNeighbors implements NeighborFn {
    int[] fn(int[][] matrix, int x, int y) {
    int[] neighbors = new int[0];
    if (x > 0) {
      neighbors = append(neighbors, matrix[y][x-1]); // left neighbor
    }
    if (y > 0) {
      neighbors = append(neighbors, matrix[y-1][x]); // top neighbor
    }
    return neighbors;
  }
}

// helper functions
boolean contains(int[] a, int e) {
  for (int element : a) if (element == e) return true;
  return false;
}