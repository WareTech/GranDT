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
public class User
    extends AbstractPersistentObject
{
    protected String firstname;
    protected String lastname;
    protected String username;
    protected String password;
    protected String email;
    protected Team team;

    /**
	 * @return the firstname
	 */
	public String getFirstname()
	{
		return this.firstname;
	}

	/**
	 * @param firtname the firstname to set
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
	 * @return the username
	 */
	public String getUsername()
	{
		return this.username;
	}

	/**
	 * @param username the username to set
	 */
	public void setUsername(
			String username
			) 
	{
		this.username = username;
	}

	/**
	 * @return the password
	 */
	public String getPassword() 
	{
		return this.password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(
			String password
			) 
	{
		this.password = password;
	}

	/**
	 * @return the email
	 */
	public String getEmail() 
	{
		return this.email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(
			String email
			) 
	{
		this.email = email;
	}

	/**
	 * @return
	 */
	public Team getTeam()
	{
		return this.team;
	}
	
	/**
	 * @param team
	 */
	public void setTeam(
			Team team
			)
	{
		this.team = team;
	}
}
