package br.immunit.controller;

import br.immunit.dao.AplicacaoDAO;
import br.immunit.dao.ControleVacinaDAO;
import br.immunit.dao.UserDAO;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
        
        int lote =  Integer.parseInt(request.getParameter("lote"));
        String login = "LSantos1"; //String login = request.getParameter("login");
        String cSUS = request.getParameter("cartaoSUSOculto");
        int cVacina = Integer.parseInt(request.getParameter("codVacina"));
        
        Calendar c = Calendar.getInstance();
        DateFormat df = new SimpleDateFormat("yyy-MM-dd");    
        String data = df.format(c.getTime()).toString();
        
        if(request.getParameter("cartaoSUSOculto").equals("")){
            JOptionPane.showMessageDialog(null, "Digite o número do cartão SUS para buscar o paciente.");
            return mapping.findForward(FAIL);
        }else{
            
            UserDAO u = new UserDAO();
            String cnes = u.buscaUbsUser(login,0);
            
            int codCnes = Integer.parseInt(cnes);
            long cartaoSUS = Long.parseLong(cSUS);

            AplicacaoDAO a = new AplicacaoDAO();
            a.cadastraVacina(lote, codCnes, cartaoSUS, data);

            JOptionPane.showMessageDialog(null, "Vacina registrada com sucesso.");
            return mapping.findForward(SUCCESS);
            
        }
    }
}