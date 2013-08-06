package com.ubc.ca.phaselistener;

import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;
import javax.faces.event.PhaseEvent;
import javax.faces.event.PhaseId;
import javax.faces.event.PhaseListener;
import javax.faces.view.facelets.FaceletContext;
import javax.servlet.http.HttpSession;

public class LoginListener implements PhaseListener{
	 private static final long serialVersionUID = -1L;
	@Override
	public void afterPhase(PhaseEvent event) {
		// TODO Auto-generated method stub
		System.out.println("Inside phase listner");
	
		FacesContext facesContext = event.getFacesContext();
		String currentUser=facesContext.getViewRoot().getViewId();
		boolean isLoginPage = (currentUser.lastIndexOf("index.jsp") > -1);
		HttpSession session = (HttpSession) facesContext.getExternalContext().getSession(false);
		 
		if(session==null){
			System.out.println("session is null");
		NavigationHandler nh = facesContext.getApplication().getNavigationHandler();
		nh.handleNavigation(facesContext, null, "index");
		}
		if (!isLoginPage && (currentUser == null || currentUser == "")) {
		{
			String userId=(String) session.getAttribute("username");
			if(userId==null)
			{
				System.out.println("session is null");
				NavigationHandler nh = facesContext.getApplication().getNavigationHandler();
				nh.handleNavigation(facesContext, null, "index");
			}
		}
		}
		
	}

	@Override
	public void beforePhase(PhaseEvent arg0) {
		
		// TODO Auto-generated method stub
		
	}

	@Override
	public PhaseId getPhaseId() {
		// TODO Auto-generated method stub
		return PhaseId.RESTORE_VIEW;
	}
	

}
