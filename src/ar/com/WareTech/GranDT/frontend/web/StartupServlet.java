/**
 * 
 */
package ar.com.WareTech.GranDT.frontend.web;

import javax.servlet.http.HttpServlet;

import ar.com.WareTech.GranDT.middleware.services.WeekService;

/**
 * @author Augusto
 *
 */
public class StartupServlet 
	extends HttpServlet 
{
	/**
	 * 
	 */
	public StartupServlet() 
	{
		new WeekService().start();
	}

	
}
