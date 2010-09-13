package org.eclipse.core.resources;

public interface IResource
{

	String DEPTH_INFINITE = "infinite";

	IMarker createMarker(String problem);

}
