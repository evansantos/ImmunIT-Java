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

public class AplicacaoPesquisaControl extends org.apache.struts.action.Action {
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
        HttpServletRequest request, HttpServletResponse response) 
        throws SQLException{

        HttpSession session = request.getSession();
        
        session.removeAttribute("cartaoSUS");        
        session.setAttribute("cartaoSUS", request.getParameter("cartaoSUS"));

        if(request.getParameter("cartaoSUS").equals(""))
        {
            JOptionPane.showMessageDialog(null, "Digite o número do cartão SUS que deseja pesquisar.");
            return mapping.findForward(FAIL);
        }else{
            PacienteDAO p = new PacienteDAO();
            if(p.pesquisaPaciente(0, Long.parseLong(request.getParameter("cartaoSUS").replace(".", "")))){
                return mapping.findForward(SUCCESS);
            }else{
                JOptionPane.showMessageDialog(null, "Paciente não encontrado.");
                return mapping.findForward(FAIL);
            }
        }
    }
}