package br.immunit.controller;

import br.immunit.dao.ControleVacinaDAO;
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

public class LoteCadastraControl extends org.apache.struts.action.Action {
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
        HttpServletRequest request, HttpServletResponse response) 
        throws SQLException{

        String vacina = request.getParameter("vacina");
        String lote = request.getParameter("lote");
        String data = request.getParameter("validade");
        String quantidade = request.getParameter("quantidade");

        int dia;
        int mes;
        int ano;;
        
        if(data.isEmpty()){
            return mapping.findForward(FAIL);
        }else{        
            dia = Integer.parseInt(data.substring(0,2));
            mes = Integer.parseInt(data.substring(3,5));
            ano = Integer.parseInt(data.substring(6,10));
            
            data = ano + "-" + mes + "-" + dia;
            
            DateFormat df = new SimpleDateFormat("yyyy-mm-dd");    
            Calendar c = Calendar.getInstance();
            String anoAtual = df.format(c.getTime()).substring(0, 9);
            
            if(data < Integer.parseInt(anoAtual)){
                JOptionPane.showMessageDialog(null,"Preencha todos os campos.","ImmunIT",JOptionPane.ERROR_MESSAGE);
                return mapping.findForward(FAIL);
            }            
        }
        
        if(lote.equals("") || quantidade.equals(""))
        {
            JOptionPane.showMessageDialog(null,"Preencha todos os campos.","ImmunIT",JOptionPane.ERROR_MESSAGE);
            return mapping.findForward(FAIL);
        }else{ 
            
            int v_Vacina = Integer.parseInt(vacina);
            int l_Lote = Integer.parseInt(lote);
            int l_Qtd = Integer.parseInt(quantidade);
            
            ControleVacinaDAO vc = new ControleVacinaDAO();
            vc.cadastraVacina(v_Vacina, l_Lote, data, l_Qtd);
            JOptionPane.showMessageDialog(null,"Lote cadastrado com sucesso.","ImmunIT",JOptionPane.INFORMATION_MESSAGE);
            return mapping.findForward(SUCCESS);       
        }
    }   
}