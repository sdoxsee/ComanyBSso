package ca.bbd.openid.connect.security;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class NomadResponse {
	
	private ResponseMessage responseMessage;
	private ResponseNomadUser responseNomadUser;

	public ResponseMessage getResponseMessage() {
		return responseMessage;
	}

	public void setResponseMessage(ResponseMessage responseMessage) {
		this.responseMessage = responseMessage;
	}

	public ResponseNomadUser getResponseNomadUser() {
		return responseNomadUser;
	}

	public void setResponseNomadUser(ResponseNomadUser responseNomadUser) {
		this.responseNomadUser = responseNomadUser;
	}
	
}
