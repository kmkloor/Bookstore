package business.customer;



import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;

public class CustomerForm {

    private String name;
    private String address;
    private String phone;
    private String email;
    private String credit;
    private Date ccExpDate;

    private boolean hasNameError;
    private boolean hasAddressError;
    private boolean hasPhoneError;
    private boolean hasEmailError;
    private boolean hasCreditError;
    private boolean hasDateError;


    public CustomerForm() {this("", "", "", "", "", "", "");}

    public CustomerForm(String name, String address, String phone, String email, String credit, String monthString, String yearString) {
        this.name = name;
        this.address = address;
        this.phone = phone.replaceAll("[^0-9]", "");
        this.email = email;
        this.credit = credit.replaceAll("[^0-9]", "");
        this.ccExpDate = getCcExpDate(monthString, yearString);
        validate();
    }

    public CustomerForm(Customer customer) {
        this.name = customer.getCustomerName();
        this.address = customer.getAddress();
        this.phone = customer.getPhone();
        this.email = customer.getEmail();
        this.credit = "";
        this.ccExpDate = getCcExpDate("", "");
        validate();
    }

    // Get methods for fields

    public String getName() { return name; }
    public String getAddress() { return address; }
    public String getPhone() { return phone; }
    public String getEmail() {
        return email;
    }
    public String getCredit() {
        return credit;
    }
    public Date getDate() { return ccExpDate; }
    // TODO: Add getters for the fields you add

    // hasError methods for fields

    public boolean getHasNameError() {
        return hasNameError;
    }
    public boolean getHasAddressError() { return hasAddressError; }
    public boolean getHasPhoneError() { return hasPhoneError; }
    public boolean getHasEmailError() { return hasEmailError; }
    public boolean getHasCreditError() { return hasCreditError; }
    public boolean getHasDateError() { return hasDateError; }


    public boolean getHasFieldError() {
        if (hasAddressError || hasCreditError || hasDateError || hasEmailError || hasNameError || hasPhoneError){
            return true;
        }
        return false;
    }

    public String getNameErrorMessage() { return "Valid name required (ex: Bilbo Baggins)"; }
    public String getAddressErrorMessage() { return "Valid address required (ex: 100 Main St.)"; }
    public String getPhoneErrorMessage() { return "Valid phone number required (ex: 18004446666)"; }
    public String getEmailErrorMessage() { return "Valid email required (ex: bilbo@baggins.com)"; }
    public String getCreditErrorMessage() { return "Credit card number must be between 14 and 16 digits"; }
    public String getDateErrorMessage() { return "Credit card expiration date must be after today"; }

    private void validate() {
        if (name == null || name.equals("") || name.length() > 45) {
            hasNameError = true;
        }
        if (address == null || address.equals("")) {
            hasAddressError = true;
        }

        if (phone == null || phone.equals("") || phone.length() != 10) {
            hasPhoneError = true;
        }
        if (email == null || email.equals("") || !email.contains("@") || email.endsWith(".")) {
            hasEmailError = true;
        }
        if (credit == null || credit.length() > 16 || credit.length() < 14) {
            hasCreditError = true;
        }
        Calendar c = Calendar.getInstance();
        c.set(Calendar.HOUR_OF_DAY, 0);
        Calendar d = Calendar.getInstance();
        d.setTime(ccExpDate);
        if (ccExpDate == null || ccExpDate.before(c.getTime()) || (c.get(Calendar.YEAR) == d.get(Calendar.YEAR)
                && c.get(Calendar.MONTH) >= d.get(Calendar.MONTH)) ){
            hasDateError = true;
        }
    }

    // Returns a Java date object with the specified month and year
    private Date getCcExpDate(String monthString, String yearString) {
        Calendar calendar = Calendar.getInstance();
        if (monthString == null || monthString.equals("") || yearString == null || yearString.equals("") ){
            calendar.set(Calendar.HOUR_OF_DAY, 0);
        }
        else {
            int month = Integer.parseInt(monthString);
            int year = Integer.parseInt(yearString);
            calendar.set(Calendar.MONTH, month);
            calendar.set(Calendar.YEAR, year);
        }
        return calendar.getTime();
    }
}
