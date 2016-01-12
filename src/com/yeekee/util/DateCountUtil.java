package com.yeekee.util;

import java.text.ParseException;  
import java.text.SimpleDateFormat;  
import java.util.Calendar;  
import java.util.Date;  
  
public class DateCountUtil {  
  
    /** 
     * ����YYYY-MM-DD�������ַ�������,�������������������� 
     * @param start 
     * @param end 
     * @return 
     * @throws ParseException 
     */  
    public static long getDistDates(String start,String end) throws ParseException    
    {  
          SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");   
          Date startDate = sdf.parse(start);     
          Date endDate = sdf.parse(end);  
          return getDistDates(startDate,endDate);  
    }    
      
    /** 
     * �������������������� 
     * @param startDate 
     * @param endDate 
     * @return 
     * @throws ParseException 
     */  
    public static long getDistDates(Date startDate,Date endDate)    
    {  
        long totalDate = 0;  
        Calendar calendar = Calendar.getInstance();  
        calendar.setTime(startDate);  
        long timestart = calendar.getTimeInMillis();  
        calendar.setTime(endDate);  
        long timeend = calendar.getTimeInMillis();  
        totalDate = Math.abs((timeend - timestart))/(1000*60*60*24);  
        return totalDate;  
    }   
      
    /** 
     * ��ȡ��_fromdate���_monthCount���µ����� 
     * @param _fromdate:YYYY-MM-DD 
     * @param _monthCount 
     * @return 
     * @throws ParseException 
     */  
    public static String getDistMonths(String _fromdate,int _monthCount) throws ParseException  
    {    
        String resultDate = "";  
        int year,month,date;  
        Calendar calendar = Calendar.getInstance();  
        calendar.setTime(new SimpleDateFormat("yyyy-MM-dd").parse(_fromdate));  
        year = calendar.get(Calendar.YEAR);  
        date = calendar.get(Calendar.DAY_OF_MONTH);  
        month = calendar.get(Calendar.MONTH) + 1 + _monthCount;  
        int c = new Integer((month-1)/12);  
        month = month%12;  
        if(month == 0)  
        month = 12;  
        year += c;  
        resultDate = year + "-" + month + "-" + date;  
        return resultDate;  
    }  
      
    /** 
     * ����ÿ���µ������������鷵�� 
     * @param months 
     * @param date 
     * @return 
     * @throws ParseException 
     */  
    public static String[] countMonthDates(int months,Date date) throws ParseException    
    {    
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
        String _date = date == null ? sdf.format(new Date()) : sdf.format(date);//�������������ʱ����ӽ�������    
  
        return countMonthDates(months,_date);    
    }     
  
    /** 
     * ����ÿ���µ������������鷵�� 
     * @param months 
     * @param date 
     * @return 
     * @throws ParseException 
     */   
    public static String[] countMonthDates(int months,String date) throws ParseException    
    {    
        String[] results = null;//���    
        String _today = date == null ? new SimpleDateFormat("yyyy-MM-dd").format(new Date()) : date;//�������������ʱ����ӽ�������    
        int _months = months > 0 ? months : 24;//�����������������������δ�����������24��    
        String startDate = getDistMonths(_today,0);//����������ڵ�YYYY-MM-DD��ʽ���ַ�������    
        results = new String[_months];  
        for(int i = 1; i <= _months; i++)    
        {    
            String nextMonthDate = getDistMonths(_today,i);//ÿ���µĽ�������    
            String desc = startDate + " �� " + nextMonthDate;    
            long dates = getDistDates(startDate,nextMonthDate);//��������  
            results[i-1] = desc + " ���� " + dates + " �죡";  
            startDate = nextMonthDate;//��ǰ�µĽ���������Ϊ��һ���µ���ʼ����    
        }    
        return results;    
    }  
}  
