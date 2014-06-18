package br.immunit.controller;

import br.immunit.dao.EnderecoDAO;
import br.immunit.dao.UbsDAO;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
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

        String cnes = request.getParameter("cnesOculto");
        String nomeFantasia = request.getParameter("nomefantasiaOculto");
        String razaoSocial = request.getParameter("razaosocialOculto");
        String telefone = request.getParameter("telefoneOculto");
        String cep = request.getParameter("cepOculto");
        String endereco = request.getParameter("endereco");
        String numero = request.getParameter("numero");
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");
        String estado = request.getParameter("estado");
        String ativo = request.getParameter("ativo");

        HttpSession session = request.getSession();
        
        if(cnes.equals("") || nomeFantasia.equals("") || razaoSocial.equals("") || 
                cep.equals("") || endereco.equals("") || numero.equals("") ||  
                bairro.equals("") || cidade.equals("") || estado.equals(""))
        {
            
            JOptionPane.showMessageDialog(null,"Preencha todos os campos.","ImmunIT",JOptionPane.INFORMATION_MESSAGE);
            
            session.setAttribute("cnes", request.getParameter("cnesOculto"));
            session.setAttribute("nomeFantasia", request.getParameter("nomefantasiaOculto"));
            session.setAttribute("razaoSocial", request.getParameter("razaosocialOculto"));
            session.setAttribute("telefone", request.getParameter("telefoneOculto"));
            session.setAttribute("cep", request.getParameter("cepOculto"));
            session.setAttribute("endereco", request.getParameter("endereco"));
            session.setAttribute("numero", request.getParameter("numero"));
            session.setAttribute("bairro", request.getParameter("bairro"));
            session.setAttribute("cidade", request.getParameter("cidade"));
            session.setAttribute("estado", request.getParameter("estado"));
            
            return mapping.findForward(FAIL);
        
        }else{
            
            UbsDAO u = new UbsDAO();
            int u_Cnes = Integer.parseInt(cnes);
            
            if(u.pesquisaUBS(u_Cnes)){

                session.removeAttribute("cnes");
                session.removeAttribute("nomeFantasia");
                session.removeAttribute("razaoSocial");
                session.removeAttribute("telefone");
                session.removeAttribute("cep");
                session.removeAttribute("endereco");
                session.removeAttribute("numero");
                session.removeAttribute("bairro");
                session.removeAttribute("cidade");
                session.removeAttribute("estado");

                JOptionPane.showMessageDialog(null,"UBS " + cnes + " já está cadastrada.","ImmunIT",JOptionPane.INFORMATION_MESSAGE);
                return mapping.findForward(FAIL);
                
            }else{

                int u_Numero = Integer.parseInt(numero);

                boolean u_Ativo;
                if(ativo != null){
                    u_Ativo = true;
                }else{
                    u_Ativo = false;
                }

                boolean e_Cadastrado;
                EnderecoDAO e = new EnderecoDAO();                
                e_Cadastrado = e.pesquisa(cep);

                u.cadastraUBS(u_Cnes, nomeFantasia, razaoSocial, telefone, u_Ativo, u_Numero, cep, endereco, 
                              bairro, cidade, estado, e_Cadastrado);

                JOptionPane.showMessageDialog(null,"UBS cadastrada com sucesso.","ImmunIT",JOptionPane.INFORMATION_MESSAGE);
                
                return mapping.findForward(SUCCESS);
            } 
        }
    }
}