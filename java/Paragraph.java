import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Paragraph {
    public static String changeFormat(String paragraph) {
        Pattern pattern = Pattern.compile("[0-9]{3}-[0-9]{2}-[0-9]{4}");
        Matcher matcher = pattern.matcher(paragraph);

        while (matcher.find()) {
            String s = matcher.group();
            String replacementString = s.replace('-','/');
            String regexPattern = "(\\d{3})-(\\d{2})-(\\d{4})";

            // Define the replacement pattern to create the new format.
            String replacementPattern = "$1/$3/$2";

            // Use the replaceAll method to perform the transformation.
            paragraph = paragraph.replaceAll(regexPattern, replacementPattern);

           // paragraph = paragraph.replaceAll(s,replacementString);
                    //replaceSubstring(paragraph, s, replacementString);

        }

        return paragraph;

    }
    public static void main(String[] args) {
        System.out.println(changeFormat("Please quote your policy number: 112-39-8552."));
    }
}
