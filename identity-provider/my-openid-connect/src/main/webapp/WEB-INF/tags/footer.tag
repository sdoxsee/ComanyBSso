<%@ attribute name="js" required="false"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="o" tagdir="/WEB-INF/tags"%>
<div id="push"></div>
<!-- </div> -->
<!-- end #wrap -->
<%-- <div id="footer">
	<div class="container">
		<p class="muted credit">
			<o:copyright />
		</p>
	</div>
</div> --%>

<footer>
	<div class="navbar">
		<div class="navbar-inner">
			<div class="navbar-text">
				<div class="copyright">All Rights Reserved. Copyright &copy;
					Benefits by Design Inc. (2004 - 2015)</div>
				<section class="footer-links">
					<ul>
						<li><a data-target="#privacy-policy-modal"
							data-toggle="modal" href="#">Privacy Policy</a></li>
						<li><a data-target="#legal-notice-modal" data-toggle="modal"
							href="#">Legal</a></li>
						<li class="no-divider"><a
							data-target="#security-notice-modal" data-toggle="modal" href="#">Security</a></li>
					</ul>
				</section>

				<p>
					<img alt="Eastern Office"
						src="//s3.amazonaws.com/bbd-nomad-assets/alpha/assets/optimumSSL_tl_trans-9c76444d0ec71f0a91165cec1064fec6.gif">
				</p>
				
				<!-- Git SHA-1: ${buildNumber} -->

			</div>
		</div>
	</div>
</footer>
<div class='modal hide fade' id='modal-confirm'>
	<div class='modal-body'>
		<p></p>
	</div>
	<div class='modal-footer'>
		<button class='btn btn-primary confirm'>Ok</button>
		<button aria-hidden='true' class='btn' data-dismiss='modal'>
			Cancel</button>
	</div>
</div>

<div aria-hidden='true' aria-labelledby='title' class='modal hide fade'
	id='loading-modal' role='dialog' tabindex='-1'>
	<div class='modal-header'>
		<button aria-hidden='true' class='close' data-dismiss='modal'>
			&#10005;</button>
		<h3 id='title'>Please wait...</h3>
	</div>
	<div class='modal-body'>
		<div class='loading'>
			<div class='progress progress-striped active'>
				<div class='bar' style='width: 100%;'></div>
			</div>
		</div>
	</div>
</div>

<div class='modal modal-nomad-demo-player hide fade'
	id='modal-nomad-demo-player'>
	<div class='modal-header'>
		<button aria-hidden='true' class='close' data-dismiss='modal'>
			&#10005;</button>
		<h3 id='title'>
			<span class="translation_missing"
				title="translation missing: en.labels.demo">Demo</span>
		</h3>
	</div>
	<div class='modal-body'>
		<div id='nomad_demo_player'></div>
	</div>
</div>

<div aria-hidden='true' aria-labelledby='title' class='modal hide fade'
	id='privacy-policy-modal' role='dialog' tabindex='-1'>
	<div class='modal-header'>
		<button aria-hidden='true' class='close' data-dismiss='modal'>
			&#10005;</button>
		<h3 id='title'>Privacy Policy</h3>
	</div>
	<div class='modal-body'>
		<p>Protecting your privacy and the confidentiality of your
			personal information has always been fundamental to the way we do
			business and is the responsibility of every employee of BBD. Our
			range of products and services we offer our groups and benefit plan
			participants continues to expand and the technology we use continues
			to change. But, no matter how our business changes we are committed
			to protecting and respecting your right to privacy and
			confidentiality.</p>
		<h4>Our Commitment to Privacy</h4>
		<p>
		<p>Benefits by Design (BBD) is committed to the protection of any
			personal information collected by it or in its custody, including any
			information transferred to a third party to fulfill the purposes for
			which the information was collected.</p>
		<p>Personal information includes any information, recorded or not,
			about an identifiable individual. Examples of personal information
			that are identifiable include names, age, sex, social insurance
			numbers, health status, health history, financial information,
			benefit claims data, etc. It also includes information which can be
			matched with other information in order to establish an individual's
			identity.</p>
		</p>
		<h4>BBD's Privacy Code</h4>
		<p>
		<p>Our privacy code outlines our policies and procedures on
			privacy and describes the ways we ensure that your privacy and the
			confidentiality of your personal information is protected. It is
			based on the ten privacy principles outlined in Canada's Personal
			Information Protection and Electronic Documents Act also known as
			PIPEDA. Our adoption of these principles sends a powerful message to
			the general public that we have policies and procedures in place that
			control the collection, use and disclosure of personal information;
			it also reinforces our existing commitment to customer service.</p>
		<p>Our privacy code balances the privacy rights of our groups and
			benefit plan participants, and our employees with the legitimate
			information requirements to provide customer service and to meet our
			human resource requirements. It consists of the following key
			principles:</p>
		<p>We ask for your personal information for the following
			purposes:</p>
		<ul>
			<li>To establish your identification.</li>
			<li>To provide you and/or your dependants with the applicable
				benefit coverage.</li>
			<li>To protect you and us from error and fraud</li>
			<li>To provide ongoing access to other services of BBD</li>
		</ul>
		<h5>1. Consent</h5>
		<p>When you first become a group and benefit plan participant of
			BBD, your personal information is obtained and used only with your
			consent. We obtain your consent before we:</p>
		<ul>
			<li>provide benefit coverage.</li>
			<li>offer you other BBD services.</li>
			<li>obtain, use or disclose to other persons, information about
				you unless we are obliged to do so by law or to protect our
				interests.</li>
			<li>use your personal information in any way we did not inform
				you about previously.</li>
		</ul>
		<p>Your consent can be either express or implied. Express consent
			can be verbal or written. For example, when you sign an enrollment
			form you are giving us written consent to use your personal
			information to provide you and/or your dependents with benefits.</p>
		<p>Consent can be implied or inferred from certain actions. For
			example, if you present your benefit identification card to a
			pharmacist/dentist in lieu of paying for a prescription/dental
			procedure, it can be implied as consent for the pharmacist/dentist to
			provide your personal information to BBD to obtain payment for the
			service rendered, and for BBD to process the related claim for
			payment and provide other services.</p>
		<p>For our existing groups and benefit plan participants, we will
			continue to use and disclose your personal information previously
			collected in accordance with our current privacy code, unless you
			inform us otherwise. We will infer that consent has been obtained for
			the continued use or disclosure of your personal information by the
			processing of any existing or future benefit claims that you submit
			for reimbursement or access to other services.</p>
		<h5>2. Withdrawal of Consent</h5>
		You can withdraw your consent any time after you've given it to us,
		provided there are no legal or regulatory requirements to prevent
		this. If you don't consent to certain uses of personal information, or
		if you withdraw your consent, we will not be able to administer your
		benefit coverage. If so, we will explain the situation to you to help
		you with your decision.<br />
		<h5>3. Exceptions to Consent</h5>
		We may collect, use or disclose personal information without your
		consent only;<br />
		<ol type="a">
			<li>for an emergency that threatens your life, health or
				security. We will subsequently inform you of this disclosure.</li>
			<li>if we must disclose personal information for legal reasons.
				We may be compelled to release this information by a court of law or
				other legal or regulatory authority. If so, our policy is to
				disclose the information only to the extent required.</li>
			<li>where collection is required to investigate inappropriate
				activity, such as the submission of fraudulent information, and the
				knowledge and consent of the individual would compromise the
				availability or accuracy of the information.</li>
		</ol>
		<h5>4. We Protect Your Personal Information From Error, Loss and
			Unauthorized Access</h5>
		Our employees who have access to your personal information are made
		aware of how to keep it confidential. As a condition of employment
		with BBD, each employee signs an Agreement requiring all information
		that they have access to be treated confidentially. They are also
		required to participate in annual security and privacy awareness
		training programs. We have security standards to protect our systems
		and your personal information against unauthorized access and use.
		This protects your personal information at all times when it is stored
		in data files or handled by our employees.<br />
		<h5>5. Your Personal Information is Destroyed When It Is No
			Longer Needed</h5>
		We keep your personal information only so long as we need it for the
		products and services you are using, to offer you products and
		services when you are a group and benefit plan participant and for a
		reasonable time thereafter, or to meet any legal, regulatory, or tax
		requirements. We have retention standards, which meet these
		requirements. We destroy your personal information when it is no
		longer needed.<br />
		<h5>6. You Can Obtain and Verify the Accuracy of Your Personal
			Information</h5>
		You can check your personal information to verify its accuracy. To
		update and correct it, and to have any incorrect information removed,
		you must tell your plan sponsor to advise us of these changes. You can
		ask our Client Service Representatives to obtain the personal
		information we hold about you, or do so in person by visiting our
		offices.<br />
		<br /> Please note that we may not be able to provide information
		about you from our records if it contains references to other persons,
		is subject to legal privilege, contains information proprietary to
		BBD, is too costly to retrieve, or cannot be disclosed for other legal
		reasons. If we have obtained information about you from other people,
		upon your request, we will let you know the person or organization we
		got it from.<br />
		<h5>7. We Correct your Personal Information</h5>
		Whenever possible, we will correct any personal information which we
		may have given to an outside organization. If a third party, such as a
		third party benefit plan administrator has given us personal
		information which you tell us is wrong, we will give you the name and
		address of that party so that you can correct the information.<br />
		<h5>8. You can find out to whom we have given information about
			you.</h5>
		If you ask, we will let you know the names of outside companies or
		organizations we've given personal information to, or direct you to
		the appropriate individual to ask for such information.<br />
		<h5>9. We Respond to Your Request Promptly.</h5>
		We will deal quickly with your request to see your personal
		information and always respond to you promptly.<br />
		<h5>10. We protect other people's privacy when we make personal
			information available to you.</h5>
		There may be files that include information about you and other
		benefit plan participants, or that have information confidential to
		BBD or are the property of BBD. Because we must protect everyone's
		confidentiality and legal rights, we cannot make these files available
		to persons outside of BBD. However, we will make available to you any
		factual information about you contained in such files.<br />
		<h5>11. We monitor our compliance with the BBD Privacy Code and
			are committed to upholding this Code.</h5>
		We have policies and procedures in place to assist our employees in
		adhering to the BBD Privacy Code. Our internal audit department
		monitors the adherence to this Code on a regular basis, and reports
		its findings to a Committee of the Board of Directors of BBD.<br />
		<br /> If you have any questions or complaints about our Privacy Code,
		or about how we are living up to them, let us know right away.<br />
		<h5>12. Resolving Your Concerns Are Important To Us</h5>
		BBD is committed to treating you with the greatest respect and
		consideration, and providing the highest level of service. If you have
		any concerns or questions about privacy and confidentiality - or any
		other concerns about the way a request for personal information was
		handled, you can take the following actions: <br />
		<br /> Contact the BBD Privacy Officer <br />
		<br /> Write to: Privacy Officer<br /> Benefits by Design Ltd.<br />
		500 - 2755 Lougheed Highway<br /> Port Coquitlam, BC V3B 5Y9<br /> <br />
		The BBD Privacy Officer's office will acknowledge your complaint.
		Within two weeks of receiving your enquiry, the BBD Privacy Officer
		will write or call to tell you the problem has been resolved, or, in
		more complex cases, advise you what further steps are being taken and
		when you may expect a resolution.<br />
		<h5>13. If Your Concern Remains Unresolved</h5>
		If your concern remains unresolved, please contact:<br />
		<br /> The Office of the Privacy Commissioner of Canada<br /> 112 Kent
		Street<br /> Ottawa, Ontario<br /> K1A 1H3<br /> <br /> Telephone:
		1-613-995-8210<br /> Toll Free: 1-800-282-1376<br /> Fax:
		1-613-947-6850<br /> Web Site: <a href="http://www.privcom.gc.ca"
			target="_blank">www.privcom.gc.ca</a><br />
		</p>
	</div>
	<div class='modal-footer'>
		<button aria-hidden='true' class='btn btn-primary confirm'
			data-dismiss='modal'>Ok</button>
		<button aria-hidden='true' class='btn' data-dismiss='modal'>
			Cancel</button>
	</div>
</div>

<div aria-hidden='true' aria-labelledby='title' class='modal hide fade'
	id='legal-notice-modal' role='dialog' tabindex='-1'>
	<div class='modal-header'>
		<button aria-hidden='true' class='close' data-dismiss='modal'>
			&#10005;</button>
		<h3 id='title'>Legal Notices and Disclaimers of Liability</h3>
	</div>
	<div class='modal-body'>
		<h5>Ownership and Copyrights</h5>
		<p>This web site ("Website") is operated by or on behalf of
			Benefits by Design (BBD). All content on this Website is the
			copyrighted property of BBD and/or its various third party providers
			and distributors. Except to the extent that you have been granted
			express prior permission from BBD, none of the content or data found
			on the Website may be reproduced, republished, distributed, sold,
			transferred, modified, posted, transmitted or distributed. You may
			download, display and print the materials presented on this Website
			for your personal use.</p>

		<h5>Trademarks</h5>
		<p>Certain names, words, titles, phrases, logos, icons, graphics
			or designs in the pages of this Website may constitute trade names,
			registered or unregistered trade-marks or service marks
			("Trade-marks") of BBD and used under license by BBD. However, the
			display of Trademarks on pages at this Website does not imply that
			any license has been granted to any third party.</p>
		<p>Any unauthorized downloading, re-transmission, or other copying
			or modification of Trademarks or other contents of this Website may
			be a violation of statutory or common law rights which could subject
			the violator to legal action.</p>

		<h5>Use of the Website</h5>
		<p>You represent, warrant and covenant that your use of the
			Website shall not:</p>
		<ol type="1">
			<li>Violate any applicable local, provincial, state, national or
				international law, statute, ordinance, rule or regulation;</li>
			<li>Interfere with or disrupt computer networks connected to the
				Website;</li>
			<li>Impersonate any other person or entity, or make any
				misrepresentation as to your employment by or affiliation with any
				other person or entity;</li>
			<li>Forge headers or in any manner manipulate identifiers in
				order to disguise the origin of any user information;</li>
			<li>Upload, post, transmit, publish, or distribute any material
				or information for which you do not have all necessary rights and
				licenses;</li>
			<li>Upload, post, transmit, publish or distribute any material
				which infringes, violates, breaches or otherwise contravenes the
				rights of any third party, including any copyright, trademark,
				patent, rights of privacy or publicity or any other proprietary
				right;</li>
			<li>Interfere with or disrupt the use of the Website by any
				other user, nor "stalk", threaten, or in any manner harass another
				user;</li>
			<li>Upload, post, transmit, publish, or distribute any material
				or information which contains a computer virus, or other code, files
				or programs intending in any manner to disrupt or interfere with the
				functioning of the Website, or that of other computer systems;</li>
			<li>Use the Website in such a manner as to gain unauthorized
				entry or access to the computer systems of others;</li>
			<li>Upload, post, transmit, publish or distribute any material
				or information which constitutes or encourages conduct that would
				constitute a criminal offence, give rise to other liability, or
				otherwise violate applicable law;</li>
			<li>Upload, post, transmit, publish, or distribute any material
				or information that is unlawful, or which may potentially be
				perceived as being harmful, threatening, abusive, harassing,
				defamatory, libelous, vulgar, obscene, or racially, ethnically, or
				otherwise objectionable;</li>
			<li>Reproduce, copy, modify, sell, store, distribute or
				otherwise exploit for any commercial purposes the Website, or any
				component thereof (including, but not limited to any materials or
				information accessible through the Website);</li>
			<li>Use any device, software or routine to interfere or attempt
				to interfere with the proper working of the Website; or</li>
			<li>Take any action that imposes an unreasonable or
				disproportionately large load on the Website infrastructure.</li>
		</ol>

		<h5>Secure Areas</h5>
		<p>Some of the areas of the Website ("Secure Areas") require
			passwords or other forms of access control in order for a user to
			gain access and use the Website's functionality. If you are permitted
			to access and use one of the Secure Areas of the Website, it is your
			responsibility to keep your password or other access control
			methodology private so that it cannot be used by others. BBD will not
			be liable for any damages, losses or expenses suffered by you or any
			third party as a result of any unauthorized person gaining access to
			any of the Secure Areas through use of your password or other access
			methodology, and you agree that you will indemnify BBD for any
			damages, losses or expenses that it may suffer, including any claims
			made against BBD by third parties, as a result of such access or use
			by an unauthorized person.</p>

		<h5>Limitation of Liability</h5>
		<p>In no event will BBD be liable for any damages, including
			without limitation direct or indirect, special, incidental, or
			consequential or punitive damages, losses or expenses, whether or not
			BBD, or representatives thereof, are advised of the possibility of
			such damages, losses or expenses, arising in connection with:</p>
		<ol type="1">
			<li>Your use of, or inability to use, this Website.</li>
			<li>Use of this Website, or inability to use, by any other
				party.</li>
			<li>Any failure of performance, error, omission, interruption,
				defect, delay in operation or transmission, computer virus or line
				or system failure, loss of data or otherwise.</li>
			<li>The communication by you of any confidential or sensitive
				information, or our communication to you of such information, over
				the Internet.</li>
		</ol>

		<h5>Information and Availability</h5>
		<p>Information on the public areas of this Website is for
			informational purposes only and is not intended to provide financial,
			legal, accounting or tax advice and should not be relied upon in that
			regard.</p>
		<p>Information provided by BBD on its Website is believed to be
			accurate and reliable, but we cannot guarantee that such information
			is accurate or complete or current at all times. While we endeavour
			to keep the information current, such information is subject to
			change at any time without notice.</p>
		<p>BBD makes reasonable commercial efforts to make the Website
			available, however, it is not responsible for any service
			interruptions. BBD will not be liable for any loss resulting from a
			cause over which it does not have direct control, including, but not
			limited to, failure of electronic or mechanical equipment or
			communication lines, telephone or other interconnect problems,
			computer viruses, unauthorized access, theft, operator errors, severe
			weather, earthquakes, or natural disasters, strikes or other labour
			problems, wars, or governmental restrictions.</p>

		<h5>Links to other websites</h5>
		<p>BBD makes no representations whatsoever about any other web
			site which you may access through this Website. When you access a
			non-BBD web site, it is independent from BBD, and BBD has no control
			over the content on that web site. In addition, a link to a non-BBD
			web site does not mean that BBD endorses or accepts any
			responsibility for the content, or use, of such web site. It is your
			responsibility to take precautions to ensure that whatever you select
			for your use is free of such items as viruses, worms, trojan horses
			and other items of a destructive nature.</p>
		<p>Links from or to web sites outside this Website are meant for
			convenience only. BBD does not review, endorse, approve or control,
			and is not responsible for any web sites linked from or to this
			Website, the content of those web sites, the third parties named
			therein, or their products and services. Linking to any other web
			site is at your sole risk and BBD will not be responsible or liable
			for any damages in connection with such linking. Links to web sites
			offering downloadable software are for convenience only and BBD does
			not endorse any such software and is not responsible or liable for
			any difficulties or consequences associated with downloading the
			software. Use of any such downloaded software is governed by the
			terms of the license agreement, if any, which accompanies or is
			provided with such software.</p>
		<h5>Governing Jurisdiction</h5>
		<p>This Website and your use of it will be governed by and
			construed in accordance with the laws of the Province of Ontario and
			the federal laws of Canada applicable therein, without regard to the
			principles of conflicts of law.</p>

	</div>
	<div class='modal-footer'>
		<button aria-hidden='true' class='btn btn-primary confirm'
			data-dismiss='modal'>Ok</button>
		<button aria-hidden='true' class='btn' data-dismiss='modal'>
			Cancel</button>
	</div>
</div>

<div aria-hidden='true' aria-labelledby='title' class='modal hide fade'
	id='security-notice-modal' role='dialog' tabindex='-1'>
	<div class='modal-header'>
		<button aria-hidden='true' class='close' data-dismiss='modal'>
			&#10005;</button>
		<h3 id='title'>Security</h3>
	</div>
	<div class='modal-body'>
		<p>At Benefits by Design (BBD), information security is
			fundamental to the way we do business and is the responsibility of
			every employee. It is specified in our employment agreements and
			regularly confirmed in writing.</p>
		<p>Whether you choose to access our services online, over the
			telephone, or in person, we follow rigorous security procedures to
			protect your information and transactions against unauthorized
			access, disclosure, alteration and misuse.</p>
		<p>We design Information Security to protect the information, the
			information systems and communications that deliver the information
			from harm resulting from failures of confidentiality, integrity, and
			availability. The following are key principles considered in our
			security processes:</p>
		<ol type="1">
			<li>Accountability: Everyone who accesses BBD information
				systems is responsible for protecting them, and will be held
				accountable for the use of these systems.</li>
			<li>Awareness: Everyone who accesses BBD information systems
				must be aware of the risks and security initiatives.</li>
			<li>Multidisciplinary: Security must be addressed taking into
				consideration both technological and non-technological issues.</li>
			<li>Integration: Security must be co-ordinated and integrated.</li>
			<li>Reassessment: Security must be reassessed periodically.</li>
			<li>Timeliness: Security procedures must provide for monitoring
				and timely response.</li>
			<li>Societal Factors: Ethics must be promoted by respecting the
				rights and interests of others.</li>
		</ol>
		<p>While we do our utmost to ensure security and confidentiality,
			there are steps you can take as well to enhance your security when
			using the Internet and when conducting business online.</p>

		<br />
		<h4>SECURITY IN THE BBD NETWORK</h4>

		<h5>Encryption</h5>
		<p>Many Internet sites are secured through encryption. Encryption
			encodes the information that flows between your computer and our
			computer systems protecting it from unauthorized interception,
			viewing and alteration.</p>
		<p>The transmission of BBD web pages on our Internet site that
			maintain and display your personal information is secured through
			encryption. In addition, personal information forwarded to us through
			these web pages is also secure.</p>

		<h5>Log-on IDs and Passwords</h5>
		<p>Log-on IDs and passwords are used by computer systems and
			websites to verify your identity. A log-on ID and password allow you
			to access services and information specific for your private use.
			Anyone who can access your log-on ID and password can also access
			your information.</p>
		<p>Your log-on ID and password will not be saved and must be
			re-entered each time you log-on to a secured online service page.</p>

		<h5>Tips for Creating Unique Passwords</h5>
		<ol type="1">
			<li>Do not share your passwords with others, including family
				members.</li>
			<li>Use passwords that are difficult for others to guess. For
				example, don't use passwords like your name, the names of family
				members, your address, or any other information that might be found
				in your purse or wallet if lost or stolen.</li>
			<li>Use of short passwords as these are easier for others to
				guess. The longer the password, the more difficult you make it for
				others. Many providers of Internet based services establish
				standards that define and enforce a minimum length for passwords.
				BBD has standards for minimum length of passwords. Our ID and
				password standards are available through our online help functions
				on our website.</li>
			<li>Avoid using the same password for multiple applications or
				Internet services wherever possible. This is particularly important
				for any Internet application where access to your private or
				financial information is enabled.</li>
			<li>Change your passwords frequently.</li>
		</ol>

		<h5>Cookies</h5>
		<p>Cookies are used by BBD to maintain security during a session,
			ensuring that each session is unique and authorized between you and
			BBD's web based systems.</p>

		<h5>BBD does NOT use cookies for the following purposes:</h5>
		<ol type="1">
			<li>To follow the surfing behaviour of visitors once they leave
				BBD websites. Additionally, tracking information that may be
				gathered during a visit to a BBD website will not be used for
				promotional purposes.</li>
			<li>For added security, cookies are not used to remember
				usernames and passwords. You will be required to provide this
				information each time you log-on to a secured online service page.</li>
			<li>BBD does not associate any of the information collected via
				cookies with your personal or financial information.</li>
		</ol>

		<h5>Email comments, questions or responses</h5>
		<p>When you send us an email or ask us to respond to you by email,
			we learn your exact email address and any information you have
			included in the email. We use your email address to acknowledge your
			comments and / or reply to your questions, and we will retain your
			communication and our reply as required under appropriate legal,
			regulatory and BBD business practices. We will never send you an
			email asking for passwords and we will not make your email address
			available to anyone else.</p>
		<p>Email sent or received over the Internet may not be secure and
			we recommend that you use caution when forwarding email messages to
			us.</p>
		<p>If you have any questions regarding the authenticity or
			security of email you have received from BBD, please do not hesitate
			to contact us at 1-800-668-2295.</p>

	</div>
	<div class='modal-footer'>
		<div class='vertical-align middle'>
			<button aria-hidden='true' class='btn btn-primary confirm'
				data-dismiss='modal'>Ok</button>
			<button aria-hidden='true' class='btn' data-dismiss='modal'>
				Cancel</button>
		</div>
	</div>
</div>

</div>

<!-- javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script type="text/javascript"
	src="resources/bootstrap2/js/bootstrap.js"></script>
<script type="text/javascript" src="resources/js/lib/underscore.js"></script>
<script type="text/javascript" src="resources/js/lib/backbone.js"></script>
<script type="text/javascript" src="resources/js/lib/purl.js"></script>
<script type="text/javascript"
	src="resources/js/lib/bootstrapx-clickover.js"></script>
<script type="text/javascript" src="resources/js/lib/bootstrap-sheet.js"></script>
<script type="text/javascript" src="resources/js/lib/bootpag.js"></script>
<c:if test="${js != null && js != ''}">
	<script type="text/javascript" src="resources/js/client.js"></script>
	<script type="text/javascript" src="resources/js/grant.js"></script>
	<script type="text/javascript" src="resources/js/scope.js"></script>
	<script type="text/javascript" src="resources/js/whitelist.js"></script>
	<script type="text/javascript" src="resources/js/dynreg.js"></script>
	<script type="text/javascript" src="resources/js/rsreg.js"></script>
	<script type="text/javascript" src="resources/js/token.js"></script>
	<script type="text/javascript" src="resources/js/admin.js"></script>
</c:if>
<script type="text/javascript" src="resources/js/lib/retina.js"></script>
</body>
</html>
