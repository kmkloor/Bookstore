package business.book;

import java.util.Calendar;
import java.util.Date;

public class test {



    public static void main(){
        Calendar calendar = Calendar.getInstance();
            int month = Integer.parseInt("6");
            int year = Integer.parseInt("2018");
            calendar.set(Calendar.MONTH, month);
            calendar.set(Calendar.YEAR, year);
        Date ccExpDate = calendar.getTime();
    Calendar c = Calendar.getInstance();
        c.set(Calendar.HOUR_OF_DAY, 0);
    Calendar d = Calendar.getInstance();
        d.setTime(ccExpDate);
        if ( ccExpDate.before(c.getTime()) || (c.get(Calendar.YEAR) == d.get(Calendar.YEAR)
            && c.get(Calendar.MONTH) < d.get(Calendar.MONTH)) ) {
            System.out.println("fail");
        }
        System.out.println("pass");
    }


}
