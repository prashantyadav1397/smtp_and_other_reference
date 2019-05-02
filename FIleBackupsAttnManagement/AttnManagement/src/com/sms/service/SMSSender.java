package com.sms.service;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

//ozeki server:  default portnumber url: http://127.0.0.1:9501/login


public class SMSSender {
	public static void main(String[] args) {
        try {
                String recipient = "7019350103";
                String message = "Hello World";
                String username = "admin";
                String password = "admin";
                String originator = "9902438675";

			String requestUrl = "http://127.0.0.1:9501/api?action=sendmessage&" + "username="
					+ URLEncoder.encode(username, "UTF-8") + "&password=" + URLEncoder.encode(password, "UTF-8")
					+ "&recipient=" + URLEncoder.encode(recipient, "UTF-8") + "&messagetype=SMS:TEXT" + "&messagedata="
					+ URLEncoder.encode(message, "UTF-8") + "&originator=" + URLEncoder.encode(originator, "UTF-8")
					+ "&serviceprovider=GSMModem1" + "&responseformat=html";


                URL url = new URL(requestUrl);
                HttpURLConnection uc = (HttpURLConnection)url.openConnection();

                
                
              
                
                System.out.println(uc.getResponseCode());
                
                
                System.out.println(uc.getResponseMessage());
                

                uc.disconnect();

        } catch(Exception ex) {
        	ex.printStackTrace();
                System.out.println(ex.getMessage());

        }
}
}
