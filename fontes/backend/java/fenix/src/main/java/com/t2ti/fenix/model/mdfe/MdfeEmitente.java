/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [MDFE_EMITENTE] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2021 T2Ti.COM                                          
                                                                                
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
package com.t2ti.fenix.model.mdfe;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name="MDFE_EMITENTE")
@NamedQuery(name="MdfeEmitente.findAll", query="SELECT t FROM MdfeEmitente t")
public class MdfeEmitente implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_MDFE_CABECALHO")
	private Integer idMdfeCabecalho;

    @Column(name="NOME")
	private String nome;

    @Column(name="FANTASIA")
	private String fantasia;

    @Column(name="CNPJ")
	private String cnpj;

    @Column(name="IE")
	private Integer ie;

    @Column(name="LOGRADOURO")
	private String logradouro;

    @Column(name="NUMERO")
	private String numero;

    @Column(name="COMPLEMENTO")
	private String complemento;

    @Column(name="BAIRRO")
	private String bairro;

    @Column(name="CODIGO_MUNICIPIO")
	private String codigoMunicipio;

    @Column(name="NOME_MUNICIPIO")
	private String nomeMunicipio;

    @Column(name="CEP")
	private String cep;

    @Column(name="UF")
	private String uf;

    @Column(name="TELEFONE")
	private String telefone;

    @Column(name="EMAIL")
	private String email;

	public MdfeEmitente() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getIdMdfeCabecalho() {
		return this.idMdfeCabecalho;
	}

	public void setIdMdfeCabecalho(Integer idMdfeCabecalho) {
		this.idMdfeCabecalho = idMdfeCabecalho;
	}

    public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

    public String getFantasia() {
		return this.fantasia;
	}

	public void setFantasia(String fantasia) {
		this.fantasia = fantasia;
	}

    public String getCnpj() {
		return this.cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

    public Integer getIe() {
		return this.ie;
	}

	public void setIe(Integer ie) {
		this.ie = ie;
	}

    public String getLogradouro() {
		return this.logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

    public String getNumero() {
		return this.numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

    public String getComplemento() {
		return this.complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

    public String getBairro() {
		return this.bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

    public String getCodigoMunicipio() {
		return this.codigoMunicipio;
	}

	public void setCodigoMunicipio(String codigoMunicipio) {
		this.codigoMunicipio = codigoMunicipio;
	}

    public String getNomeMunicipio() {
		return this.nomeMunicipio;
	}

	public void setNomeMunicipio(String nomeMunicipio) {
		this.nomeMunicipio = nomeMunicipio;
	}

    public String getCep() {
		return this.cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

    public String getUf() {
		return this.uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

    public String getTelefone() {
		return this.telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

    public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

		
}