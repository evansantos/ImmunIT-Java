package br.immunit.controller;

import br.immunit.dao.UbsDAO;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class UbsEditaCadastroControl extends org.apache.struts.action.Action{

    private static final String SUCCESS = "success";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
        HttpServletRequest request, HttpServletResponse response) 
        throws SQLException{
      
            int cnes = Integer.parseInt(request.getParameter("cnes"));
            String nomeFantasia = request.getParameter("nomefantasia");
            String razaoSocial = request.getParameter("razaosocial");
            String telefone = request.getParameter("telefone");
            String ativo = request.getParameter("ativo");
            
            boolean u_Ativo;
            if(ativo != null){
                u_Ativo = true;
            }else{
                u_Ativo = false;
            }
            
            UbsDAO u = new UbsDAO();
            u.atualizaUBS(cnes,nomeFantasia,razaoSocial,telefone,u_Ativo);
            
            JOptionPane.showMessageDialog(null,"Alteração efetuado com sucesso.","ImmunIT",JOptionPane.INFORMATION_MESSAGE);
            
            return mapping.findForward(SUCCESS);
    }
}
