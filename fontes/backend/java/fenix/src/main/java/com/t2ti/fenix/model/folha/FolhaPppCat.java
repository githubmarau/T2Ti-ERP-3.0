/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FOLHA_PPP_CAT] 
                                                                                
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
package com.t2ti.fenix.model.folha;

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
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="FOLHA_PPP_CAT")
@NamedQuery(name="FolhaPppCat.findAll", query="SELECT t FROM FolhaPppCat t")
public class FolhaPppCat implements Serializable {
	private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    @Column(name="NUMERO_CAT")
	private Integer numeroCat;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_AFASTAMENTO")
	private Date dataAfastamento;

    @Temporal(TemporalType.DATE)
	@Column(name="DATA_REGISTRO")
	private Date dataRegistro;

    @ManyToOne
	@JsonIgnore
	@JoinColumn(name="ID_FOLHA_PPP")
    private FolhaPpp folhaPpp;

	public FolhaPppCat() {
		//construtor padrão
	}

    public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    public Integer getNumeroCat() {
		return this.numeroCat;
	}

	public void setNumeroCat(Integer numeroCat) {
		this.numeroCat = numeroCat;
	}

    public Date getDataAfastamento() {
		return this.dataAfastamento;
	}

	public void setDataAfastamento(Date dataAfastamento) {
		this.dataAfastamento = dataAfastamento;
	}

    public Date getDataRegistro() {
		return this.dataRegistro;
	}

	public void setDataRegistro(Date dataRegistro) {
		this.dataRegistro = dataRegistro;
	}

    public FolhaPpp getFolhaPpp() {
		return this.folhaPpp;
	}

	public void setFolhaPpp(FolhaPpp folhaPpp) {
		this.folhaPpp = folhaPpp;
	}

		
}