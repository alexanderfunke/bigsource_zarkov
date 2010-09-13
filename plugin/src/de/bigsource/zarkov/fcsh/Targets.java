package de.bigsource.zarkov.fcsh;

import java.util.ArrayList;
import java.util.HashMap;


public class Targets {

    public static HashMap<String, ArrayList<String>> _targets = new HashMap<String, ArrayList<String>>();
    public static ArrayList<String> _targets9 = new ArrayList<String>();
    public static ArrayList<String> _targets10 = new ArrayList<String>();

    public static boolean targetExists(String id, String version) {
	ArrayList<String> currTargets = Targets._targets.get(version);
	if (currTargets == null) {
	    Targets._targets.put(version, new ArrayList<String>());
	}
	currTargets = Targets._targets.get(version);
	if (currTargets.contains(id)) {
	    return true;
	}
	return false;
    }

    public static void addTarget(String id, String version) {
	ArrayList<String> currTargets = Targets._targets.get(version);
	if (currTargets == null) {
	    Targets._targets.put(version, new ArrayList<String>());
	}
	currTargets = Targets._targets.get(version);
	if (!currTargets.contains(id)) {
	    currTargets.add(id);
	}
    }

    public static int getTarget(String id, String version) {
	return Targets._targets.get(version).indexOf(id);
    }

    public static void clearTargets(String version) {
	Targets._targets.remove(version);
    }

}
