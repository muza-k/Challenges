import java.text.ParseException;
import java.util.*;
import java.text.SimpleDateFormat;

public class DateTransform {

    public static List<String> transformDateFormat(List<String> dates) {
        List<String> formattedDates = new ArrayList<>();
        for (String date : dates) {
            Date formattedDate = transform(date);
            if (formattedDate != null) {
                SimpleDateFormat formatter = new SimpleDateFormat("yyyyddMM");
                formattedDates.add(formatter.format(formattedDate));
            }
        }
        return formattedDates;
    }

    public static Date transform(String dateString) {
        SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy/MM/dd");
        SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy'p'dd'p'MM");
        SimpleDateFormat formatter3 = new SimpleDateFormat("MM-dd-yyyy");

        List<SimpleDateFormat> formatters = new ArrayList<>();
        formatters.add(formatter1);
        formatters.add(formatter2);
        formatters.add(formatter3);
        for (SimpleDateFormat formatter : formatters) {
            try {
                dateString = dateString.replaceAll(" ", "");
                formatter.setLenient(false);
                Date parsedDate = formatter.parse(dateString);
                if (parsedDate != null) {
                    return parsedDate;
                }
            } catch (ParseException e) {
                // Don't do anything
            }
        }

        return null;
    }

    public static void main(String[] args) {
        List<String> dates = transformDateFormat(Arrays.asList("2010/02/20", "2 016p 19p 12", "11-18-2012", "2018 12 24", "20130720"));
        for(String date : dates) {
            System.out.println(date);
        }
    }
}
