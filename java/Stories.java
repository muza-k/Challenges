import java.util.HashMap;
import java.util.Map;

public class Stories {
    private static Map<Integer, Integer> memo = new HashMap<>();

    public static int numberOfArrangements(int numberOfStories) {
        if (numberOfStories <= 0) {
            return 1; // Base case: There's only one way to arrange zero stories.
        } else if (numberOfStories == 1) {
            return 1; // Base case: There's only one way to arrange one story.
        } else {
            // Check if the result is already memoized
            if (memo.containsKey(numberOfStories)) {
                return memo.get(numberOfStories);
            } else {
                // Calculate the number of arrangements for (n-1) and (n-2) stories
                int result = numberOfArrangements(numberOfStories - 1) + numberOfArrangements(numberOfStories - 2);
                // Memoize the result
                memo.put(numberOfStories, result);
                return result;
            }
        }
    }

    public static void main(String[] args) {
        System.out.println(numberOfArrangements(50)); // Example with a large number of stories
    }
}
