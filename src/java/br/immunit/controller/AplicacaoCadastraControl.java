package br.immunit.controller;

import br.immunit.dao.AplicacaoDAO;
import br.immunit.dao.ControleVacinaDAO;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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

        HttpSession session = request.getSession();

        String login = "LSantos1"; //String login = request.getParameter("login");
        String cartaoSUS = request.getParameter("cartaoSUSOculto");
        int codVacina =  Integer.parseInt(request.getParameter("codVacina"));
        
        Calendar c = Calendar.getInstance();
        DateFormat df = new SimpleDateFormat("yyy-MM-dd");    
        String dataSys = df.format(c.getTime()).toString();
        
        if(request.getParameter("cartaoSUSOculto").equals("")){
            JOptionPane.showMessageDialog(null, "Digite o número do cartão SUS para buscar o paciente.");
            return mapping.findForward(FAIL);
        }else{
            
            int codLote;            
            ControleVacinaDAO controle = new ControleVacinaDAO();
            controle.pesquisaLote(codVacina);
            
            
            AplicacaoDAO a = new AplicacaoDAO();
            
            
            
            return mapping.findForward(FAIL);
        }
        
    }
}