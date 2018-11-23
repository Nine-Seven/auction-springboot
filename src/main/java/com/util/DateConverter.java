package com.util;

import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author Carry
 *
 */
public class DateConverter implements Converter<String, Date> {
	
	private String pattern="yyyy-MM-dd HH:mm";
	public void setPattern(String pattern) {
		this.pattern = pattern;
	}

	@Override
	public Date convert(String arg0) {
		if ("".equals(arg0)){
			return null;
		}
		arg0 =arg0.replace("T", " ");
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		try {
			Date d = sdf.parse(arg0);
			return d;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

}
