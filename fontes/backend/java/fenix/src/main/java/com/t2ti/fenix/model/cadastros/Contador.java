/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [CONTADOR] 
                                                                                
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
package com.t2ti.fenix.model.cadastros;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="CONTADOR")
@NamedQuery(name="Contador.findAll", query="SELECT t FROM Contador t")
public class Contador implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="CRC_INSCRICAO")
	private String crcInscricao;

    @Column(name="CRC_UF")
	private String crcUf;

    @OneToOne
	@JsonIgnore
	@JoinColumn(name="ID_PESSOA")
    private Pessoa pessoa;
    
//    @OneToOne
//    @NotFound(action = NotFoundAction.IGNORE)
//	  @JoinColumn(name="ID_PESSOA", nullable=true, insertable=false, updatable=false)
//    private ViewPessoaContador viewPessoaContador;

	public Contador() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public String getCrcInscricao() {
		return this.crcInscricao;
	}

	public void setCrcInscricao(String crcInscricao) {
		this.crcInscricao = crcInscricao;
	}

    public String getCrcUf() {
		return this.crcUf;
	}

	public void setCrcUf(String crcUf) {
		this.crcUf = crcUf;
	}

//   public ViewPessoaContador getViewPessoaContador() {
//		return this.viewPessoaContador;
//	}

//	public void setViewPessoaContador(ViewPessoaContador viewPessoaContador) {
//		this.viewPessoaContador = viewPessoaContador;
//	}

    public Pessoa getPessoa() {
		return this.pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}

		
}