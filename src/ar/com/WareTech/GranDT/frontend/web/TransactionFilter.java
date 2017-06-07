/*
 * Created on 30/07/2007
 *
 * Augusto (AugustoSoncini@WareTech.com.ar)
 * Company: WareTech TM (www.WareTech.com.ar)
 * Project: Mark SRL
 */
package ar.com.WareTech.GranDT.frontend.web;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ar.com.WareTech.GranDT.backend.Database;
import ar.com.WareTech.GranDT.middleware.entities.User;
import ar.com.WareTech.GranDT.middleware.services.SecurityManager;

/**
 * @author Augusto (AugustoSoncini@WareTech.com.ar)
 * Company - WareTech TM (www.WareTech.com.ar)
 * Project - Mark SRL
 */
public class TransactionFilter
	implements javax.servlet.Filter 
{
	/* (non-Javadoc)
	 * @see javax.servlet.Filter#destroy()
	 */
	public void destroy() 
	{
	}

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest, javax.servlet.ServletResponse, javax.servlet.FilterChain)
	 */
	public void doFilter(
			ServletRequest servletRequest, 
			ServletResponse servletResponse,
			FilterChain filterChain
			) 
		throws 
			IOException, 
			ServletException 
	{
		HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
		System.out.println("TransactionFilter:" + httpServletRequest.getRequestURL());
		
		Database.getCurrentSession().beginTransaction();
		filterChain.doFilter(
				servletRequest, 
				servletResponse
				);
		Database.getCurrentSession().getTransaction().commit();
	}

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#init(javax.servlet.FilterConfig)
	 */
	public void init(
			FilterConfig filterConfig
			) 
		throws ServletException 
	{
	}
}