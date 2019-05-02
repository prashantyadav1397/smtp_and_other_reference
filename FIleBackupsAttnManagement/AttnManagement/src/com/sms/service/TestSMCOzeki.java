/*
 * package com.sms.service; import java.io.*; import java.util.*; import
 * hu.ozeki.*; import java.io.*; class MyOzSmsClient extends OzSmsClient{
 * 
 * public MyOzSmsClient(String host, int port) throws IOException,
 * InterruptedException { super(host, port); // TODO Auto-generated constructor
 * stub }
 * 
 * 
 * @Override public void doOnMessageAcceptedForDelivery(OzSMSMessage sms) { Date
 * now = new Date(); System.out.println(now.toString() +
 * " Message accepted for delivery. ID: " + sms.messageId); }
 * 
 * @Override public void doOnMessageDeliveredToHandset(OzSMSMessage sms) { Date
 * now = new Date(); System.out.println(now.toString() +
 * " Message delivered to handset. ID: " + sms.messageId); }
 * 
 * @Override public void doOnMessageDeliveredToNetwork(OzSMSMessage sms) { Date
 * now = new Date(); System.out.println(now.toString() +
 * " Message delivered to network. ID: " + sms.messageId); }
 * 
 * @Override public void doOnMessageDeliveryError(OzSMSMessage sms) { Date now =
 * new Date(); System.out.println(now.toString() +
 * " Message could not be delivered. ID: " + sms.messageId + " Error message: "
 * + sms.errorMessage + "\r\n"); }
 * 
 * @Override public void doOnMessageReceived(OzSMSMessage sms) { Date now = new
 * Date(); System.out.println(now.toString() +
 * " Message received. Sender address: " + sms.sender + " Message text: " +
 * sms.messageData); }
 * 
 * 
 * @Override public void doOnClientConnectionError(String errorCode, String
 * errorMessage) { Date now = new Date(); System.out.println(now.toString() +
 * " Message code: " + errorCode + ", Message: " + errorMessage); }
 * 
 * 
 * 
 * }
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * public class TestSMCOzeki {
 * 
 *//**
	 * @param args
	 *//*
		 * public static void main(String[] args) { try { String host = "localhost"; int
		 * port = 9500; String username = "admin"; String password = "abc123";
		 * 
		 * MyOzSmsClient osc = new MyOzSmsClient(host, port); osc.login(username,
		 * password);
		 * 
		 * 
		 * String line = "Hello World";
		 * 
		 * System.out.println("SMS message:");
		 * 
		 * if(osc.isLoggedIn()) { osc.sendMessage("+551122334455", line); osc.logout();
		 * }
		 * 
		 * 
		 * } catch (IOException e) { System.out.println(e.toString());
		 * e.printStackTrace(); } catch (InterruptedException e) {
		 * System.out.println(e.toString()); e.printStackTrace(); } } }
		 */