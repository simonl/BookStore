package com.login;

import com.dataAccess.tables.Address;
import com.dataAccess.tables.Client;
import com.dataAccess.tables.User;

public final class NewUserInputs {
	public final User.Input user;
	public final Client.Input client;
	public final Address.Input billing;
	public final Address.Input shipping;
	
	public NewUserInputs(
			final User.Input user,
			final Client.Input client,
			final Address.Input billing,
			final Address.Input shipping) {
		this.user = user;
		this.client = client;
		this.billing = billing;
		this.shipping = shipping;
	}
}