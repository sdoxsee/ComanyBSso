package ca.bbd.security;

import static org.junit.Assert.assertEquals;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;

import org.junit.Test;


public class ApiAuthenticationManagerTest {

	@Test
	public void shouldUnmarshalXmlToNomadResponse() throws Exception {
		JAXBContext jaxbContext = JAXBContext.newInstance(NomadResponse.class);
		Unmarshaller unmarshaller = jaxbContext.createUnmarshaller();
		NomadResponse nomadResponse = (NomadResponse) unmarshaller.unmarshal(getClass().getResourceAsStream("sample-user.xml"));
		
		assertEquals("Mark", nomadResponse.getResponseNomadUser().getNameFirst());
		assertEquals("mark.bajus@bfpartners.ca", nomadResponse.getResponseNomadUser().getEmailAddress().getContactInfo());
	}
}
