package ocaml;

import org.eclipse.imp.pdb.facts.IList;
import org.eclipse.imp.pdb.facts.IString;
import org.eclipse.imp.pdb.facts.IValue;
import org.eclipse.imp.pdb.facts.IValueFactory;

public class Util {
	
	private IValueFactory vf;

	public Util(IValueFactory vf) {
		this.vf = vf;
	}
	
	private int hex(String s) {
		s = s.substring(1, s.length() - 1);
		System.out.println(s);
		if(s.startsWith("\\") && s.length() == 4) {
			return Integer.parseInt(s.substring(1));
		} 
		else if(s.equals("\\t")) {
			return (int) '\t';
		} 
		else if(s.equals("\\n")) {
			return (int) '\n';
		}
		else if(s.equals("\\r")) {
			return (int) '\r';
		}
		else if(s.equals("\\b")) {
			return (int) '\b';
		}
		else if(s.equals("\\'")) {
			return (int) '\'';
		}
		return s.charAt(0);
	}
	
	private String getString(int i) {
		String result = Integer.toHexString(i);
		if(result.length() == 1) {
			result = "0" + result;
		}
		return result;
	}
	
	public IString toHex(IString s) {
		return vf.string(getString(hex(s.getValue())));
	}
	
	public IList toHexList(IString first, IString second) {
		int i = hex(first.getValue());
		int j = hex(second.getValue());
		
		IValue[] array = new IValue[j - i + 1];
		
		for(int k = i; k <= j; k++) {
			array[k - i] = vf.string(getString(k));
		}
		
		return vf.list(array);
	}
	
}
