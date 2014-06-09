package br.immunit.controller;

import br.immunit.dao.PacienteDAO;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class AplicacaoCadastraControl extends org.apache.struts.action.Action {
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
        HttpServletRequest request, HttpServletResponse response) 
        throws SQLException{

        String lote = request.getParameter("lote");
        String login = "LSantos1"; //String login = request.getParameter("login");
        String cartaoSUS = request.getParameter("cartaoSUS");
        String paciente = request.getParameter("paciente");        
        
        if(paciente.isEmpty()){
            JOptionPane.showMessageDialog(null, "Digite o número do cartão SUS para buscar o paciente.");
            return mapping.findForward(FAIL);
        }else{
            
            
            
            return mapping.findForward(FAIL);
        }
        
    }
}