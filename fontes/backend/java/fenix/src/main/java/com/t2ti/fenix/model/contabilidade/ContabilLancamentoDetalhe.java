/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CONTABIL_LANCAMENTO_DETALHE] 
                                                                                
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
package com.t2ti.fenix.model.contabilidade;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import java.math.BigDecimal;

@Entity
@Table(name="CONTABIL_LANCAMENTO_DETALHE")
@NamedQuery(name="ContabilLancamentoDetalhe.findAll", query="SELECT t FROM ContabilLancamentoDetalhe t")
public class ContabilLancamentoDetalhe implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="ID_CONTABIL_CONTA")
	private Integer idContabilConta;

    @Column(name="ID_CONTABIL_HISTORICO")
	private Integer idContabilHistorico;

    @Column(name="ID_CONTABIL_LANCAMENTO_CAB")
	private Integer idContabilLancamentoCab;

    @Column(name="HISTORICO")
	private String historico;

    @Column(name="VALOR")
	private BigDecimal valor;

    @Column(name="TIPO")
	private String tipo;

	public ContabilLancamentoDetalhe() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getIdContabilConta() {
		return this.idContabilConta;
	}

	public void setIdContabilConta(Integer idContabilConta) {
		this.idContabilConta = idContabilConta;
	}

    public Integer getIdContabilHistorico() {
		return this.idContabilHistorico;
	}

	public void setIdContabilHistorico(Integer idContabilHistorico) {
		this.idContabilHistorico = idContabilHistorico;
	}

    public Integer getIdContabilLancamentoCab() {
		return this.idContabilLancamentoCab;
	}

	public void setIdContabilLancamentoCab(Integer idContabilLancamentoCab) {
		this.idContabilLancamentoCab = idContabilLancamentoCab;
	}

    public String getHistorico() {
		return this.historico;
	}

	public void setHistorico(String historico) {
		this.historico = historico;
	}

    public BigDecimal getValor() {
		return this.valor;
	}

	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}

    public String getTipo() {
		return this.tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

		
}