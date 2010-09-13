
package org.eclipse.core.resources;



public interface IProject {

	public Object getRawLocation();

	public IMarker[] findMarkers(String problem, boolean b, String depthInfinite);
	public IResource getFile(String filename);

}
