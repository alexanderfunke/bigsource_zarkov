package de.bigsource.zarkov.ant.nested;

import de.bigsource.zarkov.base.ZarkovTask;
import de.bigsource.zarkov.translations.TranslationUtil;

public class RSLParam extends AbstractParam
{
	
	public ZarkovTask task;
	public String option = "";
	private String _pathElement = "";
	private String _rslUrl = "";
	private String _policyFileUrl1 = "";
	private String _failoverUrl = "";
	private String _policyFileUrl2 = "";
	
	public String toString() {

		if (_pathElement == null) {
			task.callException(TranslationUtil.getTranslation("param.specify_a_value_for")+" " + option);
			return "";
		} else {
			return _pathElement+","+_rslUrl+","+_policyFileUrl1+","+_failoverUrl+","+_policyFileUrl2;
		}
	}
	
	public void setPathElement(String pathElement)
	{
		_pathElement = pathElement;
	}
	
	public void setRSLUrl(String rslUrl)
	{
		_rslUrl = rslUrl;
	}
	
	public void setPolicyFileURL1(String policyFileUrl)
	{
		_policyFileUrl1 = policyFileUrl;
	}
	
	public void setFailoverUrl(String failoverUrl)
	{
		_failoverUrl = failoverUrl;
	}
	
	public void setPolicyFileURL2(String policyFileUrl)
	{
		_policyFileUrl2 = policyFileUrl;
	}
	
}