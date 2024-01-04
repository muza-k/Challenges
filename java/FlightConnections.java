public class FlightConnections {
    public static int getMinimumConnections(boolean[][] matrix) {
        int n = matrix.length;
        boolean[] visited = new boolean[n];
        int minConnections = 0;

        for (int i = 0; i < n; i++) {
            if (!visited[i]) {
                dfs(matrix, visited, i);
                minConnections++;
            }
        }

        return minConnections - 1; // Subtract 1 since we don't need a connection for the first group.
    }

    private static void dfs(boolean[][] matrix, boolean[] visited, int airport) {
        visited[airport] = true;

        for (int i = 0; i < matrix.length; i++) {
            if (matrix[airport][i] && !visited[i]) {
                dfs(matrix, visited, i);
            }
        }
    }

    public static void main(String[] args) {
        boolean[][] matrix = new boolean[][] {
            {false, true, false, false, true},
            {true, false, false, false, false},
            {false, false, false, true, false},
            {false, false, true, false, false},
            {true, false, false, false, false}
        };
        System.out.println(FlightConnections.getMinimumConnections(matrix)); // should print 1
    }
}
