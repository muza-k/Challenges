import org.w3c.dom.Text;

public class UserInput {

    public static class TextInput {
        String result;

        TextInput(){
            this.result = "";
        }

        void add(char c){
            this.result = this.result + c;
        }

        String getValue(){
            return this.result;
        }
    }

    public static class NumericInput extends TextInput {
        void add(char c){
           if(Character.isDigit(c)){
               this.result = this.result + c;
           }
        }
    }

    public static void main(String[] args) {
        TextInput input = new NumericInput();
        input.add('1');
        input.add('a');
        input.add('0');
        System.out.println(input.getValue());
    }
}
