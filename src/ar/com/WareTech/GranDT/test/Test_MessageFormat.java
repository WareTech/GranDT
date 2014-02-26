package ar.com.WareTech.GranDT.test;

import java.text.MessageFormat;

/**
 * @author 810683
 *
 */
public class Test_MessageFormat 
{
	/**
	 * @param args
	 * @throws Exception
	 */
	static public void main(
			String[] args
			)
		throws Exception
	{
		MessageFormat messageFormat = new MessageFormat("Se realizó el cambio {0} de {1} {2} ({3}) x {4} {5} ({6})");
		System.out.println(
				messageFormat.format(new Object[]{"A", "B", "C", "D"})
				);

		System.out.println(
				messageFormat
				);
	}
}
