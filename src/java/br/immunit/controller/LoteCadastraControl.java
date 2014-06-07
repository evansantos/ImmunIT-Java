package br.immunit.controller;

import br.immunit.dao.ControleVacinaDAO;
import br.immunit.dao.UserDAO;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
        throws SQLException, ParseException{

        String vacina = request.getParameter("vacina");
        String lote = request.getParameter("lote");
        String data = request.getParameter("validade");
        String quantidade = request.getParameter("quantidade");
        String login = request.getParameter("login");

        int dia;
        int mes;
        int ano;
        
        if(data.isEmpty()){
            JOptionPane.showMessageDialog(null,"Preencha todos os campos.","ImmunIT",JOptionPane.ERROR_MESSAGE);
            return mapping.findForward(FAIL);
        }else{        
            dia = Integer.parseInt(data.substring(0,2));
            mes = Integer.parseInt(data.substring(3,5));
            ano = Integer.parseInt(data.substring(6,10));
            
            data = ano + "-" + mes + "-" + dia;
            
            Calendar c = Calendar.getInstance();
            DateFormat df = new SimpleDateFormat("yyy-MM-dd");    
            c.add(Calendar.DAY_OF_MONTH, 1);
            String dataSys = df.format(c.getTime()).toString();
            Date dat = df.parse(data);
            Date hoje = df.parse(dataSys);
            
            DateFormat dformat = new SimpleDateFormat("dd/MM/yyyy");            
            
            if((mes < 1 || mes > 12) || (dia < 1 || dia > 31)){
                JOptionPane.showMessageDialog(null,"Por favor, digite uma data válida.","ImmunIT",JOptionPane.ERROR_MESSAGE);
                return mapping.findForward(FAIL);
            }else if(dat.before(hoje)){
                JOptionPane.showMessageDialog(null,"A validade tem que ser maior que " + dformat.format(new Date()) + ".","ImmunIT",JOptionPane.ERROR_MESSAGE);
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
            int u_Cnes;
            
            if(login.equals("Admin")){
                u_Cnes = 1;
            }else{
                UserDAO u = new UserDAO();
                u_Cnes = u.buscaUbsUser(login);
            }
            
            ControleVacinaDAO vc = new ControleVacinaDAO();
            
            if(vc.pesquisaLote(l_Lote)){
                JOptionPane.showMessageDialog(null,"Já existe o cadastro do lote " + l_Lote + ", digite um lote diferente.","ImmunIT",JOptionPane.INFORMATION_MESSAGE);
                return mapping.findForward(FAIL);
            }else{
                vc.cadastraVacina(l_Lote, v_Vacina, data, l_Qtd, u_Cnes);
                JOptionPane.showMessageDialog(null,"Lote cadastrado com sucesso.","ImmunIT",JOptionPane.INFORMATION_MESSAGE);
                return mapping.findForward(SUCCESS);
            }
        }
    }   
}