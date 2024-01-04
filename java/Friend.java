import java.util.Collection;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Stack;

public class Friend {
    private Collection<Friend> friends;
    private String email;

    public Friend(String email) {
        this.email = email;
        this.friends = new ArrayList<Friend>();
    }

    public String getEmail() {
        return email;
    }

    public Collection<Friend> getFriends() {
        return friends;
    }

    public void addFriendship(Friend friend) {
        friends.add(friend);
        friend.getFriends().add(this);
    }

    public boolean canBeConnected(Friend friend) {
        if (this == friend) {
            // If the same friend is provided, they are considered connected.
            return true;
        }

        HashSet<Friend> visited = new HashSet<>();
        Stack<Friend> stack = new Stack<>();
        stack.push(this);

        while (!stack.isEmpty()) {
            Friend currentFriend = stack.pop();
            visited.add(currentFriend);

            if (currentFriend == friend) {
                return true; // Found a path to the target friend
            }

            for (Friend nextFriend : currentFriend.getFriends()) {
                if (!visited.contains(nextFriend)) {
                    stack.push(nextFriend);
                }
            }
        }

        return false; // No path to the target friend was found
    }

    public static void main(String[] args) {
        Friend a = new Friend("A");
        Friend b = new Friend("B");
        Friend c = new Friend("C");

        a.addFriendship(b);
        b.addFriendship(c);

        System.out.println(a.canBeConnected(c)); // Should print true
        System.out.println(a.canBeConnected(b)); // Should print true
        System.out.println(b.canBeConnected(c)); // Should print true
    }
}
