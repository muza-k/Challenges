import java.util.LinkedList;

public class Platformer {
    private LinkedList<Integer> platform = new LinkedList<>();
    private int currentIndex;

    public Platformer(int n, int position) {
        for (int index = 0; index < n; index++) {
            this.platform.add(index);
        }
        this.currentIndex = position;
    }

    public void jumpLeft() {
        int oldIndex = this.currentIndex;
        this.currentIndex = oldIndex - 2;
        this.platform.remove(oldIndex);
    }

    public void jumpRight() {
        int oldIndex = this.currentIndex;
        this.currentIndex = oldIndex + 1;
        this.platform.remove(oldIndex);
    }

    public int position() {
        return this.platform.get(this.currentIndex);
    }

    public static void main(String[] args) {
        Platformer platformer = new Platformer(6, 3);

        platformer.jumpLeft();
        System.out.println(platformer.position()); // should print 1

        platformer.jumpRight();
        System.out.println(platformer.position()); // should print 4
    }
}
