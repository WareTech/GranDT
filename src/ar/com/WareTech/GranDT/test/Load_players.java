package ar.com.WareTech.GranDT.test;

import java.io.RandomAccessFile;

import org.hibernate.criterion.Expression;

import ar.com.WareTech.GranDT.backend.Database;
import ar.com.WareTech.GranDT.middleware.entities.Club;
import ar.com.WareTech.GranDT.middleware.entities.Player;
import ar.com.WareTech.GranDT.middleware.entities.PlayerPosition;

/**
 * @author Augusto (AugustoSoncini@WareTech.com.ar)
 * Company - WareTech TM (www.WareTech.com.ar)
 * Project - GranDT
 */
public class Load_players 
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
    	Database.getCurrentSession().beginTransaction();

		try
    	{
	    	RandomAccessFile randomAccessFile = new RandomAccessFile(
	    			"/Users/augusto/Documents/WareTech/GranDT/GranDT_C2014_Final_Jugadores_Nico.csv",
	    			"r"
	    			);
	    	
	    	String line;
	    	PlayerPosition playerPosition;
	    	Player player;
	    	Club club;
	    	String[] data;
	    	final int LASTNAME = 0;
	    	final int FIRSTNAME = 1;
	    	final int CLUB = 2;
	    	final int POSITION = 3;
	    	final int VALUE = 4;
	    	final int GDT_VALUE = 5;
	    	while ((line = randomAccessFile.readLine()) != null)
	    	{
//	    		APELLIDO;NOMBRE;CLUB;POSICION;VALOR;GDT;;;;;
	    		data = line.trim().split(";");
	    		
	    		playerPosition = getPlayerPosition(data[POSITION].trim());
	    		club = getClub(data[CLUB].trim());

	    		player = new Player();	    		
	    		player.setClub(club);
	    		player.setPosition(playerPosition);
	    		player.setLastname(data[LASTNAME].trim());
	    		player.setFirstname(data[FIRSTNAME].trim());
	    		player.setValue(data[GDT_VALUE].trim());
	    		player.setSelected(Boolean.FALSE);
	    		
	    		System.out.println(player.getFirstname() + " " + player.getLastname());
	    		Database.getCurrentSession().save(player);
	    	}
	    	
	    	randomAccessFile.close();
	    	Database.getCurrentSession().getTransaction().commit();
    	}
    	catch(Exception exception)
    	{
    		exception.printStackTrace();
    		Database.getCurrentSession().getTransaction().rollback();
    	}
    }
    
    static public String toGDTPosition(String position)
    {
    	if ("ARQ".equals(position)) return "Arquero";
    	if ("DEF".equals(position)) return "Defensor";
    	if ("VOL".equals(position)) return "Volante";
    	if ("DEL".equals(position)) return "Delantero";
    	
    	throw new RuntimeException("Undefined position: " + position);
    }

    static public String toGDTClub(String club)
    {
//    	if ("DEL".equals(club)) return "All Boys";
//    	if ("DEL".equals(club)) return "Argentinos";
//    	if ("DEL".equals(club)) return "Arsenal";
//    	if ("DEL".equals(club)) return "Belgrano";
//    	if ("DEL".equals(club)) return "Boca";
//    	if ("DEL".equals(club)) return "Col—n";
//    	if ("DEL".equals(club)) return "Estudiantes";
    	if ("Gimnasia L.P.".equals(club)) return "Gimnasia";
//    	if ("DEL".equals(club)) return "Godoy Cruz";
    	if ("Lanus".equals(club)) return "Lanœs";
//    	if ("DEL".equals(club)) return "Newell's";
//    	if ("DEL".equals(club)) return "Olimpo";
//    	if ("DEL".equals(club)) return "Quilmes";
//    	if ("DEL".equals(club)) return "Racing";
//    	if ("DEL".equals(club)) return "Rafaela";
//    	if ("DEL".equals(club)) return "River";
    	if ("Rosario Ctral.".equals(club)) return "Rosario Central";
//    	if ("DEL".equals(club)) return "San Lorenzo";
//    	if ("DEL".equals(club)) return "Tigre";
    	if ("Velez".equals(club)) return "VŽlez";

    	return club;
    }

    static public PlayerPosition getPlayerPosition(String position)
    {
    	try
    	{
    		String gdtPosition = toGDTPosition(position);
    		return (PlayerPosition) Database.getCurrentSession().createCriteria(PlayerPosition.class).add(Expression.eq("name", gdtPosition)).uniqueResult();
    	}
    	catch(Exception exception)
    	{
    		System.out.println("PlayerPosition not found: " + position);
    		throw new RuntimeException();
    	}
    }

    static public Club getClub(String club)
    {
    	try
    	{
    		return (Club) Database.getCurrentSession().createCriteria(Club.class).add(Expression.eq("name", toGDTClub(club))).uniqueResult();
    	}
    	catch(Exception exception)
    	{
    		System.out.println("Club not found: " + club);
    		throw new RuntimeException();
    	}

    }
}
