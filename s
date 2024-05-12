//INSERTION SORT

#include <iostream>
using namespace std;

void insertionSort(int arr[], int n) {
    for (int i = 1; i < n; i++) {
        int key = arr[i];
        int j = i - 1;

        while (j >= 0 && arr[j] > key) {
            arr[j + 1] = arr[j];
            j--;
        }
        arr[j + 1] = key;
    }
}

int main() {
    int n;
    cout << "Enter the number of elements: ";
    cin >> n;

    int arr[n];
    cout << "Enter " << n << " elements:\n";
    for (int i = 0; i < n; i++) {
        cin >> arr[i];
    }

    insertionSort(arr, n);

    cout << "Sorted array:\n";
    for (int i = 0; i < n; i++) {
        cout << arr[i] << " ";
    }
    cout << endl;

    return 0;
}



//selection sort

#include <iostream>
using namespace std;

void selectionSort(int arr[], int n) {
    for (int i = 0; i < n - 1; i++) {
        int min_index = i;
        for (int j = i + 1; j < n; j++) {
            if (arr[j] < arr[min_index]) {
                min_index = j;
            }
        }
        if (min_index != i) {
            int temp = arr[i];
            arr[i] = arr[min_index];
            arr[min_index] = temp;
        }
    }
}

int main() {
    int n;
    cout << "Enter the number of elements: ";
    cin >> n;

    int arr[n];
    cout << "Enter " << n << " elements:\n";
    for (int i = 0; i < n; i++) {
        cin >> arr[i];
    }

    selectionSort(arr, n);

    cout << "Sorted array:\n";
    for (int i = 0; i < n; i++) {
        cout << arr[i] << " ";
    }
    cout << endl;

    return 0;
}

//bubble sort 

#include <iostream>
using namespace std;

void bubbleSort(int arr[], int n) {
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                // swap arr[j] and arr[j+1]
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
}

int main() {
    int n;
    cout << "Enter the number of elements: ";
    cin >> n;

    int arr[n];
    cout << "Enter " << n << " elements:\n";
    for (int i = 0; i < n; i++) {
        cin >> arr[i];
    }

    bubbleSort(arr, n);

    cout << "Sorted array:\n";
    for (int i = 0; i < n; i++) {
        cout << arr[i] << " ";
    }
    cout << endl;

    return 0;
}

//heap sort

#include <iostream>
using namespace std;

// Function to heapify a subtree rooted at node i which is an index in arr[]
void heapify(int arr[], int n, int i) {
    int largest = i; // Initialize largest as root
    int left = 2 * i + 1; // Left child
    int right = 2 * i + 2; // Right child

    // If left child is larger than root
    if (left < n && arr[left] > arr[largest]) {
        largest = left;
    }

    // If right child is larger than largest so far
    if (right < n && arr[right] > arr[largest]) {
        largest = right;
    }

    // If largest is not root
    if (largest != i) {
        swap(arr[i], arr[largest]);

        // Recursively heapify the affected sub-tree
        heapify(arr, n, largest);
    }
}

// Main function to do heap sort
void heapSort(int arr[], int n) {
    // Build heap (rearrange array)
    for (int i = n / 2 - 1; i >= 0; i--) {
        heapify(arr, n, i);
    }

    // One by one extract an element from heap
    for (int i = n - 1; i > 0; i--) {
        // Move current root to end
        swap(arr[0], arr[i]);

        // Call max heapify on the reduced heap
        heapify(arr, i, 0);
    }
}

int main() {
    int n;
    cout << "Enter the number of elements: ";
    cin >> n;

    int arr[n];
    cout << "Enter " << n << " elements:\n";
    for (int i = 0; i < n; i++) {
        cin >> arr[i];
    }

    heapSort(arr, n);

    cout << "Sorted array:\n";
    for (int i = 0; i < n; i++) {
        cout << arr[i] << " ";
    }
    cout << endl;

    return 0;
}

//quick sort

#include <iostream>
using namespace std;

// Function to partition the array on the basis of a pivot element
int partition(int arr[], int low, int high) {
    int pivot = arr[high]; // pivot
    int i = (low - 1); // Index of smaller element

    for (int j = low; j <= high - 1; j++) {
        // If current element is smaller than the pivot
        if (arr[j] < pivot) {
            i++; // increment index of smaller element
            swap(arr[i], arr[j]);
        }
    }
    swap(arr[i + 1], arr[high]);
    return (i + 1);
}

// Function to implement quicksort
void quickSort(int arr[], int low, int high) {
    if (low < high) {
        // pi is partitioning index, arr[pi] is now at right place
        int pi = partition(arr, low, high);

        // Separately sort elements before and after partition
        quickSort(arr, low, pi - 1);
        quickSort(arr, pi + 1, high);
    }
}

int main() {
    int n;
    cout << "Enter the number of elements: ";
    cin >> n;

    int arr[n];
    cout << "Enter " << n << " elements:\n";
    for (int i = 0; i < n; i++) {
        cin >> arr[i];
    }

    quickSort(arr, 0, n - 1);

    cout << "Sorted array:\n";
    for (int i = 0; i < n; i++) {
        cout << arr[i] << " ";
    }
    cout << endl;

    return 0;
}

//merge sort

#include <iostream>
using namespace std;

// Function to merge two subarrays of arr[]
void merge(int arr[], int l, int m, int r) {
    int n1 = m - l + 1;
    int n2 = r - m;

    // Create temporary arrays
    int L[n1], R[n2];

    // Copy data to temporary arrays L[] and R[]
    for (int i = 0; i < n1; i++)
        L[i] = arr[l + i];
    for (int j = 0; j < n2; j++)
        R[j] = arr[m + 1 + j];

    // Merge the temporary arrays back into arr[l..r]
    int i = 0, j = 0, k = l;
    while (i < n1 && j < n2) {
        if (L[i] <= R[j]) {
            arr[k] = L[i];
            i++;
        } else {
            arr[k] = R[j];
            j++;
        }
        k++;
    }

    // Copy the remaining elements of L[], if any
    while (i < n1) {
        arr[k] = L[i];
        i++;
        k++;
    }

    // Copy the remaining elements of R[], if any
    while (j < n2) {
        arr[k] = R[j];
        j++;
        k++;
    }
}

// l is for left index and r is right index of the sub-array of arr to be sorted
void mergeSort(int arr[], int l, int r) {
    if (l >= r)
        return; // Base case: If there is only one element in the sub-array

    int m = l + (r - l) / 2;
    mergeSort(arr, l, m);     // Sort first half
    mergeSort(arr, m + 1, r); // Sort second half
    merge(arr, l, m, r);      // Merge the sorted halves
}

int main() {
    int n;
    cout << "Enter the number of elements: ";
    cin >> n;

    int arr[n];
    cout << "Enter " << n << " elements:\n";
    for (int i = 0; i < n; i++) {
        cin >> arr[i];
    }

    mergeSort(arr, 0, n - 1);

    cout << "Sorted array:\n";
    for (int i = 0; i < n; i++) {
        cout << arr[i] << " ";
    }
    cout << endl;

    return 0;
}

//radix

#include <iostream>
using namespace std;

// A utility function to get the maximum value in arr[]
int getMax(int arr[], int n) {
    int max = arr[0];
    for (int i = 1; i < n; i++)
        if (arr[i] > max)
            max = arr[i];
    return max;
}

// A function to do counting sort of arr[] according to the digit represented by exp.
void countSort(int arr[], int n, int exp) {
    int output[n]; // output array
    int count[10] = {0};

    // Store count of occurrences in count[]
    for (int i = 0; i < n; i++)
        count[(arr[i] / exp) % 10]++;

    // Change count[i] so that count[i] now contains actual position of this digit in output[]
    for (int i = 1; i < 10; i++)
        count[i] += count[i - 1];

    // Build the output array
    for (int i = n - 1; i >= 0; i--) {
        output[count[(arr[i] / exp) % 10] - 1] = arr[i];
        count[(arr[i] / exp) % 10]--;
    }

    // Copy the output array to arr[] so that arr[] now contains sorted numbers according to the current digit
    for (int i = 0; i < n; i++)
        arr[i] = output[i];
}

// The main function to that sorts arr[] of size n using Radix Sort
void radixSort(int arr[], int n) {
    // Find the maximum number to know the number of digits
    int max = getMax(arr, n);

    // Do counting sort for every digit. Note that instead of passing digit number, exp is passed.
    // exp is 10^i where i is the current digit number
    for (int exp = 1; max / exp > 0; exp *= 10)
        countSort(arr, n, exp);
}

// A utility function to print an array
void printArray(int arr[], int n) {
    for (int i = 0; i < n; i++)
        cout << arr[i] << " ";
    cout << endl;
}

int main() {
    int n;
    cout << "Enter the number of elements: ";
    cin >> n;

    int arr[n];
    cout << "Enter " << n << " elements:\n";
    for (int i = 0; i < n; i++) {
        cin >> arr[i];
    }

    radixSort(arr, n);

    cout << "Sorted array:\n";
    printArray(arr, n);

    return 0;
}

//bfs

#include <iostream>

using namespace std;

void bfs(int** graph, int size, int start) {
    bool* visited = new bool[size] {false};
    int* queue = new int[size];
    int front = 0, rear = 0;

    queue[rear++] = start;
    visited[start] = true;

    while (front < rear) {
        int current = queue[front++];
        cout << current << " ";

        for (int i = 0; i < size; ++i) {
            if (graph[current][i] && !visited[i]) {
                queue[rear++] = i;
                visited[i] = true;
            }
        }
    }

    delete[] visited;
    delete[] queue;
}

int main() {
    int size;
    cout << "Enter the number of nodes in the graph: ";
    cin >> size;

    int** graph = new int*[size];
    for (int i = 0; i < size; ++i) {
        graph[i] = new int[size];
    }

    cout << "Enter the adjacency matrix (0/1):\n";
    for (int i = 0; i < size; ++i) {
        for (int j = 0; j < size; ++j) {
            int val;
            cin >> val;
            graph[i][j] = val;
        }
    }

    int start;
    cout << "Enter the starting node: ";
    cin >> start;

    cout << "BFS traversal starting from node " << start << ": ";
    bfs(graph, size, start);

    // Free memory
    for (int i = 0; i < size; ++i) {
        delete[] graph[i];
    }
    delete[] graph;

    return 0;
}

//dfs

#include <iostream>
using namespace std;

// Maximum number of vertices in the graph
#define MAX_VERTICES 100

// Function to add an edge to the graph
void addEdge(int adjMatrix[MAX_VERTICES][MAX_VERTICES], int v, int w) {
    adjMatrix[v][w] = 1;
    adjMatrix[w][v] = 1; // Assuming the graph is undirected
}

// Recursive function for DFS traversal
void DFSUtil(int adjMatrix[MAX_VERTICES][MAX_VERTICES], int V, int v, bool visited[]) {
    // Mark the current node as visited and print it
    visited[v] = true;
    cout << v << " ";

    // Recur for all the vertices adjacent to this vertex
    for (int i = 0; i < V; i++) {
        if (adjMatrix[v][i] && !visited[i]) {
            DFSUtil(adjMatrix, V, i, visited);
        }
    }
}

// DFS traversal of the vertices reachable from a given vertex v
void DFS(int adjMatrix[MAX_VERTICES][MAX_VERTICES], int V, int v) {
    // Mark all the vertices as not visited
    bool visited[MAX_VERTICES] = {false};

    // Call the recursive helper function to print DFS traversal
    DFSUtil(adjMatrix, V, v, visited);
}

int main() {
    // Create a graph given in the example
    int V = 4;
    int adjMatrix[MAX_VERTICES][MAX_VERTICES] = {0};
    addEdge(adjMatrix, 0, 1);
    addEdge(adjMatrix, 0, 2);
    addEdge(adjMatrix, 1, 2);
    addEdge(adjMatrix, 2, 0);
    addEdge(adjMatrix, 2, 3);
    addEdge(adjMatrix, 3, 3);

    cout << "DFS Traversal starting from vertex 2: ";
    DFS(adjMatrix, V, 2);

    return 0;
}

//knapsack 

#include <iostream>
using namespace std;

// A utility function that returns the maximum of two integers
int max(int a, int b) {
    return (a > b) ? a : b;
}

// Function to solve the Knapsack problem
int knapsack(int W, int wt[], int val[], int n) {
    int i, w;
    int K[n + 1][W + 1];

    // Build table K[][] in bottom-up manner
    for (i = 0; i <= n; i++) {
        for (w = 0; w <= W; w++) {
            if (i == 0 || w == 0)
                K[i][w] = 0;
            else if (wt[i - 1] <= w)
                K[i][w] = max(val[i - 1] + K[i - 1][w - wt[i - 1]], K[i - 1][w]);
            else
                K[i][w] = K[i - 1][w];
        }
    }

    return K[n][W];
}

int main() {
    int n;
    cout << "Enter the number of items: ";
    cin >> n;

    int val[n], wt[n];
    cout << "Enter the values of items:\n";
    for (int i = 0; i < n; i++) {
        cin >> val[i];
    }

    cout << "Enter the weights of items:\n";
    for (int i = 0; i < n; i++) {
        cin >> wt[i];
    }

    int W;
    cout << "Enter the capacity of the knapsack: ";
    cin >> W;

    cout << "Maximum value that can be obtained: " << knapsack(W, wt, val, n) << endl;

    return 0;
}


//strassen 

#include <iostream>
using namespace std;

// Function to allocate memory for a 2D array
int** allocateMemory(int rows, int cols) {
    int** arr = new int*[rows];
    for (int i = 0; i < rows; i++) {
        arr[i] = new int[cols];
    }
    return arr;
}

// Function to add two matrices
void addMatrix(int** A, int** B, int** C, int n) {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            C[i][j] = A[i][j] + B[i][j];
        }
    }
}

// Function to subtract two matrices
void subtractMatrix(int** A, int** B, int** C, int n) {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            C[i][j] = A[i][j] - B[i][j];
        }
    }
}

// Function to multiply two matrices using Strassen's algorithm
void multiplyMatrix(int** A, int** B, int** C, int n) {
    if (n == 1) {
        C[0][0] = A[0][0] * B[0][0];
        return;
    }

    // Allocate memory for submatrices
    int** A11 = allocateMemory(n / 2, n / 2);
    int** A12 = allocateMemory(n / 2, n / 2);
    int** A21 = allocateMemory(n / 2, n / 2);
    int** A22 = allocateMemory(n / 2, n / 2);
    int** B11 = allocateMemory(n / 2, n / 2);
    int** B12 = allocateMemory(n / 2, n / 2);
    int** B21 = allocateMemory(n / 2, n / 2);
    int** B22 = allocateMemory(n / 2, n / 2);
    int** C11 = allocateMemory(n / 2, n / 2);
    int** C12 = allocateMemory(n / 2, n / 2);
    int** C21 = allocateMemory(n / 2, n / 2);
    int** C22 = allocateMemory(n / 2, n / 2);
    int** P1 = allocateMemory(n / 2, n / 2);
    int** P2 = allocateMemory(n / 2, n / 2);
    int** P3 = allocateMemory(n / 2, n / 2);
    int** P4 = allocateMemory(n / 2, n / 2);
    int** P5 = allocateMemory(n / 2, n / 2);
    int** P6 = allocateMemory(n / 2, n / 2);
    int** P7 = allocateMemory(n / 2, n / 2);

    // Divide matrices A and B into submatrices
    for (int i = 0; i < n / 2; i++) {
        for (int j = 0; j < n / 2; j++) {
            A11[i][j] = A[i][j];
            A12[i][j] = A[i][j + n / 2];
            A21[i][j] = A[i + n / 2][j];
            A22[i][j] = A[i + n / 2][j + n / 2];
            B11[i][j] = B[i][j];
            B12[i][j] = B[i][j + n / 2];
            B21[i][j] = B[i + n / 2][j];
            B22[i][j] = B[i + n / 2][j + n / 2];
        }
    }

    // Calculate seven auxiliary matrices
    subtractMatrix(B12, B22, P1, n / 2);
    multiplyMatrix(A11, P1, P1, n / 2);

    addMatrix(A11, A12, C11, n / 2);
    multiplyMatrix(C11, B22, P2, n / 2);

    addMatrix(A21, A22, C21, n / 2);
    multiplyMatrix(C21, B11, P3, n / 2);

    subtractMatrix(B21, B11, P4, n / 2);
    multiplyMatrix(A22, P4, P4, n / 2);

    addMatrix(A11, A22, C11, n / 2);
    addMatrix(B11, B22, C11, n / 2);
    multiplyMatrix(C11, P5, P5, n / 2);

    subtractMatrix(A12, A22, C11, n / 2);
    addMatrix(B21, B22, C11, n / 2);
    multiplyMatrix(C11, P6, P6, n / 2);

    subtractMatrix(A11, A21, C11, n / 2);
    addMatrix(B11, B12, C11, n / 2);
    multiplyMatrix(C11, P7, P7, n / 2);

    // Calculate result submatrices
    addMatrix(P5, P4, C11, n / 2);
    subtractMatrix(C11, P2, C11, n / 2);
    addMatrix(C11, P6, C11, n / 2);

    addMatrix(P1, P2, C12, n / 2);

    addMatrix(P3, P4, C21, n / 2);

    addMatrix(P5, P1, C22, n / 2);
    subtractMatrix(C22, P3, C22, n / 2);
    subtractMatrix(C22, P7, C22, n / 2);

    // Combine result submatrices into one matrix
    for (int i = 0; i < n / 2; i++) {
        for (int j = 0; j < n / 2; j++) {
            C[i][j] = C11[i][j];
            C[i][j + n / 2] = C12[i][j];
            C[i + n / 2][j] = C21[i][j];
            C[i + n / 2][j + n / 2] = C22[i][j];
        }
    }
}

// Function to print a matrix
void printMatrix(int** mat, int rows, int cols) {
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            cout << mat[i][j] << " ";
        }
        cout << endl;
    }
}

int main() {
    int n;
    cout << "Enter the size of matrices (power of 2): ";
    cin >> n;

    // Allocate memory for matrices
    int** A = allocateMemory(n, n);
    int** B = allocateMemory(n, n);
    int** C = allocateMemory(n, n);

    // Input matrices A and B
    cout << "Enter elements of matrix A:\n";
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            cin >> A[i][j];
        }
    }

    cout << "Enter elements of matrix B:\n";
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            cin >> B[i][j];
        }
    }

    // Multiply matrices A and B
    multiplyMatrix(A, B, C, n);

    // Print the result matrix
    cout << "Resultant matrix C:\n";
    printMatrix(C, n, n);

    return 0;
}

//prims

#include <iostream>
#define V 5

// Function to find the vertex with minimum key value
int minKey(int key[], bool mstSet[]) {
    int min = INT_MAX, min_index;
    for (int v = 0; v < V; v++) {
        if (mstSet[v] == false && key[v] < min) {
            min = key[v];
            min_index = v;
        }
    }
    return min_index;
}

// Function to construct and print MST for a graph represented using adjacency matrix
void primMST(int graph[V][V]) {
    int parent[V];  // Array to store constructed MST
    int key[V];     // Key values used to pick minimum weight edge in cut
    bool mstSet[V]; // To represent set of vertices not yet included in MST

    // Initialize all keys as INFINITE
    for (int i = 0; i < V; i++) {
        key[i] = INT_MAX;
        mstSet[i] = false;
    }

    // Always include first  vertex in MST.
    // Make key 0 so that this vertex is picked as first vertex.
    key[0] = 0;
    parent[0] = -1; // First node is always root of MST

    // The MST will have V vertices
    for (int count = 0; count < V - 1; count++) {
        // Pick the minimum key vertex from the set of vertices not yet included in MST
        int u = minKey(key, mstSet);

        // Add the picked vertex to the MST Set
        mstSet[u] = true;

        // Update key value and parent index of the adjacent vertices of the picked vertex.
        // Consider only those vertices which are not yet included in MST
        for (int v = 0; v < V; v++) {
            // graph[u][v] is non-zero only for adjacent vertices of m
            // mstSet[v] is false for vertices not yet included in MST
            // Update the key only if graph[u][v] is smaller than key[v]
            if (graph[u][v] && mstSet[v] == false && graph[u][v] < key[v]) {
                parent[v] = u;
                key[v] = graph[u][v];
            }
        }
    }

    // Print the constructed MST
    std::cout << "Edge \tWeight\n";
    for (int i = 1; i < V; i++) {
        std::cout << parent[i] << " - " << i << "\t" << graph[i][parent[i]] << std::endl;
    }
}

int main() {
    int graph[V][V] = {
        {0, 2, 0, 6, 0},
        {2, 0, 3, 8, 5},
        {0, 3, 0, 0, 7},
        {6, 8, 0, 0, 9},
        {0, 5, 7, 9, 0}
    };

    // Find and print the MST
    primMST(graph);

    return 0;
}
