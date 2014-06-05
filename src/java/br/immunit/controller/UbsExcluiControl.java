package br.immunit.controller;

import br.immunit.dao.UbsDAO;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class UbsExcluiControl extends org.apache.struts.action.Action{
    
    private static final String SUCCESS = "success";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
        HttpServletRequest request, HttpServletResponse response) 
        throws SQLException{

        UbsDAO u = new UbsDAO();
        int cnes = Integer.parseInt(request.getParameter("cnes"));
        u.excluiUbs(cnes);
        
        JOptionPane.showMessageDialog(null, "UBS excluída com sucesso.");
        return mapping.findForward(SUCCESS);
    }
}
