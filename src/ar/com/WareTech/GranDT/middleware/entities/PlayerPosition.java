/*
 * Created on 08/10/2009
 *
 * Augusto (AugustoSoncini@WareTech.com.ar)
 * Company: WareTech TM (www.WareTech.com.ar)
 * Project: GranDT
 */
package ar.com.WareTech.GranDT.middleware.entities;


/**
 * @author Augusto (AugustoSoncini@WareTech.com.ar)
 * Company - WareTech TM (www.WareTech.com.ar)
 * Project - GranDT
 */
public class PlayerPosition
    extends AbstractPersistentObject
{
	final static public String ARQUERO   = "Arquero";
	final static public String DEFENSOR  = "Defensor";
	final static public String VOLANTE   = "Volante";
	final static public String DELANTERO = "Delantero";
	
    protected String name;

    /**
	 * @return the name
	 */
	public String getName()
	{
		return this.name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(
			String name
			) 
	{
		this.name = name;
	}

}
