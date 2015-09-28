package org.mitre.openid.connect.service.impl;

import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;
import org.mitre.openid.connect.config.ConfigurationPropertiesBean;
import org.mitre.openid.connect.model.UserInfo;


public class DefaultUserInfoServiceTest {

	@Test
	@Ignore
	public void testName() throws Exception {
		DefaultUserInfoService fixture = new DefaultUserInfoService();
		ConfigurationPropertiesBean config = new ConfigurationPropertiesBean();
		config.setNomadWsBaseUrl("");
		config.setNomadWsHeader("");
		config.setNomadWsToken("");
		fixture.setConfig(config);
		UserInfo byEmailAddress = fixture.getByEmailAddress("");
		Assert.assertNotNull(byEmailAddress);
	}
}
