package org.mitre.openid.connect.service.impl;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;

import org.mitre.oauth2.model.ClientDetailsEntity;
import org.mitre.oauth2.model.ClientDetailsEntity.SubjectType;
import org.mitre.oauth2.service.ClientDetailsEntityService;
import org.mitre.openid.connect.model.UserInfo;
import org.mitre.openid.connect.service.PairwiseIdentiferService;
import org.mitre.openid.connect.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import ca.bbd.config.NomadWsConfigBean;
import ca.bbd.security.NomadResponse;
import ca.bbd.security.NomadResponseToDefaultUserInfoMapper;

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

		return getByEmailAddress(username);

	}

	@Override
	public UserInfo getByUsernameAndClientId(String username, String clientId) {

		ClientDetailsEntity client = clientService
				.loadClientByClientId(clientId);

		UserInfo userInfo = getByUsername(username);

		if (client == null || userInfo == null) {
			return null;
		}

		if (SubjectType.PAIRWISE.equals(client.getSubjectType())) {
			String pairwiseSub = pairwiseIdentifierService.getIdentifier(
					userInfo, client);
			userInfo.setSub(pairwiseSub);
		}

		return userInfo;

	}

	public static boolean isValidEmailAddress(String email) {
		boolean result = true;
		try {
			InternetAddress emailAddr = new InternetAddress(email);
			emailAddr.validate();
		} catch (AddressException ex) {
			result = false;
		}
		return result;
	}

	@Override
	public UserInfo getByEmailAddress(String email) {

		UserInfo userInfo = null;

		if (isValidEmailAddress(email)) {
			try {
				RestTemplate restTemplate = new RestTemplate();

				HttpHeaders headers = new HttpHeaders();
				headers.set(config.getHeader(), config.getToken());

				HttpEntity<String> entity = new HttpEntity<String>(
						"parameters", headers);

				ResponseEntity<NomadResponse> nomadResponse = restTemplate
						.exchange(config.getBaseUrl() + "users/" + email,
								HttpMethod.GET, entity, NomadResponse.class);

				NomadResponseToDefaultUserInfoMapper mapper = new NomadResponseToDefaultUserInfoMapper();

				userInfo = mapper.mapToDefaultUserInfo(nomadResponse.getBody());

			} catch (RestClientException e) {
				throw new UsernameNotFoundException("User with email '" + email
						+ "' not found.", e);
			}
		}
		return userInfo;

	}

	public NomadWsConfigBean getConfig() {
		return config;
	}

	public void setConfig(NomadWsConfigBean config) {
		this.config = config;
	}

}
