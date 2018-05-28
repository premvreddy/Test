package com.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CommonUtils {

	public static Date parse(String date) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat(Constants.DATE_FORMAT);
		return sdf.parse(date);
	}

	public static String format(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat(Constants.DATE_FORMAT);
		return sdf.format(date);
	}

	public static String dbDateFormat(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat(Constants.DB_DATE_FORMAT);
		return sdf.format(date);
	}
}
