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
public class Player
    extends AbstractPersistentObject
{
    protected String firstname;
    protected String lastname;
    protected Integer number;
    protected String value;
    protected Boolean selected;
    protected Club club;
    protected PlayerPosition position;

    /**
	 * @return the firstname
	 */
	public String getFirstname()
	{
		return this.firstname;
	}

	/**
	 * @param firstname the firstname to set
	 */
	public void setFirstname(
			String firstname
			) 
	{
		this.firstname = firstname;
	}

    /**
	 * @return the lastname
	 */
	public String getLastname()
	{
		return this.lastname;
	}

	/**
	 * @param lastname the lastname to set
	 */
	public void setLastname(
			String lastname
			) 
	{
		this.lastname = lastname;
	}

	/**
	 * @return
	 */
	public Integer getNumber()
	{
		return this.number;
	}

	/**
	 * @param number the number to set
	 */
	public void setNumber(
			Integer number
			) 
	{
		this.number = number;
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

	/**
	 * @return
	 */
	public Boolean getSelected()
	{
		return this.selected;
	}

	/**
	 * @param selected the selected to set
	 */
	public void setSelected(
			Boolean selected
			) 
	{
		this.selected = selected;
	}

	/**
	 * @return
	 */
	public Club getClub()
	{
		return this.club;
	}
	
	/**
	 * @param club
	 */
	public void setClub(
			Club club
			)
	{
		this.club = club;
	}

	/**
	 * @return
	 */
	public PlayerPosition getPosition()
	{
		return this.position;
	}
	
	/**
	 * @param position
	 */
	public void setPosition(
			PlayerPosition position
			)
	{
		this.position = position;
	}
}
