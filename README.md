# SFDC Cron Expressions
An easy way to work with Cron expressions. You can get and set each one of the terms in a Cron expression.

Starting from a complete expression, we can work with each of its terms. Also validates that our expression has the correct format.

[View the story on Medium (Inglés)](https://medium.com/@sfdcjedi/working-easily-with-cron-expressions-in-salesforce-ed44340cf52c)

[Ver el artículo en Medium (Español)](https://medium.com/@sfdcjedi/trabajar-f%C3%A1cilmente-con-expresiones-cron-en-salesforce-2ed864958117)

<a href="https://githubsfdeploy.herokuapp.com?owner=Salesforce Jedi&repo=https://github.com/sfdcjedi/sfdc-cron-expressions&ref=main">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">
</a>

# Metadata List
- **CronExpression.cls**: Uility class to work with Cron expressions. 
- **CronExpressionTest.cls**: Test class with the unit tests of CronExpression

# Example
```java
CronExpression cronExp = new CronExpression('0 0 12 * * ?');

System.debug('Seconds: ', cronExp.getSeconds());
System.debug('Minutes: ', cronExp.getMinutes());
System.debug('Hours: ', cronExp.getHours());
System.debug('Days of Month: ', cronExp.getDaysOfMonth());
System.debug('Month: ', cronExp.getMonths());
System.debug('Day of Week: ', cronExp.getDaysOfWeek());
System.debug('Year: ', cronExp.getYears());
System.debug('Full Expression', cronExp.getStringExpression());
```
