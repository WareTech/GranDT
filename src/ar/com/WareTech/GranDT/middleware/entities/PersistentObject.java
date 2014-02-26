/*
 * Created on 08/10/2009
 *
 * Augusto (AugustoSoncini@WareTech.com.ar)
 * Company: WareTech TM (www.WareTech.com.ar)
 * Project: GranDT
 */
package ar.com.WareTech.GranDT.middleware.entities;

import java.io.Serializable;

/**
 * @author Augusto (AugustoSoncini@WareTech.com.ar)
 * Company - WareTech TM (www.WareTech.com.ar)
 * Project - GranDT
 */
public interface PersistentObject
    extends Serializable
{
    /**
     * @return
     */
    public Long getId();
    
    /**
     * @param id
     */
    public void setId(Long id);
    
    /**
     * @return
     */
    public Long getVersion();
    
    /**
     * @param version
     */
    public void setVersion(Long version);
}
