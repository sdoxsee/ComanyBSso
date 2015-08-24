package ca.bbd.security;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "nomadResponse")
public class NomadResponse {
	
	private ResponseMessage responseMessage;

	public ResponseMessage getResponseMessage() {
		return responseMessage;
	}

	public void setResponseMessage(ResponseMessage responseMessage) {
		this.responseMessage = responseMessage;
	}
}
