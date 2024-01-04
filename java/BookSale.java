import java.util.*;

public class BookSale {
    public static int nthLowestSelling(int[] sales, int n) {
        Map<Integer, Integer> books = new HashMap<>();
        for (int id : sales) {
            books.put(id, books.getOrDefault(id, 0) + 1);
        }

        // Step 1: Create a list of Map.Entry objects
        List<Map.Entry<Integer, Integer>> entryList = new ArrayList<>(books.entrySet());

        // Step 2: Sort the list based on values
        entryList.sort(Comparator.comparing(Map.Entry::getValue));

        // Check if n is within a valid range
        if (n < 1 || n > entryList.size()) {
            throw new IllegalArgumentException("Invalid value of n");
        }

        // Step 3: Retrieve the nth sorted value
        Map.Entry<Integer, Integer> nthEntry = entryList.get(n - 1);
        return nthEntry.getKey(); // Return the key associated with the nth lowest selling value
    }

    public static void main(String[] args) {
        int x = nthLowestSelling(new int[] { 11, 99, 44, 77, 99, 11, 33, 44, 77, 11, 99, 44, 11, 99, 11 }, 2);
        System.out.println(x);
    }
}
