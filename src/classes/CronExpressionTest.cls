@isTest
public class CronExpressionTest {

    @isTest
    public static void testConstructor() {
        
        Test.startTest();
        CronExpression cronExp = new CronExpression('0 0 12 * * ?');
        Test.stopTest();
        
        System.assertNotEquals(null, cronExp.getStringExpression());
        System.assertNotEquals(null, cronExp.getSeconds());
        System.assertNotEquals(null, cronExp.getMinutes());
        System.assertNotEquals(null, cronExp.getHours());
        System.assertNotEquals(null, cronExp.getDaysOfMonth());
        System.assertNotEquals(null, cronExp.getMonths());
        System.assertNotEquals(null, cronExp.getDaysOfWeek());
    }
    
    @isTest
    public static void testConstructorWithYear() {
        
        Test.startTest();
        CronExpression cronExp = new CronExpression('0 0 12 * * ? 2023');
        Test.stopTest();
        
        System.assertNotEquals(null, cronExp.getStringExpression());
        System.assertNotEquals(null, cronExp.getSeconds());
        System.assertNotEquals(null, cronExp.getMinutes());
        System.assertNotEquals(null, cronExp.getHours());
        System.assertNotEquals(null, cronExp.getDaysOfMonth());
        System.assertNotEquals(null, cronExp.getMonths());
        System.assertNotEquals(null, cronExp.getDaysOfWeek());
        System.assertNotEquals(null, cronExp.getYears());
    }
    
    @isTest
    public static void testCronEmpty() {
        
        CronExpression.CronException expectedEx = null;
        
        Test.startTest();
        try {
        	CronExpression cronExp = new CronExpression('    ');
        } catch (CronExpression.CronException ex) {
            expectedEx = ex;
        }
        Test.stopTest();
        
        System.assertNotEquals(null, expectedEx);
    }
    
    @isTest
    public static void testCronTooShort() {
        
        CronExpression.CronException expectedEx = null;
        
        Test.startTest();
        try {
        	CronExpression cronExp = new CronExpression('0 0 12 * *');
        } catch (CronExpression.CronException ex) {
            expectedEx = ex;
        }
        Test.stopTest();
        
        System.assertNotEquals(null, expectedEx);
    }
    
    @isTest
    public static void testCronWrongPattern() {
        
        CronExpression.CronException expectedEx = null;
        
        Test.startTest();
        try {
        	CronExpression cronExp = new CronExpression('0 0 12 * * ? * *');
        } catch (CronExpression.CronException ex) {
            expectedEx = ex;
        }
        Test.stopTest();
        
        System.assertNotEquals(null, expectedEx);
    }
    
    @isTest
    public static void testSetters() {
        
        CronExpression cronExp = new CronExpression('0 0 12 * * ?');
        
        Test.startTest();
        
        cronExp.setSeconds('*');
        cronExp.setMinutes('*');
        cronExp.setHours('*');
        cronExp.setDaysOfMonth('*');
        cronExp.setMonths('*');
        cronExp.setDaysOfWeek('*');
        cronExp.setYears('*');
        
        Test.stopTest();
        
        System.assertEquals('*', cronExp.getSeconds());
        System.assertEquals('*', cronExp.getMinutes());
        System.assertEquals('*', cronExp.getHours());
        System.assertEquals('*', cronExp.getDaysOfMonth());
        System.assertEquals('*', cronExp.getMonths());
        System.assertEquals('*', cronExp.getDaysOfWeek());
        System.assertEquals('*', cronExp.getYears());
        System.assertEquals('* * * * * * *', cronExp.getStringExpression());
        
    }
    
}