package org.eclipse.core.resources;


public interface IMarker {

	public static final String MARKER = ".marker"; //$NON-NLS-1$
	public static final String TASK = ".taskmarker"; //$NON-NLS-1$
	public static final String PROBLEM = ".problemmarker"; //$NON-NLS-1$
	public static final String TEXT = ".textmarker"; //$NON-NLS-1$
	public static final String BOOKMARK = ".bookmark"; //$NON-NLS-1$
	public static final String SEVERITY = "severity"; //$NON-NLS-1$
	public static final String MESSAGE = "message"; //$NON-NLS-1$
	public static final String LOCATION = "location"; //$NON-NLS-1$
	public static final String PRIORITY = "priority"; //$NON-NLS-1$
	public static final String DONE = "done"; //$NON-NLS-1$
	public static final String CHAR_START = "charStart"; //$NON-NLS-1$
	public static final String CHAR_END = "charEnd"; //$NON-NLS-1$
	public static final String LINE_NUMBER = "lineNumber"; //$NON-NLS-1$
	public static final String TRANSIENT = "transient"; //$NON-NLS-1$
	public static final String USER_EDITABLE = "userEditable"; //$NON-NLS-1$
	public static final String SOURCE_ID = "sourceId"; //$NON-NLS-1$
	public static final int PRIORITY_HIGH = 2;
	public static final int PRIORITY_NORMAL = 1;
	public static final int PRIORITY_LOW = 0;
	public static final int SEVERITY_ERROR = 2;
	public static final int SEVERITY_WARNING = 1;
	public static final int SEVERITY_INFO = 0;

	public void delete();
	public boolean equals(Object object);
	public boolean exists();
	public Object getAttribute(String attributeName);
	public int getAttribute(String attributeName, int defaultValue);
	public String getAttribute(String attributeName, String defaultValue);
	public boolean getAttribute(String attributeName, boolean defaultValue);
	public Object[] getAttributes(String[] attributeNames);
	public long getCreationTime();
	public long getId();
	public IResource getResource();
	public String getType();
	public boolean isSubtypeOf(String superType);
	public void setAttribute(String attributeName, int value);
	public void setAttribute(String attributeName, Object value);
	public void setAttribute(String attributeName, boolean value);
	public void setAttributes(String[] attributeNames, Object[] values);
}
