package br.immunit.model;

public class CarteirinhaModel {
    
    private String nomeVacina;
    private String dataVacinacao;
    private int codigoLote;
    private String nomeUsuario;
    private String rgUsuario;

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
     * @return the dataVacinacao
     */
    public String getDataVacinacao() {
        return dataVacinacao;
    }

    /**
     * @param dataVacinacao the dataVacinacao to set
     */
    public void setDataVacinacao(String dataVacinacao) {
        this.dataVacinacao = dataVacinacao;
    }

    /**
     * @return the codigoLote
     */
    public int getCodigoLote() {
        return codigoLote;
    }

    /**
     * @param codigoLote the codigoLote to set
     */
    public void setCodigoLote(int codigoLote) {
        this.codigoLote = codigoLote;
    }

    /**
     * @return the nomeUsuario
     */
    public String getNomeUsuario() {
        return nomeUsuario;
    }

    /**
     * @param nomeUsuario the nomeUsuario to set
     */
    public void setNomeUsuario(String nomeUsuario) {
        this.nomeUsuario = nomeUsuario;
    }    

    /**
     * @return the rgUsuario
     */
    public String getRgUsuario() {
        return rgUsuario;
    }

    /**
     * @param rgUsuario the rgUsuario to set
     */
    public void setRgUsuario(String rgUsuario) {
        this.rgUsuario = rgUsuario;
    }

}