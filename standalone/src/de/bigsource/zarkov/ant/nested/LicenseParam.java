package de.bigsource.zarkov.ant.nested;

public class LicenseParam extends AbstractParam {

	private String _product_name = "";
	private String _license_key = "";

	public String toString() {
		return _product_name+" "+_license_key;
	}

	public void setProduct_name(String product_name) {
		this._product_name = product_name;
	}

	public void setLicense_key(String license_key) {
		this._license_key = license_key;
	}
}
