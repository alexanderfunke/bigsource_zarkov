package de.bigsource.zarkov.views;


public class CompilerItem  {

	private String _version;
	private String _compiler;
	private String _command;
	
	public void setVersion(String p_version){
		_version = p_version;
	}
	
	public String getVersion(){
		return _version;
	}

	public void setCompiler(String p_compiler) {
		_compiler = p_compiler;
	}
	
	public String getCompiler() {
		return _compiler;
	}
	
	public void setCommand(String p_command) {
		_command = p_command;
	}
	
	public String getCommand() {
		return _command;
	}
	
	public String toString()
	{
		return _compiler+" und "+_command+" und "+_version;
	}

}
