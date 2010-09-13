package de.bigsource.zarkov.ant.nested;

import de.bigsource.zarkov.base.ZarkovTask;

public class ScriptLimitParam extends AbstractParam {

	private String _max_recursion_depth;
	public String max_execution_time;
	public ZarkovTask task;
	public String option = "";

	public String toString() {

		if (_max_recursion_depth == null) {
			task.callException("You have to specify max-recursion-depth for " + option);
		}

		if (max_execution_time == null) {
			task.callException("You have to specify max-execution-time for " + option);
		}

		if (_max_recursion_depth != null && max_execution_time != null) {
			return " " + _max_recursion_depth + " " + max_execution_time;
		}
		return "";
	}

	public void setMax_recursion_depth(String value) {
		this._max_recursion_depth = value;
	}

	public void setmax_execution_time(String value) {
		this.max_execution_time = value;
	}
}
