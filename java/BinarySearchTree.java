class Node {
    public int value;
    public Node left, right;

    public Node(int value, Node left, Node right) {
        this.value = value;
        this.left = left;
        this.right = right;
    }
}

public class BinarySearchTree {
    public static boolean contains(Node root, int value) {
        // Get root value
        int rootValue = root.value;

        // If root matches the element entered, return true;
        if(rootValue == value){
            return true;
        }

        // If less than root value, search left subtree with root as 'left node'
        if (value < rootValue){
            if (root.left == null){
                return false;
            }
            return contains(root.left, value);
        }

        // If more than root value, search right subtree with root as 'right node'
        if(value > rootValue){
            if (root.right == null){
                return false;
            }
            return contains(root.right, value);
        }

        return false;
    }

    public static void main(String[] args) {
        Node n1 = new Node(1, null, null);
        Node n3 = new Node(3, null, null);
        Node n2 = new Node(2, n1, n3);

        System.out.println(contains(n2, 4));
    }
}class Node {
    public int value;
    public Node left, right;

    public Node(int value, Node left, Node right) {
        this.value = value;
        this.left = left;
        this.right = right;
    }
}

public class BinarySearchTree {
    public static boolean contains(Node root, int value) {
        // Get root value
        int rootValue = root.value;

        // If root matches the element entered, return true;
        if(rootValue == value){
            return true;
        }

        // If less than root value, search left subtree with root as 'left node'
        if (value < rootValue){
            if (root.left == null){
                return false;
            }
            return contains(root.left, value);
        }

        // If more than root value, search right subtree with root as 'right node'
        if(value > rootValue){
            if (root.right == null){
                return false;
            }
            return contains(root.right, value);
        }

        return false;
    }

    public static void main(String[] args) {
        Node n1 = new Node(1, null, null);
        Node n3 = new Node(3, null, null);
        Node n2 = new Node(2, n1, n3);

        System.out.println(contains(n2, 3));
    }
}
