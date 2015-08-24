package org.mitre.openid.connect.service.impl;

import org.mitre.oauth2.model.ClientDetailsEntity;
import org.mitre.oauth2.model.ClientDetailsEntity.SubjectType;
import org.mitre.oauth2.service.ClientDetailsEntityService;
import org.mitre.openid.connect.model.DefaultUserInfo;
import org.mitre.openid.connect.model.UserInfo;
import org.mitre.openid.connect.service.PairwiseIdentiferService;
import org.mitre.openid.connect.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import ca.bbd.config.NomadWsConfigBean;
import ca.bbd.security.NomadResponse;

/**
 * Implementation of the UserInfoService
 * 
 * @author sdoxsee
 * 
 */
@Service
public class DefaultUserInfoService implements UserInfoService {

	@Autowired
	private NomadWsConfigBean config;
	
	@Autowired
	private ClientDetailsEntityService clientService;

	@Autowired
	private PairwiseIdentiferService pairwiseIdentifierService;

	@Override
	public UserInfo getByUsername(String username) {
		
//        RestTemplate restTemplate = new RestTemplate();
//        
//        HttpHeaders headers = new HttpHeaders();
//        headers.set(config.getHeader(),
//        		config.getToken());
//        
//        MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
//        @SuppressWarnings("rawtypes")
//        HttpEntity<MultiValueMap> request = new HttpEntity<MultiValueMap>(map, headers);
//        
//        NomadResponse nomadResponse = restTemplate
//				.postForObject(
//						config.getBaseUrl() + "users/authenticate.xml",
//						request, NomadResponse.class);
		
		DefaultUserInfo defaultUserInfo = new DefaultUserInfo();
		defaultUserInfo.setEmail(username);
		defaultUserInfo.setPreferredUsername(username);
		defaultUserInfo.setName("Foo fighter");
		defaultUserInfo.setGivenName("Mark");
		defaultUserInfo.setFamilyName("Bajus");
		defaultUserInfo.setSub("47FA532F-A5B6-E311-8E1C-001F29DDFF28");
		return defaultUserInfo;
//        return null;
//		
//		return userInfoRepository.getByUsername(username);
	}

	@Override
	public UserInfo getByUsernameAndClientId(String username, String clientId) {

		ClientDetailsEntity client = clientService.loadClientByClientId(clientId);

		UserInfo userInfo = getByUsername(username);

		if (client == null || userInfo == null) {
			return null;
		}

		if (SubjectType.PAIRWISE.equals(client.getSubjectType())) {
			String pairwiseSub = pairwiseIdentifierService.getIdentifier(userInfo, client);
			userInfo.setSub(pairwiseSub);
		}

		return userInfo;

	}

	@Override
	public UserInfo getByEmailAddress(String email) {
//		return userInfoRepository.getByEmailAddress(email);
		DefaultUserInfo defaultUserInfo = new DefaultUserInfo();
		defaultUserInfo.setEmail(email);
		defaultUserInfo.setPreferredUsername(email);
		defaultUserInfo.setName("Foo fighter");
		defaultUserInfo.setGivenName("Mark");
		defaultUserInfo.setFamilyName("Bajus");
		defaultUserInfo.setSub("47FA532F-A5B6-E311-8E1C-001F29DDFF28");
		return defaultUserInfo;
//		return null;
	}

}
