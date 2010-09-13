package de.bigsource.zarkov.views;

import java.util.ArrayList;
import java.util.HashMap;

import org.eclipse.core.runtime.FileLocator;
import org.eclipse.core.runtime.Path;
import org.eclipse.jface.resource.ImageDescriptor;
import org.eclipse.swt.SWT;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.graphics.Image;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Event;
import org.eclipse.swt.widgets.Listener;
import org.eclipse.swt.widgets.Tree;
import org.eclipse.swt.widgets.TreeItem;
import org.eclipse.ui.ISharedImages;
import org.eclipse.ui.PlatformUI;
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

public class ZarkovTargetsView extends ViewPart {
	private Tree tree;
	private Composite _composite;
	private static ArrayList<CompilerItem> _history;
	private static Display _display;
	private static TreeItem _mxmlcitem;
	private static TreeItem _amxmlcitem;
	private static TreeItem _compcitem;
	private static TreeItem _acompcitem;
	private static TreeItem _asdocitem;
	private static TreeItem _aasdocitem;
	private static TreeItem _mtascitem;
	private static TreeItem _adtitem;
	private static TreeItem _adlitem;
	private static TreeItem _haxeitem;
	private static HashMap<String, Object> _targets;

	/**
	 * The constructor.
	 */
	public ZarkovTargetsView() {

	}

	/**
	 * This is a callback that will allow us to create the viewer and initialize
	 * it.
	 */
	public void createPartControl(Composite parent) {

		if (parent != null) {
			_composite = parent;
		}
		ZarkovTargetsView._targets = new HashMap<String, Object>();

		if (ZarkovTargetsView._history == null) {
			ZarkovTargetsView._history = new ArrayList<CompilerItem>();
		}

		_composite.setLayout(new FillLayout());
		tree = new Tree(_composite, SWT.BORDER | SWT.MULTI);
		TreeItem fcshitem = new TreeItem(tree, SWT.NONE);
		fcshitem.setText("FCSH");
		fcshitem.setImage(PlatformUI.getWorkbench().getSharedImages().getImage(ISharedImages.IMG_OBJ_FOLDER));

		TreeItem mxmlcitem = new TreeItem(fcshitem, SWT.NONE);
		mxmlcitem.setText("MXMLC");
		mxmlcitem.setImage(PlatformUI.getWorkbench().getSharedImages().getImage(ISharedImages.IMG_OBJ_FOLDER));

		TreeItem amxmlcitem = new TreeItem(fcshitem, SWT.NONE);
		amxmlcitem.setText("AMXMLC");
		amxmlcitem.setImage(PlatformUI.getWorkbench().getSharedImages().getImage(ISharedImages.IMG_OBJ_FOLDER));

		TreeItem compcitem = new TreeItem(fcshitem, SWT.NONE);
		compcitem.setText("COMPC");
		compcitem.setImage(PlatformUI.getWorkbench().getSharedImages().getImage(ISharedImages.IMG_OBJ_FOLDER));

		TreeItem acompcitem = new TreeItem(fcshitem, SWT.NONE);
		acompcitem.setText("ACOMPC");
		acompcitem.setImage(PlatformUI.getWorkbench().getSharedImages().getImage(ISharedImages.IMG_OBJ_FOLDER));

		TreeItem asdocitem = new TreeItem(tree, SWT.NONE);
		asdocitem.setText("ASDOC");
		asdocitem.setImage(PlatformUI.getWorkbench().getSharedImages().getImage(ISharedImages.IMG_OBJ_FOLDER));

		TreeItem aasdocitem = new TreeItem(tree, SWT.NONE);
		aasdocitem.setText("AASDOC");
		aasdocitem.setImage(PlatformUI.getWorkbench().getSharedImages().getImage(ISharedImages.IMG_OBJ_FOLDER));

		TreeItem mtascitem = new TreeItem(tree, SWT.NONE);
		mtascitem.setText("MTASC");
		mtascitem.setImage(PlatformUI.getWorkbench().getSharedImages().getImage(ISharedImages.IMG_OBJ_FOLDER));

		TreeItem adlitem = new TreeItem(tree, SWT.NONE);
		adlitem.setText("ADL");
		adlitem.setImage(PlatformUI.getWorkbench().getSharedImages().getImage(ISharedImages.IMG_OBJ_FOLDER));

		TreeItem adtitem = new TreeItem(tree, SWT.NONE);
		adtitem.setText("ADT");
		adtitem.setImage(PlatformUI.getWorkbench().getSharedImages().getImage(ISharedImages.IMG_OBJ_FOLDER));

		TreeItem haxeitem = new TreeItem(tree, SWT.NONE);
		haxeitem.setText("HAXE");
		haxeitem.setImage(PlatformUI.getWorkbench().getSharedImages().getImage(ISharedImages.IMG_OBJ_FOLDER));

		fcshitem.setExpanded(true);

		ZarkovTargetsView._display = tree.getDisplay();
		ZarkovTargetsView._mxmlcitem = mxmlcitem;
		ZarkovTargetsView._amxmlcitem = amxmlcitem;
		ZarkovTargetsView._compcitem = compcitem;
		ZarkovTargetsView._acompcitem = compcitem;
		ZarkovTargetsView._asdocitem = asdocitem;
		ZarkovTargetsView._aasdocitem = aasdocitem;
		ZarkovTargetsView._mtascitem = mtascitem;
		ZarkovTargetsView._adtitem = adtitem;
		ZarkovTargetsView._adlitem = adlitem;
		ZarkovTargetsView._haxeitem = haxeitem;

		for (int i = 0; i < ZarkovTargetsView._history.size(); i++) {
			CompilerItem ci = ZarkovTargetsView._history.get(i);

			if (ci != null) {
				if (ci.getCompiler() == "mxmlc") {

					if (_targets.get(ci.getCommand() + "____" + ci.getVersion()) == null) {
						TreeItem item = new TreeItem(_mxmlcitem, SWT.NONE);
						item.setData("ci", ci);
						item.setText(ci.getCommand());

						ImageDescriptor myImage = ImageDescriptor.createFromURL(FileLocator.find(Activator.getDefault()
								.getBundle(), new Path("icons/v" + ci.getVersion() + ".gif"), null));
						item.setImage(new Image(_mxmlcitem.getDisplay(), myImage.getImageData()));

						_targets.put(ci.getCommand() + "____" + ci.getVersion(), null);
					}

				}
				if (ci.getCompiler() == "amxmlc") {

					if (_targets.get(ci.getCommand() + "____" + ci.getVersion()) == null) {
						TreeItem item = new TreeItem(_amxmlcitem, SWT.NONE);
						item.setData("ci", ci);
						item.setText(ci.getCommand());

						ImageDescriptor myImage = ImageDescriptor.createFromURL(FileLocator.find(Activator.getDefault()
								.getBundle(), new Path("icons/v" + ci.getVersion() + ".gif"), null));
						item.setImage(new Image(_amxmlcitem.getDisplay(), myImage.getImageData()));

						_targets.put(ci.getCommand() + "____" + ci.getVersion(), null);
					}

				}
				if (ci.getCompiler() == "compc") {
					if (_targets.get(ci.getCommand() + "____" + ci.getVersion()) == null) {
						TreeItem item = new TreeItem(_compcitem, SWT.NONE);
						item.setData("ci", ci);
						item.setText(ci.getCommand());

						ImageDescriptor myImage = ImageDescriptor.createFromURL(FileLocator.find(Activator.getDefault()
								.getBundle(), new Path("icons/v" + ci.getVersion() + ".gif"), null));
						item.setImage(new Image(_compcitem.getDisplay(), myImage.getImageData()));

						_targets.put(ci.getCommand() + "____" + ci.getVersion(), null);
					}
				}
				if (ci.getCompiler() == "acompc") {
					if (_targets.get(ci.getCommand() + "____" + ci.getVersion()) == null) {
						TreeItem item = new TreeItem(_acompcitem, SWT.NONE);
						item.setData("ci", ci);
						item.setText(ci.getCommand());

						ImageDescriptor myImage = ImageDescriptor.createFromURL(FileLocator.find(Activator.getDefault()
								.getBundle(), new Path("icons/v" + ci.getVersion() + ".gif"), null));
						item.setImage(new Image(_acompcitem.getDisplay(), myImage.getImageData()));

						_targets.put(ci.getCommand() + "____" + ci.getVersion(), null);
					}
				}
				if (ci.getCompiler() == "asdoc") {
					if (_targets.get(ci.getCommand() + "____" + ci.getVersion()) == null) {
						TreeItem item = new TreeItem(_asdocitem, SWT.NONE);
						item.setData("ci", ci);
						item.setText(ci.getCommand());

						ImageDescriptor myImage = ImageDescriptor.createFromURL(FileLocator.find(Activator.getDefault()
								.getBundle(), new Path("icons/v" + ci.getVersion() + ".gif"), null));
						item.setImage(new Image(_asdocitem.getDisplay(), myImage.getImageData()));

						_targets.put(ci.getCommand() + "____" + ci.getVersion(), null);
					}
				}
				if (ci.getCompiler() == "aasdoc") {
					if (_targets.get(ci.getCommand() + "____" + ci.getVersion()) == null) {
						TreeItem item = new TreeItem(_aasdocitem, SWT.NONE);
						item.setData("ci", ci);
						item.setText(ci.getCommand());

						ImageDescriptor myImage = ImageDescriptor.createFromURL(FileLocator.find(Activator.getDefault()
								.getBundle(), new Path("icons/v" + ci.getVersion() + ".gif"), null));
						item.setImage(new Image(_aasdocitem.getDisplay(), myImage.getImageData()));

						_targets.put(ci.getCommand() + "____" + ci.getVersion(), null);
					}
				}
				if (ci.getCompiler() == "mtasc") {
					if (_targets.get(ci.getCommand() + "____" + ci.getVersion()) == null) {
						TreeItem item = new TreeItem(_mtascitem, SWT.NONE);
						item.setData("ci", ci);
						item.setText(ci.getCommand());

						_targets.put(ci.getCommand() + "____" + ci.getVersion(), null);
					}
				}
				if (ci.getCompiler() == "adl") {
					if (_targets.get(ci.getCommand() + "____" + ci.getVersion()) == null) {
						TreeItem item = new TreeItem(_adlitem, SWT.NONE);
						item.setData("ci", ci);
						item.setText(ci.getCommand());

						ImageDescriptor myImage = ImageDescriptor.createFromURL(FileLocator.find(Activator.getDefault()
								.getBundle(), new Path("icons/v" + ci.getVersion() + ".gif"), null));
						item.setImage(new Image(_adlitem.getDisplay(), myImage.getImageData()));

						_targets.put(ci.getCommand() + "____" + ci.getVersion(), null);
					}
				}
				if (ci.getCompiler() == "adt") {
					if (_targets.get(ci.getCommand() + "____" + ci.getVersion()) == null) {
						TreeItem item = new TreeItem(_adtitem, SWT.NONE);
						item.setData("ci", ci);
						item.setText(ci.getCommand());

						ImageDescriptor myImage = ImageDescriptor.createFromURL(FileLocator.find(Activator.getDefault()
								.getBundle(), new Path("icons/v" + ci.getVersion() + ".gif"), null));
						item.setImage(new Image(_adtitem.getDisplay(), myImage.getImageData()));

						_targets.put(ci.getCommand() + "____" + ci.getVersion(), null);
					}
				}
				if (ci.getCompiler() == "haxe") {
					if (_targets.get(ci.getCommand() + "____" + ci.getVersion()) == null) {
						TreeItem item = new TreeItem(_haxeitem, SWT.NONE);
						item.setData("ci", ci);
						item.setText(ci.getCommand());

						ImageDescriptor myImage = ImageDescriptor.createFromURL(FileLocator.find(Activator.getDefault()
								.getBundle(), new Path("icons/v" + ci.getVersion() + ".gif"), null));
						item.setImage(new Image(_haxeitem.getDisplay(), myImage.getImageData()));

						_targets.put(ci.getCommand() + "____" + ci.getVersion(), null);
					}
				}
			}
		}

		tree.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(SelectionEvent e) {
				TreeItem[] selection = tree.getSelection();
				TreeItem[] revisedSelection = new TreeItem[0];
				for (int i = 0; i < selection.length; i++) {
					String text = selection[i].getText();
					if (text.indexOf("1") > 0) {
						TreeItem[] newSelection = new TreeItem[revisedSelection.length + 1];
						System.arraycopy(revisedSelection, 0, newSelection, 0, revisedSelection.length);
						newSelection[revisedSelection.length] = selection[i];
						revisedSelection = newSelection;
					}
				}
				tree.setSelection(revisedSelection);
			}
		});

		tree.addListener(SWT.MouseDoubleClick, new Listener() {

			public void handleEvent(Event event) {

				TreeItem[] selection = tree.getSelection();
				if (selection.length != 1) {
					return;
				} else {
					CompilerItem item = (CompilerItem) selection[0].getData("ci");
					if (item.getCompiler() == "mxmlc") {
						//
						// Mxmlc mxmlc = new Mxmlc();
						// mxmlc.execute(item.getCommand(), item.getVersion());
					}
				}

			}

		});

	}

	public static void addTarget(String p_compiler, ArrayList<String> p_command, String p_version) {
		String options = "";
		for (int i = 0; i < p_command.size(); i++) {
			options += " " + p_command.get(i);
		}
		addTarget(p_compiler, options, p_version);
	}
	public static void addTarget(String p_compiler, String p_command, String p_version) {
		final String compiler = p_compiler;
		final String command = p_command;
		final String version = p_version;
		if (_display != null) {
			_display.syncExec(new Runnable() {
				public void run() {

					CompilerItem ci = new CompilerItem();
					ci.setCompiler(compiler);
					ci.setVersion(version);
					ci.setCommand(command);
					if (compiler == "mxmlc") {

						if (_targets.get(command + "____" + version) == null) {
							TreeItem item = new TreeItem(_mxmlcitem, SWT.NONE);
							item.setData("ci", ci);
							item.setText(command);

							ImageDescriptor myImage = ImageDescriptor.createFromURL(FileLocator.find(Activator
									.getDefault().getBundle(), new Path("icons/v" + version + ".gif"), null));
							item.setImage(new Image(_mxmlcitem.getDisplay(), myImage.getImageData()));

							_targets.put(command + "____" + version, null);
						}

					}
					if (compiler == "amxmlc") {

						if (_targets.get(command + "____" + version) == null) {
							TreeItem item = new TreeItem(_amxmlcitem, SWT.NONE);
							item.setData("ci", ci);
							item.setText(command);

							ImageDescriptor myImage = ImageDescriptor.createFromURL(FileLocator.find(Activator
									.getDefault().getBundle(), new Path("icons/v" + version + ".gif"), null));
							item.setImage(new Image(_amxmlcitem.getDisplay(), myImage.getImageData()));

							_targets.put(command + "____" + version, null);
						}

					}
					if (compiler == "compc") {
						if (_targets.get(command + "____" + version) == null) {
							TreeItem item = new TreeItem(_compcitem, SWT.NONE);
							item.setData("ci", ci);
							item.setText(command);

							ImageDescriptor myImage = ImageDescriptor.createFromURL(FileLocator.find(Activator
									.getDefault().getBundle(), new Path("icons/v" + version + ".gif"), null));
							item.setImage(new Image(_compcitem.getDisplay(), myImage.getImageData()));

							_targets.put(command + "____" + version, null);
						}
					}
					if (compiler == "acompc") {
						if (_targets.get(command + "____" + version) == null) {
							TreeItem item = new TreeItem(_acompcitem, SWT.NONE);
							item.setData("ci", ci);
							item.setText(command);

							ImageDescriptor myImage = ImageDescriptor.createFromURL(FileLocator.find(Activator
									.getDefault().getBundle(), new Path("icons/v" + version + ".gif"), null));
							item.setImage(new Image(_acompcitem.getDisplay(), myImage.getImageData()));

							_targets.put(command + "____" + version, null);
						}
					}
					if (compiler == "asdoc") {
						if (_targets.get(command + "____" + version) == null) {
							TreeItem item = new TreeItem(_asdocitem, SWT.NONE);
							item.setData("ci", ci);
							item.setText(command);

							ImageDescriptor myImage = ImageDescriptor.createFromURL(FileLocator.find(Activator
									.getDefault().getBundle(), new Path("icons/v" + version + ".gif"), null));
							item.setImage(new Image(_asdocitem.getDisplay(), myImage.getImageData()));

							_targets.put(command + "____" + version, null);
						}
					}
					if (compiler == "aasdoc") {
						if (_targets.get(command + "____" + version) == null) {
							TreeItem item = new TreeItem(_aasdocitem, SWT.NONE);
							item.setData("ci", ci);
							item.setText(command);

							ImageDescriptor myImage = ImageDescriptor.createFromURL(FileLocator.find(Activator
									.getDefault().getBundle(), new Path("icons/v" + version + ".gif"), null));
							item.setImage(new Image(_aasdocitem.getDisplay(), myImage.getImageData()));

							_targets.put(command + "____" + version, null);
						}
					}
					if (compiler == "mtasc") {
						if (_targets.get(command + "____" + version) == null) {
							TreeItem item = new TreeItem(_mtascitem, SWT.NONE);
							item.setData("ci", ci);
							item.setText(command);

							ImageDescriptor myImage = ImageDescriptor.createFromURL(FileLocator.find(Activator
									.getDefault().getBundle(), new Path("icons/v" + version + ".gif"), null));
							item.setImage(new Image(_mtascitem.getDisplay(), myImage.getImageData()));

							_targets.put(command + "____" + version, null);
						}
					}
					if (compiler == "adt") {
						if (_targets.get(command + "____" + version) == null) {
							TreeItem item = new TreeItem(_adtitem, SWT.NONE);
							item.setData("ci", ci);
							item.setText(command);

							ImageDescriptor myImage = ImageDescriptor.createFromURL(FileLocator.find(Activator
									.getDefault().getBundle(), new Path("icons/v" + version + ".gif"), null));
							item.setImage(new Image(_adtitem.getDisplay(), myImage.getImageData()));

							_targets.put(command + "____" + version, null);
						}
					}
					if (compiler == "adl") {
						if (_targets.get(command + "____" + version) == null) {
							TreeItem item = new TreeItem(_adlitem, SWT.NONE);
							item.setData("ci", ci);
							item.setText(command);

							ImageDescriptor myImage = ImageDescriptor.createFromURL(FileLocator.find(Activator
									.getDefault().getBundle(), new Path("icons/v" + version + ".gif"), null));
							item.setImage(new Image(_adlitem.getDisplay(), myImage.getImageData()));

							_targets.put(command + "____" + version, null);
						}
					}

				}

			});
		} else {
			if (ZarkovTargetsView._history == null) {
				ZarkovTargetsView._history = new ArrayList<CompilerItem>();
			}
			CompilerItem ci = new CompilerItem();
			ci.setCompiler(compiler);
			ci.setVersion(version);
			ci.setCommand(command);
			_history.add(ci);
		}
	}

	/**
	 * Passing the focus request to the viewer's control.
	 */
	public void setFocus() {
	}
}