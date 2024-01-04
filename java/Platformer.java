import java.util.ArrayList;
import java.util.HashMap;

public class Platformer {
    private ArrayList<Integer> platform = new ArrayList<>();
    private int currentPosition;

    public Platformer(int n, int position) {
        for(Integer index = 0; index < n; index++){
            this.platform.add(index);
        }
        this.currentPosition = this.platform.get(position);
    }

    public void jumpLeft() {
        int oldIndex = this.platform.indexOf(currentPosition);
        int newIndex = oldIndex - 2;
        this.currentPosition = this.platform.get(newIndex);
        this.platform.remove(oldIndex);

    }

    public void jumpRight() {
        int oldIndex = this.platform.indexOf(currentPosition);
        int newIndex = oldIndex + 2;
        this.currentPosition = this.platform.get(newIndex);
        this.platform.remove(oldIndex);
    }

    public int position() {
        return this.currentPosition;
    }

    public static void main(String[] args) {
        Platformer platformer = new Platformer(6, 3);
        System.out.println(platformer.position()); // should print 3

        platformer.jumpLeft();
        System.out.println(platformer.position()); // should print 1

        platformer.jumpRight();
        System.out.println(platformer.position()); // should print 4

    }
}
