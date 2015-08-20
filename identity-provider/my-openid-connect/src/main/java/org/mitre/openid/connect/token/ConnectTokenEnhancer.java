package org.mitre.openid.connect.token;
/*******************************************************************************
 * Copyright 2015 The MITRE Corporation
 *   and the MIT Kerberos and Internet Trust Consortium
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *******************************************************************************/


import java.util.Arrays;
import java.util.Date;
import java.util.Set;
import java.util.UUID;

import org.mitre.jwt.signer.service.JWTSigningAndValidationService;
import org.mitre.jwt.signer.service.impl.JWKSetCacheService;
import org.mitre.jwt.signer.service.impl.SymmetricKeyJWTValidatorCacheService;
import org.mitre.oauth2.model.ClientDetailsEntity;
import org.mitre.oauth2.model.OAuth2AccessTokenEntity;
import org.mitre.oauth2.service.ClientDetailsEntityService;
import org.mitre.oauth2.service.SystemScopeService;
import org.mitre.openid.connect.config.ConfigurationPropertiesBean;
import org.mitre.openid.connect.model.UserInfo;
import org.mitre.openid.connect.service.ApprovedSiteService;
import org.mitre.openid.connect.service.OIDCTokenService;
import org.mitre.openid.connect.service.UserInfoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.OAuth2Request;
import org.springframework.security.oauth2.provider.token.TokenEnhancer;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.nimbusds.jose.JWSAlgorithm;
import com.nimbusds.jose.JWSHeader;
import com.nimbusds.jwt.JWTClaimsSet;
import com.nimbusds.jwt.SignedJWT;

@Service
public class ConnectTokenEnhancer implements TokenEnhancer {

	/**
	 * Logger for this class
	 */
	private static final Logger logger = LoggerFactory.getLogger(ConnectTokenEnhancer.class);

	@Autowired
	private ConfigurationPropertiesBean configBean;

	@Autowired
	private JWTSigningAndValidationService jwtService;

	@Autowired
	private ClientDetailsEntityService clientService;

	@Autowired
	private ApprovedSiteService approvedSiteService;

	@Autowired
	private UserInfoService userInfoService;

	@Autowired
	private OIDCTokenService connectTokenService;

	@Autowired
	private JWKSetCacheService encryptors;

	@Autowired
	private SymmetricKeyJWTValidatorCacheService symmetricCacheService;


	@Override
	public OAuth2AccessToken enhance(OAuth2AccessToken accessToken,	OAuth2Authentication authentication) {

		OAuth2AccessTokenEntity token = (OAuth2AccessTokenEntity) accessToken;
		OAuth2Request originalAuthRequest = authentication.getOAuth2Request();

		String clientId = originalAuthRequest.getClientId();
		ClientDetailsEntity client = clientService.loadClientByClientId(clientId);

		Date tokenExpiration = token.getExpiration();
		
		JWTClaimsSet claims = createAccessTokenClaims(
				authentication, clientId, originalAuthRequest.getScope(), tokenExpiration);

		JWSAlgorithm signingAlg = jwtService.getDefaultSigningAlgorithm();

		SignedJWT signed = new SignedJWT(new JWSHeader(signingAlg), claims);

		jwtService.signJwt(signed);

		token.setJwt(signed);

		/**
		 * Authorization request scope MUST include "openid" in OIDC, but access token request
		 * may or may not include the scope parameter. As long as the AuthorizationRequest
		 * has the proper scope, we can consider this a valid OpenID Connect request. Otherwise,
		 * we consider it to be a vanilla OAuth2 request.
		 * 
		 * Also, there must be a user authentication involved in the request for it to be considered
		 * OIDC and not OAuth, so we check for that as well.
		 */
		if (originalAuthRequest.getScope().contains(SystemScopeService.OPENID_SCOPE)
				&& !authentication.isClientOnly()) {

			String username = authentication.getName();
			UserInfo userInfo = userInfoService.getByUsernameAndClientId(username, clientId);

			if (userInfo != null) {

				OAuth2AccessTokenEntity idTokenEntity = connectTokenService.createIdToken(client,
						originalAuthRequest, claims.getIssueTime(),
						userInfo.getSub(), token);

				// attach the id token to the parent access token
				token.setIdToken(idTokenEntity);
			} else {
				// can't create an id token if we can't find the user
				logger.warn("Request for ID token when no user is present.");
			}
		}

		return token;
	}

	JWTClaimsSet createAccessTokenClaims(OAuth2Authentication authentication, String clientId, Set<String> scopes, Date tokenExpiration) {
		
		JWTClaimsSet claims = new JWTClaimsSet();

		claims.setAudience(Lists.newArrayList(clientId,""));

		// get "sub" if available
		if (!authentication.isClientOnly()) {
			String username = authentication.getName();
			UserInfo userInfo = userInfoService.getByUsernameAndClientId(username, clientId);
			if (userInfo != null) {
				claims.setSubject(userInfo.getSub());
			}
		}

		claims.setCustomClaim("scope", scopes.toArray());
		claims.setIssuer(configBean.getIssuer());
		claims.setIssueTime(new Date());
		claims.setExpirationTime(tokenExpiration);
		claims.setJWTID(UUID.randomUUID().toString()); // set a random NONCE in the middle of it
		
		return claims;
	}

	public ConfigurationPropertiesBean getConfigBean() {
		return configBean;
	}

	public void setConfigBean(ConfigurationPropertiesBean configBean) {
		this.configBean = configBean;
	}

	public JWTSigningAndValidationService getJwtService() {
		return jwtService;
	}

	public void setJwtService(JWTSigningAndValidationService jwtService) {
		this.jwtService = jwtService;
	}

	public ClientDetailsEntityService getClientService() {
		return clientService;
	}

	public void setClientService(ClientDetailsEntityService clientService) {
		this.clientService = clientService;
	}

}
