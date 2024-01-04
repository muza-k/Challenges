import java.util.HashMap;
import java.util.Map;

public class PaperStrip {
    public static int minPieces(int[] source, int[] target) {
        int pieces = 0;
        int length = source.length;
        // Create a mapping of values to their positions in the source array
        Map<Integer, Integer> sourceIndices = new HashMap<>();
        for (int i = 0; i < length; i++) {
            sourceIndices.put(source[i], i);
        }

        for(int targetIndex = 0; targetIndex < length;) {
            int sourceIndex = sourceIndices.get(target[targetIndex]);
            while (sourceIndex < length && targetIndex < length && target[targetIndex] == source[sourceIndex]) {
                sourceIndex++;
                targetIndex++;
            }
            pieces++;
            if(targetIndex >= length){
                break;
            }
        }
        return  pieces;
    }

    public static void main(String[] args) {
        int[] original = new int[] { 1, 4, 3, 2 };
        int[] desired = new int[] { 1, 2, 4, 3 };
        System.out.println(PaperStrip.minPieces(original, desired));
    }

    public static int findIndex(int[] arr, int searchNumber){
        for(int i = 0; i < arr.length; i++){
            if(arr[i] == searchNumber){
                return i;
            }
        }
        return -1;
    }
}
