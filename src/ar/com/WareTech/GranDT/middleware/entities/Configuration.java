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
public class Configuration
    extends AbstractPersistentObject
{
	final static public Long STARTED = new Long(1); 
	
    protected String key;
    protected String value;

	/**
	 * @return the key
	 */
	public String getKey() 
	{
		return this.key;
	}

	/**
	 * @param key the key to set
	 */
	public void setKey(
			String key
			)
	{
		this.key = key;
	}

    /**
	 * @return the value
	 */
	public String getValue()
	{
		return this.value;
	}

	/**
	 * @param value the value to set
	 */
	public void setValue(
			String value
			) 
	{
		this.value = value;
	}

}
