/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [GED_DOCUMENTO_DETALHE] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2020 T2Ti.COM                                          
                                                                                
Permission is hereby granted, free of charge, to any person                     
obtaining a copy of this software and associated documentation                  
files (the "Software"), to deal in the Software without                         
restriction, including without limitation the rights to use,                    
copy, modify, merge, publish, distribute, sublicense, and/or sell               
copies of the Software, and to permit persons to whom the                       
Software is furnished to do so, subject to the following                        
conditions:                                                                     
                                                                                
The above copyright notice and this permission notice shall be                  
included in all copies or substantial portions of the Software.                 
                                                                                
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,                 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES                 
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND                        
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT                     
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,                    
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING                    
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR                   
OTHER DEALINGS IN THE SOFTWARE.                                                 
                                                                                
       The author may be contacted at:                                          
           t2ti.com@gmail.com                                                   
                                                                                
@author Albert Eije (alberteije@gmail.com)                    
@version 1.0.0
*******************************************************************************/
package com.t2ti.fenix.model.ged;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.util.Set;
import javax.persistence.OneToMany;
import com.fasterxml.jackson.annotation.JsonIgnore;
import javax.persistence.CascadeType;

@Entity
@Table(name="GED_DOCUMENTO_DETALHE")
@NamedQuery(name="GedDocumentoDetalhe.findAll", query="SELECT t FROM GedDocumentoDetalhe t")
public class GedDocumentoDetalhe implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="NOME")
	private String nome;

    @Column(name="DESCRICAO")
	private String descricao;

    @Column(name="PALAVRAS_CHAVE")
	private String palavrasChave;

    @Column(name="PODE_EXCLUIR")
	private String podeExcluir;

    @Column(name="PODE_ALTERAR")
	private String podeAlterar;

    @Column(name="ASSINADO")
	private String assinado;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_FIM_VIGENCIA")
	private Date dataFimVigencia;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_EXCLUSAO")
	private Date dataExclusao;

    @ManyToOne
	@JoinColumn(name="ID_GED_TIPO_DOCUMENTO")
    private GedTipoDocumento gedTipoDocumento;

    @OneToMany(mappedBy = "gedDocumentoDetalhe", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<GedVersaoDocumento> listaGedVersaoDocumento;

    @ManyToOne
	@JsonIgnore
	@JoinColumn(name="ID_GED_DOCUMENTO_CABECALHO")
    private GedDocumentoCabecalho gedDocumentoCabecalho;

	public GedDocumentoDetalhe() {
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

    public String getDescricao() {
		return this.descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

    public String getPalavrasChave() {
		return this.palavrasChave;
	}

	public void setPalavrasChave(String palavrasChave) {
		this.palavrasChave = palavrasChave;
	}

    public String getPodeExcluir() {
		return this.podeExcluir;
	}

	public void setPodeExcluir(String podeExcluir) {
		this.podeExcluir = podeExcluir;
	}

    public String getPodeAlterar() {
		return this.podeAlterar;
	}

	public void setPodeAlterar(String podeAlterar) {
		this.podeAlterar = podeAlterar;
	}

    public String getAssinado() {
		return this.assinado;
	}

	public void setAssinado(String assinado) {
		this.assinado = assinado;
	}

    public Date getDataFimVigencia() {
		return this.dataFimVigencia;
	}

	public void setDataFimVigencia(Date dataFimVigencia) {
		this.dataFimVigencia = dataFimVigencia;
	}

    public Date getDataExclusao() {
		return this.dataExclusao;
	}

	public void setDataExclusao(Date dataExclusao) {
		this.dataExclusao = dataExclusao;
	}

    public GedDocumentoCabecalho getGedDocumentoCabecalho() {
		return this.gedDocumentoCabecalho;
	}

	public void setGedDocumentoCabecalho(GedDocumentoCabecalho gedDocumentoCabecalho) {
		this.gedDocumentoCabecalho = gedDocumentoCabecalho;
	}

    public GedTipoDocumento getGedTipoDocumento() {
		return this.gedTipoDocumento;
	}

	public void setGedTipoDocumento(GedTipoDocumento gedTipoDocumento) {
		this.gedTipoDocumento = gedTipoDocumento;
	}

    public Set<GedVersaoDocumento> getListaGedVersaoDocumento() {
		return this.listaGedVersaoDocumento;
	}

	public void setListaGedVersaoDocumento(Set<GedVersaoDocumento> listaGedVersaoDocumento) {
		this.listaGedVersaoDocumento = listaGedVersaoDocumento;
		for (GedVersaoDocumento gedVersaoDocumento : listaGedVersaoDocumento) {
			gedVersaoDocumento.setGedDocumentoDetalhe(this);
		}
	}

		
}