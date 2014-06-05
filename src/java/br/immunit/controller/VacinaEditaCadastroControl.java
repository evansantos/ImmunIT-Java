package br.immunit.controller;

import br.immunit.dao.VacinaDAO;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class VacinaEditaCadastroControl extends org.apache.struts.action.Action{
    
    private static final String SUCCESS = "success";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
        HttpServletRequest request, HttpServletResponse response) 
        throws SQLException{
      
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            String nome = request.getParameter("nome");
            
            VacinaDAO v = new VacinaDAO();
            v.atualizaVacina(codigo, nome);
            
            JOptionPane.showMessageDialog(null, "Alteração efetuado com sucesso.","ImmunIT",JOptionPane.INFORMATION_MESSAGE);
            return mapping.findForward(SUCCESS);
    }
}
