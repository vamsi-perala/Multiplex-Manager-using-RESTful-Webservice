package com.xyz.pojo;
 
import javax.xml.bind.annotation.XmlRootElement;

import java.util.Date;

@XmlRootElement(name = "bill")
public class Bill {
 
 private String accountID;
 private double billAmount;
 private Date dueDate;
 
 public String getAccountID() {
  return accountID;
 }
 
 public void setAccountID(String accountID) {
  this.accountID = accountID;
 }
 
 public double getBillAmount() {
  return billAmount;
 }
 
 public void setBillAmount(double billAmount) {
  this.billAmount = billAmount;
 }

  public Date getDueDate() {
  return dueDate;
 }
 
 public void setDueDate(Date dueDate) {
  this.dueDate = dueDate;
 }

}