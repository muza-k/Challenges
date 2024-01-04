import java.util.Arrays;

public class ConstructionGame {
    int[][] playarea;

    public ConstructionGame(int length, int width) {
        this.playarea = new int[length][width];
        for(int i = 0; i < length; i++){
           Arrays.fill(this.playarea[i],0);
        }
    }

    public void addCubes(boolean[][] cubes) {
        for(int i=0; i<cubes.length; i++){
            for(int j=0; j<cubes[i].length; j++){
                if(cubes[i][j]){
                    this.playarea[i][j]++;
                }
            }
        }
        this.levelArea();
    }

    private void levelArea(){
        for(int i=0; i < this.playarea.length; i++){
            for(int j=0; j< this.playarea[i].length; j++){
                if(this.playarea[i][j] < 1){
                    return;
                }
            }
        }

        for(int i=0; i < this.playarea.length; i++){
            for(int j=0; j< this.playarea[i].length; j++){
                this.playarea[i][j] = this.playarea[i][j]-1;
            }
        }


    }

    public int getHeight() {
        int height = 0;
        for(int i=0; i < this.playarea.length; i++){
            for(int j=0; j < this.playarea[i].length; j++){
                if(this.playarea[i][j] > height){
                    height = this.playarea[i][j];
                }
            }
        }
        return height;
    }

    public static void main(String[] args) {
        ConstructionGame game = new ConstructionGame(2, 2);

        game.addCubes(new boolean[][] {
                { true, true },
                { false, false } });
        game.addCubes(new boolean[][] {
                { true, true },
                { false, true } });
        System.out.println(game.getHeight()); // should print 2

        game.addCubes(new boolean[][] {
                { false, false },
                { true, true } });
        System.out.println(game.getHeight()); // should print 1
    }
}
