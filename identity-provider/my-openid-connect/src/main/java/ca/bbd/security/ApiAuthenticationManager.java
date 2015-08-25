package ca.bbd.security;

import java.util.Arrays;
import java.util.Collection;

import org.mitre.openid.connect.config.ConfigurationPropertiesBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.security.authentication.rcp.RemoteAuthenticationException;
import org.springframework.security.authentication.rcp.RemoteAuthenticationManager;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import ca.bbd.config.NomadWsConfigBean;

public class ApiAuthenticationManager implements RemoteAuthenticationManager {
	
	@Autowired
	private NomadWsConfigBean configBean;

	@Override
	public Collection<? extends GrantedAuthority> attemptAuthentication(
			String username, String password)
			throws RemoteAuthenticationException {
		return retrieveUser(username, password).getAuthorities();
	}

    protected final UserDetails retrieveUser(String username, String password)
            throws AuthenticationException {

        RestTemplate restTemplate = new RestTemplate();
        
        HttpHeaders headers = new HttpHeaders();
        headers.set(configBean.getHeader(), configBean.getToken());
        
        MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
        map.add("email", username);
        map.add("password", password);
        @SuppressWarnings("rawtypes")
        HttpEntity<MultiValueMap> request = new HttpEntity<MultiValueMap>(map, headers);
        
        try {
    		NomadResponse nomadResponse = restTemplate
    				.postForObject(
    						configBean.getBaseUrl() + "users/authenticate.xml",
    						request, NomadResponse.class);
    		
    		return new User(username, "", Arrays.asList(
//    				new SimpleGrantedAuthority("ROLE_ADMIN"),
    				new SimpleGrantedAuthority("ROLE_USER")
    				));
        } catch (RestClientException e) {
        	throw new UsernameNotFoundException("User '" + username + "' not found.", e);
        }
    }
}
