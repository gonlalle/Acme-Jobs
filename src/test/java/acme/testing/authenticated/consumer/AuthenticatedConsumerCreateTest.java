package acme.testing.authenticated.consumer;

import org.junit.jupiter.api.Test;

import acme.testing.AcmePlannerTest;

public class AuthenticatedConsumerCreateTest extends AcmePlannerTest{
	
	@Test
	public void createNegativeUnauthorised() {
		super.signIn("authenticated1", "authenticated1");
		super.clickOnMenu("Account", "Become a consumer");
		super.fillInputBoxIn("company", "");
		super.fillInputBoxIn("sector", "");
		super.clickOnSubmitButton("Register");
		super.checkErrorsExist();
	}
	
	@Test
	public void createPositive() {
		super.signIn("authenticated1", "authenticated1");

		super.clickOnMenu("Account", "Become a consumer");
		
		super.fillInputBoxIn("company", "Almendralejo S.L");
		super.fillInputBoxIn("sector", "Industrial Transport");
		
		super.clickOnSubmitButton("Register");

		super.checkLinkExists("Consumer");

		super.signOut();
	}

}
