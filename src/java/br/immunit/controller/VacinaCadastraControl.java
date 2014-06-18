package br.immunit.controller;

import br.immunit.dao.VacinaDAO;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class VacinaCadastraControl extends org.apache.struts.action.Action {
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
        HttpServletRequest request, HttpServletResponse response) 
        throws SQLException{

        String nome = request.getParameter("nome");

        if(nome.equals(""))
        {
            JOptionPane.showMessageDialog(null,"Informe o nome da vacina que deseja cadastrar.","ImmunIT",JOptionPane.INFORMATION_MESSAGE);
            return mapping.findForward(FAIL);
        }else{                      
            VacinaDAO v = new VacinaDAO();
            v.cadastraVacina(nome);
            JOptionPane.showMessageDialog(null,"Vacina cadastrada com sucesso.","ImmunIT",JOptionPane.INFORMATION_MESSAGE);
            return mapping.findForward(SUCCESS);       
        }
    }   
}