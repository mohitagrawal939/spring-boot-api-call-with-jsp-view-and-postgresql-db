package com.teacherobservation.login;

import java.util.HashMap;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.PersistenceContext;
import javax.persistence.StoredProcedureQuery;

import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl {

	@PersistenceContext
    private EntityManager em;
	
    public Map<String, Object> checkUsernameAndPassword(String username, String password) {
    	Map<String, Object> json = new HashMap<>();

        StoredProcedureQuery query = em.createStoredProcedureQuery("checkUserLogin"); 

        query.registerStoredProcedureParameter(1, String.class, ParameterMode.IN);
        query.registerStoredProcedureParameter(2, String.class, ParameterMode.IN);
        query.registerStoredProcedureParameter(3, Integer.class, ParameterMode.OUT);

        query.setParameter(1, username);
        query.setParameter(2, password);

        query.execute();

        Integer outCode = (Integer) query.getOutputParameterValue(3);
    	if(outCode == 1) {
    		json.put("status", outCode);
    		json.put("msg", "Successfully Authenticated");
    	}else {
    		json.put("status", outCode);
    		json.put("msg", "Authentication Failed");
    	}
        return json;
    }

}
