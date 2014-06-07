package br.immunit.model;

public class ControleVacinaModel {
 
    private int codigo;
    private String nomeVacina;
    private String validade;
    private int quantidade;

    /**
     * @return the codigo
     */
    public int getCodigo() {
        return codigo;
    }

    /**
     * @param codigo the codigo to set
     */
    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

   /**
     * @return the nomeVacina
     */
    public String getNomeVacina() {
        return nomeVacina;
    }

    /**
     * @param nomeVacina the nomeVacina to set
     */
    public void setNomeVacina(String nomeVacina) {
        this.nomeVacina = nomeVacina;
    }

    /**
     * @return the validade
     */
    public String getValidade() {
        return validade;
    }

    /**
     * @param validade the validade to set
     */
    public void setValidade(String validade) {
        this.validade = validade;
    }

    /**
     * @return the quantidade
     */
    public int getQuantidade() {
        return quantidade;
    }

    /**
     * @param quantidade the quantidade to set
     */
    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }
    
}
