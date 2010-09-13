package de.bigsource.zarkov.views;

import java.util.ArrayList;
import java.util.LinkedList;

import org.eclipse.core.runtime.FileLocator;
import org.eclipse.core.runtime.Path;
import org.eclipse.jface.action.Action;
import org.eclipse.jface.action.IMenuManager;
import org.eclipse.jface.action.IToolBarManager;
import org.eclipse.jface.resource.ImageDescriptor;
import org.eclipse.swt.SWT;
import org.eclipse.swt.custom.LineStyleEvent;
import org.eclipse.swt.custom.LineStyleListener;
import org.eclipse.swt.custom.StyleRange;
import org.eclipse.swt.custom.StyledText;
import org.eclipse.swt.graphics.Font;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Display;
import org.eclipse.ui.IActionBars;
import org.eclipse.ui.part.ViewPart;

import de.bigsource.zarkov.Activator;

/**
 * This sample class demonstrates how to plug-in a new workbench view. The view
 * shows data obtained from the model. The sample creates a dummy model on the
 * fly, but a real implementation would connect to the model available either in
 * this or another plug-in (e.g. the workspace). The view is connected to the
 * model using a content provider.
 * <p>
 * The view uses a label provider to define how model objects should be
 * presented in the view. Each view can present the same model objects using
 * different labels and icons, if needed. Alternatively, a single label provider
 * can be shared between views in order to ensure that objects of the same type
 * are presented in the same way everywhere.
 * <p>
 */

public class ZarkovMonitor extends ViewPart
{
    private StyledText textfield;
    private static StyledText _textfield;
    public static Display _display;
    private static ArrayList<MessageItem> _history;
    private Action action1;

    /**
     * The constructor.
     */
    public ZarkovMonitor()
    {
    }

    /**
     * This is a callback that will allow us to create the viewer and initialize
     * it.
     */
    public void createPartControl(Composite parent)
    {

	if (ZarkovMonitor._history == null)
	{
	    ZarkovMonitor._history = new ArrayList<MessageItem>();
	}

	textfield = new StyledText(parent, SWT.MULTI | SWT.H_SCROLL | SWT.V_SCROLL | SWT.WRAP);
	textfield.setEditable(false);
	textfield.setTopPixel(50000000);
	Font font = new Font(parent.getDisplay(), "Courier", 11, SWT.NORMAL);
	textfield.setFont(font);
	ZarkovMonitor._display = parent.getDisplay();
	ZarkovMonitor._textfield = textfield;
	for (int i = 0; i < ZarkovMonitor._history.size(); i++)
	{
	    MessageItem mi = ZarkovMonitor._history.get(i);
	    _textfield.append(mi.message + "\n");
	}

	textfield.addLineStyleListener(new LineStyleListener()
	{
	    public void lineGetStyle(LineStyleEvent event)
	    {

		String line = event.lineText;
		int cursor = -1;

		LinkedList<StyleRange> list = new LinkedList<StyleRange>();
		while ((cursor = line.indexOf("----------- COMMAND -----------", cursor + 1)) >= 0)
		{
		    list.add(getHighlightStyle(event.lineOffset + cursor, "----------- COMMAND -----------".length()));
		}

		while ((cursor = line.indexOf("----------- OUTPUT -----------", cursor + 1)) >= 0)
		{
		    list.add(getHighlightStyle(event.lineOffset + cursor, "----------- OUTPUT -----------".length()));
		}

		while ((cursor = line.indexOf("----------- FCSH 9 stopped! -----------", cursor + 1)) >= 0)
		{
		    list.add(getHighlightStyle(event.lineOffset + cursor, "----------- FCSH 9 stopped! -----------".length()));
		}

		while ((cursor = line.indexOf("----------- FCSH 10 stopped! -----------", cursor + 1)) >= 0)
		{
		    list.add(getHighlightStyle(event.lineOffset + cursor, "----------- FCSH 10 stopped! -----------".length()));
		}

		while ((cursor = line.indexOf("------------ FCSH 9 started!------------", cursor + 1)) >= 0)
		{
		    list.add(getHighlightStyle(event.lineOffset + cursor, "------------ FCSH 9 started!------------".length()));
		}

		while ((cursor = line.indexOf("------------ FCSH 10 started!------------", cursor + 1)) >= 0)
		{
		    list.add(getHighlightStyle(event.lineOffset + cursor, "------------ FCSH 10 started!------------".length()));
		}

		event.styles = (StyleRange[]) list.toArray(new StyleRange[list.size()]);
	    }
	});

	makeActions();
	contributeToActionBars();
    }

    private StyleRange getHighlightStyle(int startOffset, int length)
    {
	StyleRange styleRange = new StyleRange();
	styleRange.start = startOffset;
	styleRange.length = length;
	styleRange.font = new Font(textfield.getDisplay(), "Courier", 12, SWT.BOLD);
	return styleRange;
    }

    private void contributeToActionBars()
    {
	IActionBars bars = getViewSite().getActionBars();
	fillLocalPullDown(bars.getMenuManager());
	fillLocalToolBar(bars.getToolBarManager());
    }

    private void fillLocalPullDown(IMenuManager manager)
    {
    }

    private void fillLocalToolBar(IToolBarManager manager)
    {
	manager.add(action1);
    }

    private void makeActions()
    {
	action1 = new Action()
	{
	    public void run()
	    {
		ZarkovMonitor.clear();
	    }
	};
	action1.setText("Clear Monitor");
	action1.setToolTipText("Clear Monitor");
	action1.setImageDescriptor(ImageDescriptor.createFromURL(FileLocator.find(Activator.getDefault().getBundle(), new Path("icons/bin.png"), null)));
    }

    /**
     * Passing the focus request to the viewer's control.
     */
    public void setFocus()
    {
    }

    public static void addMessage(String msg)
    {
	final String message = msg;
	if (_display != null)
	{
	    _display.syncExec(new Runnable()
	    {
		public void run()
		{
		    if (_textfield != null)
		    {
			_textfield.append(message + "\n");
			_textfield.setTopPixel(50000000);
		    }
		}
	    });
	}
	else
	{
	    if (ZarkovMonitor._history == null)
	    {
		ZarkovMonitor._history = new ArrayList<MessageItem>();
	    }
	    MessageItem mi = new MessageItem();
	    mi.message = msg;
	    _history.add(mi);
	}
    }

    public static void clear()
    {
	if (_display != null)
	{
	    _display.syncExec(new Runnable()
	    {
		public void run()
		{
		    if (_textfield != null)
		    {
			_textfield.setText("");
			_textfield.setTopPixel(50000000);
		    }
		}
	    });
	}
    }

}