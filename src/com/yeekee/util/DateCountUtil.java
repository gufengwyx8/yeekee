package com.yeekee.util;

import java.text.ParseException;  
import java.text.SimpleDateFormat;  
import java.util.Calendar;  
import java.util.Date;  
  
public class DateCountUtil {  
  
    /** 
     * 接受YYYY-MM-DD的日期字符串参数,返回两个日期相差的天数 
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
     * 返回两个日期相差的天数 
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
     * 获取与_fromdate相差_monthCount个月的日期 
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
     * 计算每个月的天数，以数组返回 
     * @param months 
     * @param date 
     * @return 
     * @throws ParseException 
     */  
    public static String[] countMonthDates(int months,Date date) throws ParseException    
    {    
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
        String _date = date == null ? sdf.format(new Date()) : sdf.format(date);//如果不给定起算时间则从今天算起    
  
        return countMonthDates(months,_date);    
    }     
  
    /** 
     * 计算每个月的天数，以数组返回 
     * @param months 
     * @param date 
     * @return 
     * @throws ParseException 
     */   
    public static String[] countMonthDates(int months,String date) throws ParseException    
    {    
        String[] results = null;//结果    
        String _today = date == null ? new SimpleDateFormat("yyyy-MM-dd").format(new Date()) : date;//如果不给定起算时间则从今天算起    
        int _months = months > 0 ? months : 24;//如果不给定计算的月数则计算未来两年里面的24月    
        String startDate = getDistMonths(_today,0);//获得起算日期的YYYY-MM-DD格式的字符串日期    
        results = new String[_months];  
        for(int i = 1; i <= _months; i++)    
        {    
            String nextMonthDate = getDistMonths(_today,i);//每个月的截至日期    
            String desc = startDate + " 至 " + nextMonthDate;    
            long dates = getDistDates(startDate,nextMonthDate);//返回天数  
            results[i-1] = desc + " ：共 " + dates + " 天！";  
            startDate = nextMonthDate;//当前月的结束日期作为下一个月的起始日期    
        }    
        return results;    
    }  
}  
