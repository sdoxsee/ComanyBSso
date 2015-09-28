package ca.bbd.openid.connect.security;

import java.util.Arrays;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import org.mitre.openid.connect.config.ConfigurationPropertiesBean;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.rcp.RemoteAuthenticationException;
import org.springframework.security.authentication.rcp.RemoteAuthenticationManager;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

public class ApiAuthenticationManager implements RemoteAuthenticationManager {

	private static Logger logger = LoggerFactory.getLogger(ApiAuthenticationManager.class);
	
	@Autowired
	private ConfigurationPropertiesBean configBean;

	@Override
	public Collection<? extends GrantedAuthority> attemptAuthentication(
			String username, String password)
			throws RemoteAuthenticationException {
		return retrieveUser(username, password).getAuthorities();
	}

	protected final UserDetails retrieveUser(String username, String password) {

		RestTemplate restTemplate = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		headers.set(configBean.getNomadWsHeader(), configBean.getNomadWsToken());

		MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
		map.add("email", username);
		map.add("password", password);
		@SuppressWarnings("rawtypes")
		HttpEntity<MultiValueMap> request = new HttpEntity<MultiValueMap>(map,
				headers);

		try {
			restTemplate.postForObject(configBean.getNomadWsBaseUrl()
					+ "users/authenticate.xml", request, NomadResponse.class);
			
			List<SimpleGrantedAuthority> authorities = new LinkedList<SimpleGrantedAuthority>(
					Arrays.asList(new SimpleGrantedAuthority("ROLE_USER")));
			if (username != null && "mark.bajus@bfpartners.ca".equalsIgnoreCase(username)) {
				authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
			}
			User user = new User(username, password, authorities);
			return user;
		} catch (HttpClientErrorException e) {
//			if (HttpStatus.BAD_REQUEST == e.getStatusCode()) {}
			throw new BadCredentialsException("messages.error.user.login", e);
		} catch (HttpServerErrorException e) {
//			if (HttpStatus.SERVICE_UNAVAILABLE == e.getStatusCode()) {}
			throw new AuthenticationServiceException("messages.error.webservice_unavailable_html", e);
		} catch (RestClientException e) {
			throw new AuthenticationServiceException("messages.error.webservice_unavailable_html", e);
		}
	}

	public ConfigurationPropertiesBean getConfigBean() {
		return configBean;
	}

	public void setConfigBean(ConfigurationPropertiesBean configBean) {
		this.configBean = configBean;
	}

}
