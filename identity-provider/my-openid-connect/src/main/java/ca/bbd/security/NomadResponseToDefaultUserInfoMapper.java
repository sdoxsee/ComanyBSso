package ca.bbd.security;

import org.mitre.openid.connect.model.DefaultUserInfo;
import org.mitre.openid.connect.model.UserInfo;

public class NomadResponseToDefaultUserInfoMapper {

	public UserInfo mapToDefaultUserInfo(NomadResponse response) {
		
		DefaultUserInfo defaultUserInfo = null;
		if (response != null) {
			defaultUserInfo = new DefaultUserInfo();
			ResponseNomadUser nomadUser = response.getResponseNomadUser();
			if (nomadUser != null) {
				defaultUserInfo.setSub(nomadUser.getId());
				defaultUserInfo.setName(nomadUser.getNameFirst());
				defaultUserInfo.setGivenName(nomadUser.getNameFirst());
				defaultUserInfo.setMiddleName(nomadUser.getNameInitial());
				defaultUserInfo.setFamilyName(nomadUser.getNameLast());
				
				EmailAddress emailAddress = nomadUser.getEmailAddress();
				if (emailAddress != null) {
					String email = emailAddress.getContactInfo();
					defaultUserInfo.setPreferredUsername(email);
					defaultUserInfo.setEmail(email);
				}
				PhoneNumbers phoneNumbers = nomadUser.getPhoneNumbers();
				if (phoneNumbers != null) {
					defaultUserInfo.setPhoneNumber(phoneNumbers.getContactInfo());
				}
			}
		}
		return defaultUserInfo;
	}

}
