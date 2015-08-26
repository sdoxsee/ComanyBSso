package org.mitre.openid.connect.service.impl;

import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;
import org.mitre.openid.connect.model.UserInfo;

import ca.bbd.config.NomadWsConfigBean;


public class DefaultUserInfoServiceTest {

	@Test
	@Ignore
	public void testName() throws Exception {
		DefaultUserInfoService fixture = new DefaultUserInfoService();
		NomadWsConfigBean config = new NomadWsConfigBean();
		config.setBaseUrl("");
		config.setHeader("");
		config.setToken("");
		fixture.setConfig(config);
		UserInfo byEmailAddress = fixture.getByEmailAddress("");
		Assert.assertNotNull(byEmailAddress);
	}
}
