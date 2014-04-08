package br.immunit.controller;

import br.immunit.dao.UbsDAO;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class UbsCadastraControl extends org.apache.struts.action.Action {
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
        HttpServletRequest request, HttpServletResponse response) 
        throws SQLException{

        String cnes = request.getParameter("cnes");
        String nomeFantasia = request.getParameter("nomefantasia");
        String razaoSocial = request.getParameter("razaosocial");
        String telefone = request.getParameter("telefone");
        String cep = request.getParameter("cep");
        String endereco = request.getParameter("endereco");
        String numero = request.getParameter("numero");
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");
        String estado = request.getParameter("estado");
        String ativo = request.getParameter("ativo");
        String enderecoExiste = request.getParameter("enderecoExiste");

        if(cnes.equals("") || nomeFantasia.equals("") || razaoSocial.equals("") || 
                cep.equals("") || endereco.equals("") || numero.equals("") ||  
                bairro.equals("") || cidade.equals("") || estado.equals(""))
        {
            return mapping.findForward(FAIL);
        }else{
            
            int u_Cnes = Integer.parseInt(cnes);
            int u_Numero = Integer.parseInt(numero);
            
            boolean u_Ativo;
            if(ativo.equals("on")){
                u_Ativo = true;
            }else{
                u_Ativo = false;
            }
            
            boolean e_Cadastrado;
            if(enderecoExiste.equals("1")){
                e_Cadastrado = true;
            }else{
                e_Cadastrado = false;
            }
                
            UbsDAO u = new UbsDAO();
            u.cadastraUBS(u_Cnes, nomeFantasia, razaoSocial, telefone, u_Ativo, u_Numero, cep, endereco, 
                          bairro, cidade, estado, e_Cadastrado);
            
            return mapping.findForward(SUCCESS);
        }
    }
}