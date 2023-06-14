public class CronExpression {
    
    private String strExpression;
    private String seconds;
    private String minutes;
    private String hours;
    private String dayOfMonth;
    private String month;
    private String dayOfWeek;
    private String year;
    
    private final String REGEX_PATTERN = '^((((\\d+,)+\\d+|(\\d+(\\/|-|#)\\d+)|\\d+L?|\\*(\\/\\d+)?|L(-\\d+)?|\\?|[A-Z]{3}(-[A-Z]{3})?) ?){5,7})$';
    private final String SPECIAL_CHARS = '*?-,/LW#';
    
    private final Map<String, Integer> MONTH_MAPPING = new Map<String, Integer> {
        'JAN' => 0, 
        'FEB' => 1, 
        'MAR' => 2, 
        'APR' => 3, 
        'MAY' => 4, 
        'JUN' => 5, 
        'JUL' => 6, 
        'AUG' => 7, 
        'SEP' => 8, 
        'OCT' => 9, 
        'NOV' => 10, 
        'DEC' => 11
    };
        
    private final Map<String, Integer> WEEK_DAY_MAPPING = new Map<String, Integer> {
        'SUN' => 1, 
        'MON' => 2, 
        'TUE' => 3, 
        'WED' => 4, 
        'THU' => 5, 
        'FRI' => 6, 
        'SAT' => 7
    };

    public CronExpression(String strExpression) {
        
        if (!String.isBlank(strExpression)) {
            
            if (this.checkCronExpression(strExpression)) {
            	this.strExpression = strExpression;
            } else {
                throw new CronException('Invalid Cron Expression: ' + strExpression);
            }
            
            List<String> expressionSplit = strExpression.split(' ');
            if (expressionSplit.size() < 6) {
                throw new CronException('Invalid Cron Expression: Not enough terms (' + expressionSplit.size() + '/6)');
            }
            
            this.seconds = expressionSplit[0];
            this.minutes = expressionSplit[1];
            this.hours = expressionSplit[2];
            this.dayOfMonth = expressionSplit[3];
            this.month = expressionSplit[4];
            this.dayOfWeek = expressionSplit[5];
            if (expressionSplit.size() == 7) {
                this.year = expressionSplit[6];
            }
            
        } else {
            throw new CronException('Invalid Cron Expression: Empty String');
        }
        
    }
    
    private Boolean checkCronExpression(String strExpression) {
        Pattern cronFormat = Pattern.Compile(REGEX_PATTERN);
        Matcher cronMatch = cronFormat.matcher(strExpression);
        return cronMatch.matches();
    }
    
    private String regenerateStringExpression() {
        this.strExpression = this.seconds + ' ' + this.minutes + ' ' + this.hours + ' ' + this.dayOfMonth + ' ' + this.month + ' ' + this.dayOfWeek;
        if (this.dayOfWeek != null) {
            this.strExpression += ' ' + this.year;
        }
        return this.strExpression;
    }
    
    public String getStringExpression() {
        return this.strExpression;
    }
    
    public String getSeconds() {
        return this.seconds;
    }
    
    public void setSeconds(String secondsTerm) {
        this.seconds = secondsTerm;
        this.regenerateStringExpression();
    }
    
    public String getMinutes() {
        return this.minutes;
    }
    
    public void setMinutes(String minutesTerm) {
        this.minutes = minutesTerm;
        this.regenerateStringExpression();
    }
    
    public String getHours() {
        return this.hours;
    }
    
    public void setHours(String hoursTerm) {
        this.hours = hoursTerm;
        this.regenerateStringExpression();
    }
    
    public String getDaysOfMonth() {
        return this.dayOfMonth;
    }
    
    public void setDaysOfMonth(String daysOfMonthTerm) {
        this.dayOfMonth = daysOfMonthTerm;
        this.regenerateStringExpression();
    }
    
    public String getMonths() {
        return this.month;
    }
    
    public void setMonths(String monthsTerm) {
        this.month = monthsTerm;
        this.regenerateStringExpression();
    }
    
    public String getDaysOfWeek() {
        return this.dayOfWeek;
    }
    
    public void setDaysOfWeek(String daysOfWeekTerm) {
        this.dayOfWeek = daysOfWeekTerm;
        this.regenerateStringExpression();
    }
    
    public String getYears() {
        return this.year;
    }
    
    public void setYears(String yearsTerm) {
        this.year = yearsTerm;
        this.regenerateStringExpression();
    }
    
    public class CronException extends Exception {}
    
}