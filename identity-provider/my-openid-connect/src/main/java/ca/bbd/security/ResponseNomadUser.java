package ca.bbd.security;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class ResponseNomadUser {
	
	private String id;
	private String nameFirst;
	private String nameInitial;
	private String nameLast;
	private EmailAddress emailAddress;
	private String employeeId;
	private String groupId;
	private PhoneNumbers phoneNumbers;
	
	@XmlElement()
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@XmlElement()
	public String getNameFirst() {
		return nameFirst;
	}
	public void setNameFirst(String nameFirst) {
		this.nameFirst = nameFirst;
	}
	@XmlElement()
	public String getNameInitial() {
		return nameInitial;
	}
	public void setNameInitial(String nameInitial) {
		this.nameInitial = nameInitial;
	}
	@XmlElement()
	public String getNameLast() {
		return nameLast;
	}
	public void setNameLast(String nameLast) {
		this.nameLast = nameLast;
	}
	@XmlElement
	public EmailAddress getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(EmailAddress emailAddress) {
		this.emailAddress = emailAddress;
	}
	@XmlElement()
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	@XmlElement()
	public String getGroupId() {
		return groupId;
	}
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
	@XmlElement()
	public PhoneNumbers getPhoneNumbers() {
		return phoneNumbers;
	}
	public void setPhoneNumbers(PhoneNumbers phoneNumbers) {
		this.phoneNumbers = phoneNumbers;
	}

}
