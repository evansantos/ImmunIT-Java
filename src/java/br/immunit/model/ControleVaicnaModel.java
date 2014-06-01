package br.immunit.model;

public class ControleVaicnaModel {
 
    private int codigo;
    private int codigoVacina;
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
     * @return the vacina
     */
    public int getVacina() {
        return codigoVacina;
    }

    /**
     * @param codigoVacina the vacina to set
     */
    public void setVacina(int codigoVacina) {
        this.codigoVacina = codigoVacina;
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
