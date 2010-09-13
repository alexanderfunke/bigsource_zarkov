package de.bigsource.zarkov.base;

import org.eclipse.core.resources.IMarker;
import org.eclipse.core.resources.IProject;
import org.eclipse.core.resources.IResource;
import org.eclipse.core.resources.ResourcesPlugin;

public class EclipseUtil
{

	public static void clearProjectProblems()
	{
		IMarker[] problems;
		try
		{
			IProject[] projects = ResourcesPlugin.getWorkspace().getRoot().getProjects();
			for (int i = 0; i < projects.length; i++)
			{
				IProject project = projects[i];
				try
				{
					if (project != null && project.getRawLocation() != null)
					{
						problems = project.findMarkers(IMarker.PROBLEM, true, IResource.DEPTH_INFINITE);
						for (int p = 0; p < problems.length; p++)
						{
							IMarker marker = problems[p];
							if (marker.getAttribute("bigsource") != null && marker.getAttribute("bigsource").equals(true))
							{
								marker.delete();
							}
						}
					}
				} catch (Exception e)
				{
				}
			}
		} catch (Exception e)
		{
		}
	}

}
