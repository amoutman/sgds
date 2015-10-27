package com.creditease.sgds.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	public static Date dateFormat() throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

		String cDate = sdf.format(new Date());

		Date nowDate = sdf.parse(cDate);

		return nowDate;
	}

	public static Date dateTimeFormat(Date date) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

		String cDate = sdf.format(date);

		Date nowDate = sdf.parse(cDate);

		return nowDate;
	}
}
