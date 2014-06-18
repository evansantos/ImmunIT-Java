package br.immunit.controller;

import br.immunit.dao.ControleVacinaDAO;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class AplicacaoPesquisaLoteControl extends org.apache.struts.action.Action {
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
        HttpServletRequest request, HttpServletResponse response) 
        throws SQLException{

        HttpSession session = request.getSession();
        
        session.removeAttribute("codVacina");   
        session.removeAttribute("nomeVacina");
        session.removeAttribute("cartaoSUS"); 
        session.removeAttribute("paciente"); 
        
        String vac = request.getParameter("vacina");
        session.setAttribute("cartaoSUS", request.getParameter("cartaoSUS"));
        session.setAttribute("paciente", request.getParameter("paciente"));
        
        if(request.getParameter("cartaoSUS") == null){
            
            session.removeAttribute("codVacina");   
            session.removeAttribute("nomeVacina");
            session.removeAttribute("cartaoSUS"); 
            session.removeAttribute("paciente");
            
            JOptionPane.showMessageDialog(null, "Digite o número do cartão SUS que deseja pesquisar.","ImmunIT", JOptionPane.INFORMATION_MESSAGE);
            return mapping.findForward(FAIL);   
        }else{            
            if(vac.equals(";")){
                
                session.removeAttribute("codVacina");   
                session.removeAttribute("nomeVacina");
                session.removeAttribute("cartaoSUS"); 
                session.removeAttribute("paciente");
                
                JOptionPane.showMessageDialog(null, "Por favor, escolha uma vacina.","ImmunIT", JOptionPane.INFORMATION_MESSAGE);
                return mapping.findForward(FAIL);
            }else{
                String vVacina [] = vac.split(";");

                session.setAttribute("codVacina", vVacina[0]);
                session.setAttribute("nomeVacina", vVacina[1]);

                String codigoVacina = vVacina[0];

                ControleVacinaDAO c = new ControleVacinaDAO();
                if(c.pesquisaLote(Integer.parseInt(codigoVacina))){
                    return mapping.findForward(SUCCESS);
                }else{
                    JOptionPane.showMessageDialog(null, "Não existe lotes cadastrados para essa vacina.","ImmunIT", JOptionPane.INFORMATION_MESSAGE);
                    return mapping.findForward(FAIL);
                }
            }
        }
    }
}